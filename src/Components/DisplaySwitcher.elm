module Components.DisplaySwitcher exposing (view)

import Components.PrintIcon
import Css
import Display exposing (Display(..))
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events as Events
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


view :
    { currentDisplay : Display
    , onDisplayChanged : Display -> msg
    }
    -> Html msg
view { currentDisplay, onDisplayChanged } =
    Html.div
        [ css
            [ Tw.justify_between
            , Tw.inline_flex
            , Tw.items_stretch
            , Tw.border_2
            , Tw.border_color Theme.slate_600
            , Tw.rounded
            , Tw.overflow_hidden
            , Tw.bg_color Theme.white
            , Tw.text_color Theme.slate_800
            ]
        ]
    <|
        List.map
            (\display ->
                Html.button
                    [ Events.onClick (onDisplayChanged display)
                    , css
                        [ Tw.px_4
                        , Tw.py_2
                        , if display == currentDisplay then
                            Css.batch
                                [ Tw.bg_color Theme.slate_600
                                , Tw.text_color Theme.slate_100
                                ]

                          else
                            Css.batch
                                [ Tw.bg_color Theme.transparent
                                , Css.hover [ Tw.bg_color Theme.slate_100 ]
                                , Css.focus [ Tw.bg_color Theme.slate_100 ]
                                ]
                        ]
                    ]
                    [ let
                        styles =
                            [ Tw.flex
                            , Tw.items_center
                            , Tw.gap_2
                            ]
                      in
                      case display of
                        Preview ->
                            Html.div
                                [ css styles ]
                                [ Html.text "Preview" ]

                        TopSlips ->
                            Html.div
                                [ css styles ]
                                [ Html.div [ css [ Tw.h_6, Tw.w_6 ] ]
                                    [ Components.PrintIcon.view ]
                                , Html.text "Top Slips"
                                ]

                        BottomSlips ->
                            Html.div
                                [ css styles ]
                                [ Html.div [ css [ Tw.h_6, Tw.w_6 ] ]
                                    [ Components.PrintIcon.view ]
                                , Html.text "Bottom Slips"
                                ]
                    ]
            )
            Display.all
