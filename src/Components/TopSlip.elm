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
            , Tw.m_0
            ]
        ]
        [ --Tag Header
          Html.div
            [ css
                [ Tw.pt_16
                , Tw.pb_8
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
                [ -- Sticker placeholder
                  Html.div
                    [ css
                        [ Tw.w_20
                        , Tw.h_16
                        , Tw.outline_1
                        , Tw.outline_dotted
                        , Tw.outline_color Theme.gray_300
                        , Tw.flex
                        , Tw.items_center
                        , Tw.justify_center
                        , Tw.text_color Theme.gray_200
                        ]
                    ]
                    [ Html.text "$" ]
                , Html.div
                    [ css
                        [ Tw.text_right
                        , Tw.font_bold
                        , Tw.text_4xl
                        ]
                    ]
                    [ Html.text (ItemNumber.toString itemNumber)

                    -- Tag Color
                    , Html.p
                        [ css
                            [ Tw.capitalize
                            , Tw.font_normal
                            , Tw.text_xs
                            ]
                        ]
                        [ Html.text
                            (TagColor.toStringEn color
                                ++ " / "
                                ++ TagColor.toStringEs color
                            )
                        ]
                    ]
                ]
            ]

        -- Tag Description Area
        , Html.div
            [ css
                [ Tw.m_8
                , Tw.mt_0
                ]
            ]
          <|
            List.map
                (\_ ->
                    Html.div
                        [ css
                            [ Tw.h_8
                            , Tw.border_b_2
                            , Tw.border_color Theme.gray_400
                            ]
                        ]
                        []
                )
                (List.range 1 2)

        -- Instructions
        , Html.div
            [ css
                [ Tw.p_8
                , Tw.absolute
                , Tw.bottom_0
                , Tw.left_0
                , Tw.w_full
                , Tw.text_justify
                ]
            ]
            [ Html.p []
                [ Html.text
                    """To purchase, present this slip to cashier in furniture store.
                    To pick up, present with receipt at door # 1."""
                ]
            , Html.p [ css [ Tw.mt_4, Tw.text_color Theme.gray_700, Tw.text_sm ] ]
                [ Html.text
                    """Presente este comprobante al cajero en la tienda de muebles para comprar.
                    Presente con recibo en la puerta número 1 para recoger."""
                ]
            ]
        ]
