module Components.ColorSelector exposing (view)

import Css exposing (focus, hover)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events as Events
import TagColor exposing (TagColor(..))
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


view :
    { selectedColor : TagColor
    , onColorSelected : TagColor -> msg
    }
    -> Html msg
view props =
    Html.div
        [ css
            [ Tw.flex
            , Tw.gap_2
            , Tw.w_fit
            , Tw.overflow_hidden
            ]
        ]
    <|
        List.map
            (\color ->
                let
                    bgColor =
                        tagColorToLightColor color

                    borderColor =
                        tagColorToMedColor color
                in
                Html.button
                    [ Events.onClick (props.onColorSelected color)
                    , css
                        [ Tw.appearance_none
                        , Tw.py_2
                        , Tw.border_2
                        , Tw.rounded
                        , Tw.w_24
                        , Tw.capitalize
                        , Tw.h_full
                        , if color == props.selectedColor then
                            Css.batch
                                [ Tw.bg_color bgColor
                                , Tw.border_color borderColor
                                , hover [ Tw.bg_color bgColor ]
                                , focus [ Tw.bg_color bgColor ]
                                ]

                          else
                            Css.batch
                                [ Tw.bg_color Theme.white
                                , Tw.border_color Theme.slate_300
                                , hover [ Tw.bg_color Theme.slate_100 ]
                                , focus [ Tw.bg_color Theme.slate_100 ]
                                ]
                        ]
                    ]
                    [ Html.text (TagColor.toStringEn color) ]
            )
            TagColor.all


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
