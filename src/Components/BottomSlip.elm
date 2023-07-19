module Components.BottomSlip exposing (view)

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
            , Css.height (Css.inches 5.5)
            , Tw.relative
            , Tw.pt_4
            ]
        ]
        [ Html.div
            [ css [ Tw.p_8 ] ]
            [ Html.div
                [ css
                    [ Tw.mb_8
                    , Tw.text_center
                    , Tw.font_bold
                    , Tw.uppercase
                    ]
                ]
                [ Html.h1
                    [ css [ Tw.text_5xl ] ]
                    [ Html.text "Sale Pending" ]
                , Html.h1
                    [ css
                        [ Tw.text_2xl
                        , Tw.text_color Theme.gray_700
                        , Tw.mt_2
                        ]
                    ]
                    [ Html.text "Venta Pendiente" ]
                ]
            , -- Information
              Html.div
                [ css
                    [ Tw.text_justify
                    ]
                ]
                [ Html.p
                    []
                    [ Html.text
                        """A customer is purchasing this item. 
                    If the sale is not completed by the end of the day,
                    this item will be available for sale tomorrow."""
                    ]
                , Html.p
                    [ css
                        [ Tw.mt_4
                        , Tw.text_color Theme.gray_700
                        , Tw.text_sm
                        ]
                    ]
                    [ Html.text
                        """Un cliente está comprando este artículo. 
                    Si la venta no se completa al final del día,
                    este artículo estará disponible para la venta mañana."""
                    ]
                ]
            ]

        --Item Info
        , Html.div
            []
            [ Html.div
                [ css
                    [ Tw.text_center
                    ]
                ]
                [ Html.h1
                    [ css
                        [ Tw.font_bold
                        , Tw.text_5xl
                        ]
                    ]
                    [ Html.text (ItemNumber.toString itemNumber) ]
                , Html.p
                    [ css
                        [ Tw.capitalize
                        , Tw.text_xs
                        ]
                    ]
                    [ Html.text (TagColor.toStringEn color ++ " / " ++ TagColor.toStringEs color) ]
                ]
            ]

        -- Instructions
        , Html.div
            [ css
                [ Tw.p_4
                , Tw.pt_8
                , Tw.absolute
                , Tw.bottom_0
                , Tw.left_0
                , Tw.w_full
                , Tw.text_center
                ]
            ]
            [ Html.p
                [ css
                    [ Tw.font_bold
                    , Tw.text_lg
                    ]
                ]
                [ Html.text "Please leave this slip attached to the item!" ]
            , Html.p
                [ css [ Tw.text_color Theme.gray_700, Tw.mt_2, Tw.text_sm ] ]
                [ Html.text "¡Por favor, deje este comprobante adjunto al artículo!" ]
            ]
        ]
