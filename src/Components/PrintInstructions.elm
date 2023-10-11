module Components.PrintInstructions exposing (view)

import Components.PrintIcon
import Css
import Css.Media exposing (only, print, withMedia)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


view :
    { margins : String
    , doubleSided : String
    , scale : String
    }
    -> Html msg
view { margins, doubleSided, scale } =
    Html.div
        [ css
            [ Tw.rounded_xl
            , Tw.bg_color Theme.cyan_700
            , Tw.text_color Theme.slate_100
            , Tw.fixed
            , Tw.top_32
            , Tw.right_4
            , Tw.p_4
            , Tw.w_80
            , Tw.shadow
            , withMedia [ only print [] ] [ Tw.hidden ]
            ]
        ]
        [ Html.div
            [ css
                [ Tw.w_12
                , Tw.h_12
                , Tw.mx_auto
                ]
            ]
            [ Components.PrintIcon.view ]
        , Html.h2
            [ css
                [ Tw.font_bold
                , Tw.text_lg
                , Tw.text_center
                , Tw.my_4
                ]
            ]
            [ Html.text "Recommended Print Settings" ]
        , Html.table [ css [ Tw.w_full, Tw.h_full ] ] <|
            List.map viewRow
                [ { label = "Margins", value = margins }
                , { label = "Double Sided", value = doubleSided }
                , { label = "Scale", value = scale }
                ]
        ]


viewRow : { label : String, value : String } -> Html msg
viewRow { label, value } =
    Html.tr
        [ css []
        ]
        [ Html.th
            [ css
                [ Tw.py_4
                , Tw.text_left
                ]
            ]
            [ Html.text label ]
        , Html.td
            [ css
                [ Tw.text_right
                , Tw.py_4
                , Tw.pl_2
                ]
            ]
            [ Html.text value ]
        ]
