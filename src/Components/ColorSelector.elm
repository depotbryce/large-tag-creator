module Components.ColorSelector exposing (view)

import Css exposing (focus, hover)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events as Events
import TagColor exposing (TagColor(..))
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


type alias Props msg =
    { selectedColor : TagColor
    , onColorSelected : TagColor -> msg
    }


type Pos
    = First
    | Middle
    | Last


view : Props msg -> Html msg
view props =
    Html.span
        [ css
            [ Tw.isolate
            , Tw.inline_flex
            , Tw.rounded_md
            , Tw.shadow_sm
            ]
        ]
    <|
        List.map (\( color, pos ) -> viewButton props pos color)
            [ ( Green, First )
            , ( Blue, Middle )
            , ( Orange, Middle )
            , ( Yellow, Last )
            ]


viewButton : Props msg -> Pos -> TagColor -> Html msg
viewButton props pos color =
    let
        colorStyles =
            if color == props.selectedColor then
                [ Tw.bg_color (tagColorToLightColor color)
                , Css.hover [ Tw.bg_color (tagColorToMedColor color) ]
                ]

            else
                [ Tw.bg_color Theme.white
                , Css.hover [ Tw.bg_color Theme.gray_50 ]
                ]

        posStyles =
            case pos of
                First ->
                    [ Tw.rounded_l_md ]

                Middle ->
                    [ Tw.neg_ml_px ]

                Last ->
                    [ Tw.rounded_r_md
                    , Tw.neg_ml_px
                    ]
    in
    Html.button
        [ Events.onClick (props.onColorSelected color)
        , css
            (List.concat
                [ [ Tw.relative
                  , Tw.inline_flex
                  , Tw.items_center
                  , Tw.bg_color Theme.white
                  , Tw.px_3
                  , Tw.py_2
                  , Tw.text_sm
                  , Tw.font_semibold
                  , Tw.text_color Theme.gray_900
                  , Tw.capitalize
                  , Tw.ring_1
                  , Tw.ring_inset
                  , Tw.ring_color
                        (tagColorToMedColor props.selectedColor)
                  , Css.hover [ Tw.bg_color Theme.gray_50 ]
                  , Css.focus [ Tw.z_10 ]
                  ]
                , posStyles
                , colorStyles
                ]
            )
        ]
        [ Html.text (TagColor.toStringEn color) ]


tagColorToLightColor : TagColor -> Theme.Color
tagColorToLightColor color =
    case color of
        Green ->
            Theme.green_200

        Blue ->
            Theme.blue_200

        Orange ->
            Theme.orange_200

        Yellow ->
            Theme.yellow_200


tagColorToMedColor : TagColor -> Theme.Color
tagColorToMedColor color =
    case color of
        Green ->
            Theme.green_500

        Blue ->
            Theme.blue_500

        Orange ->
            Theme.orange_500

        Yellow ->
            Theme.yellow_500
