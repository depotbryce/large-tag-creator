module Components.HelpDialog exposing (view)

import Components.XIcon
import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events as Events
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


view : { onClose : msg } -> Html msg
view { onClose } =
    Html.div
        [ css
            [ Tw.fixed
            , Tw.h_screen
            , Tw.w_screen
            , Tw.top_0
            , Tw.left_0
            , Tw.bg_color Theme.gray_900
            , Tw.bg_opacity_75
            , Tw.z_50
            , Tw.flex
            , Tw.items_center
            , Tw.justify_center
            ]
        ]
        [ Html.div
            [ css
                [ Tw.bg_color Theme.white
                , Tw.rounded_lg
                , Tw.shadow_lg
                , Tw.overflow_hidden
                , Css.height (Css.px 600)
                , Tw.grid
                , Css.property "grid-template-rows" "auto 1fr"
                ]
            ]
            [ Html.div
                [ css
                    [ Tw.border_b
                    , Tw.border_color Theme.gray_300
                    , Tw.bg_color Theme.white
                    , Tw.px_6
                    , Tw.py_5
                    , Tw.flex
                    , Tw.items_center
                    , Tw.justify_between
                    ]
                ]
                [ Html.h2 [ css [ Tw.font_semibold ] ]
                    [ Html.text "Usage Guide" ]
                , Html.button
                    [ Events.onClick onClose ]
                    [ Components.XIcon.view ]
                ]
            , Html.div [ css [ Tw.overflow_y_scroll, Tw.h_full ] ]
                [ Html.article
                    [ css [ Tw.prose, Tw.h_full, Tw.px_6, Tw.py_5 ] ]
                    [ Html.h3 [] [ Html.text "Step 1: Choose a Color" ]
                    , Html.p [] [ Html.text "It is important to choose the right color, because the color is noted on both the top and bottom slips!" ]
                    , Html.h3 [] [ Html.text "Step 2: Set Page Count" ]
                    , Html.p [] [ Html.text "Each page will contain 4 tags. If you want 100 tags, print 25 pages." ]
                    , Html.h3 [] [ Html.text "Step 3: (Optional) Specify Start Number" ]
                    , Html.p [] [ Html.text "Most of the time you won't need to touch this option. If you accidentally close the browser window between printing the top and bottom slips or you run into some other problem, this option can help!" ]
                    , Html.p [] [ Html.text "When you open this page or refresh, this app generates a random number between 1 and 9999. The item numbers on the tags ascend from that number. If you accidentally close the window or refresh between printing the top and bottom tags, you can use this option to set the start number to match the previous set of tags you printed." ]
                    , Html.p [] [ Html.text "Note when setting the start number that if it would cause the numbers to go past 9999, the page count will be reduced accordingly. Likewise, when adjusting the page count, if the specified page count would cause the numbers to extend past 9999, the start number will be recuded accordingly. This ensures that all item numbers will be between 1 and 9999, inclusive." ]
                    , Html.h3 [] [ Html.text "Step 4: Print!" ]
                    , Html.p []
                        [ Html.text "It doesn't matter whether you print the top or bottom slips first. To print, select the appropriate tab and print the page."
                        , Html.strong [] [ Html.text " Important: " ]
                        , Html.text "Make sure your margins are set to 0 or none in the print settings. Also ensure that the scale is set to actual size or 100%. Top slips should be printed double sided, flipping on long edge. Bottom slips should be printed single-sided."
                        ]
                    , Html.p [] []
                    ]
                ]
            ]
        ]
