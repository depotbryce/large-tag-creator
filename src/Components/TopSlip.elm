module Components.TopSlip exposing (view)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import ItemNumber exposing (ItemNumber)
import TagColor exposing (TagColor(..))
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


view : { color : TagColor, itemNumber : ItemNumber } -> Html msg
view { color, itemNumber } =
    Html.div
        [ css
            [ Css.width (Css.inches 4.25)
            , Css.height (Css.inches 4.5)
            , Tw.relative
            , Tw.pt_4
            , Tw.m_0
            ]
        ]
        [ --Tag Header
          Html.div
            [ css
                [ Tw.py_8
                ]
            ]
            [ Html.div
                [ css
                    [ Tw.flex
                    , Tw.justify_between
                    , Tw.items_center
                    , Tw.px_8
                    ]
                ]
                [ Html.div
                    [ css
                        [ Tw.text_xs
                        ]
                    ]
                    [ Html.p [] [ Html.text "Item Number:" ]
                    , Html.p [] [ Html.text "Número de Artículo:" ]
                    ]
                , Html.h1
                    [ css
                        [ Tw.text_center
                        , Tw.font_bold
                        , Tw.text_4xl
                        ]
                    ]
                    [ Html.text (ItemNumber.toString itemNumber) ]
                ]
            ]

        -- Tag Description Area
        , Html.div
            [ css
                [ Tw.m_8 ]
            ]
          <|
            List.map
                (\_ ->
                    Html.div
                        [ css
                            [ Tw.h_8
                            , Tw.border_b_2
                            , Tw.border_color Theme.gray_600
                            ]
                        ]
                        []
                )
                (List.range 1 3)

        -- Tag Color
        , Html.p
            [ css
                [ Tw.capitalize
                , Tw.text_xs
                , Tw.mt_8
                , Tw.text_center
                ]
            ]
            [ Html.text
                (TagColor.toStringEn color
                    ++ " / "
                    ++ TagColor.toStringEs color
                )
            ]

        -- Instructions
        , Html.div
            [ css
                [ Tw.p_8
                , Tw.absolute
                , Tw.bottom_0
                , Tw.left_0
                , Tw.w_full
                , Tw.text_center
                , Tw.text_sm
                ]
            ]
            [ Html.p []
                [ Html.text "Present this slip to cashier in furniture store to purchase. Present with receipt at door # 1 to pick up."
                ]
            ]
        ]
