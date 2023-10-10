module Components.Policies exposing (view)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css, lang)
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


view : Html msg
view =
    Html.div
        [ css
            [ Css.width (Css.inches 4.25)
            , Css.height (Css.inches 4.5)
            , Tw.relative
            , Tw.m_0
            , Tw.p_8
            , Tw.pt_12
            , Tw.text_sm
            ]
        ]
        [ Html.h2
            [ css
                (headingStyles
                    ++ [ Tw.flex
                       , Tw.justify_between
                       ]
                )
            ]
            [ Html.span [ lang "en" ] [ Html.text "Pickup Hours" ]
            , Html.span
                [ lang "es"
                , css
                    [ Tw.font_normal
                    , Tw.italic
                    , Tw.text_color Theme.gray_700
                    ]
                ]
                [ Html.text "Horario de Entrega" ]
            ]
        , Html.div []
            [ Html.p
                [ css [ Tw.flex, Tw.gap_2 ] ]
                [ Html.span [ lang "en" ] [ Html.text "Mon - Fri" ]
                , Html.text "/"
                , Html.span [ lang "es", css [ Tw.text_color Theme.gray_700 ] ]
                    [ Html.text "De Lunes a Viernes" ]
                , Html.span [ css [ Tw.flex_grow, Tw.text_right ] ]
                    [ Html.text "9am - 5pm" ]
                ]
            , Html.p
                [ css [ Tw.flex, Tw.gap_2 ] ]
                [ Html.span [ lang "en" ] [ Html.text "Saturday" ]
                , Html.text "/"
                , Html.span
                    [ lang "es"
                    , css [ Tw.text_color Theme.gray_700 ]
                    ]
                    [ Html.text "Sabado" ]
                , Html.span [ css [ Tw.flex_grow, Tw.text_right ] ]
                    [ Html.text "9am - 1pm" ]
                ]
            ]
        , Html.h2 [ css (headingStyles ++ [ Tw.pt_6 ]) ]
            [ Html.span
                [ lang "en" ]
                [ Html.text "Pickup & Redonation Policy" ]
            , Html.span
                [ lang "es"
                , css
                    [ Tw.font_normal
                    , Tw.italic
                    , Tw.block
                    , Tw.text_color Theme.gray_700
                    ]
                ]
                [ Html.text "Política de Entrega y Redonación" ]
            ]
        , Html.p
            [ lang "en" ]
            [ Html.text "All items must be picked up within 7 days of purchase. Items not picked up within 7 days may be redonated and put out for sale again. This policy is necessary due to space constraints. We apologize for the inconvenience."
            ]
        , Html.p
            [ lang "es"
            , css
                [ Tw.text_xs
                , Tw.mt_4
                , Tw.text_color Theme.gray_700
                ]
            ]
            [ Html.text "Todos los artículos deben recogerse dentro de los 7 días posteriores a la compra. Los artículos que no se recojan en un plazo de 7 días pueden ser redonados y puestos a la venta de nuevo. Esta política es necesaria debido a las limitaciones de espacio. Pedimos una disculpa y agradecemos su atención."
            ]
        ]


headingStyles : List Css.Style
headingStyles =
    [ Tw.font_bold
    , Tw.mb_2
    , Tw.border_b_2
    , Tw.border_color Theme.gray_400
    ]
