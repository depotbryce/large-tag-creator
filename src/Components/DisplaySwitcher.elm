module Components.DisplaySwitcher exposing (view)

import Components.PrintIcon
import Css
import Display exposing (Display)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events as Events
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


type alias Props msg =
    { currentDisplay : Display
    , onDisplayChanged : Display -> msg
    }


type Pos
    = First
    | Middle
    | Last


view : Props msg -> Html msg
view { currentDisplay, onDisplayChanged } =
    let
        contentStyles =
            [ Tw.flex
            , Tw.items_center
            , Tw.gap_2
            ]
    in
    Html.span
        [ css
            [ Tw.inline_flex
            , Tw.rounded_md
            , Tw.isolate
            , Tw.shadow_sm
            ]
        ]
    <|
        List.map
            (\( display, contents ) ->
                viewButton
                    { currentDisplay = currentDisplay
                    , onDisplayChanged = onDisplayChanged
                    }
                    (if display == Display.Preview then
                        First

                     else if display == Display.BottomSlips then
                        Last

                     else
                        Middle
                    )
                    display
                    contents
            )
            [ ( Display.Preview
              , [ Html.div
                    [ css contentStyles ]
                    [ Html.text "Preview" ]
                ]
              )
            , ( Display.TopSlips
              , [ Html.div
                    [ css contentStyles ]
                    [ Html.div [ css [ Tw.h_6, Tw.w_6 ] ]
                        [ Components.PrintIcon.view ]
                    , Html.text "Top Slips"
                    ]
                ]
              )
            , ( Display.BottomSlips
              , [ Html.div
                    [ css contentStyles ]
                    [ Html.div [ css [ Tw.h_6, Tw.w_6 ] ]
                        [ Components.PrintIcon.view ]
                    , Html.text "Bottom Slips"
                    ]
                ]
              )
            ]


viewButton :
    Props msg
    -> Pos
    -> Display
    -> List (Html msg)
    -> Html msg
viewButton props pos display contents =
    let
        colorStyles =
            if display == props.currentDisplay then
                [ Tw.bg_color Theme.slate_600
                , Tw.text_color Theme.white
                , Tw.ring_color Theme.slate_600
                , Css.hover [ Tw.bg_color Theme.slate_500 ]
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
        [ Events.onClick (props.onDisplayChanged display)
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
                        Theme.gray_300
                  , Css.hover [ Tw.bg_color Theme.gray_50 ]
                  , Css.focus [ Tw.z_20 ]
                  ]
                , posStyles
                , colorStyles
                ]
            )
        ]
    <|
        contents
