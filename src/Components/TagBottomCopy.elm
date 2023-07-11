module Components.TagBottomCopy exposing (view)

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
            [ Html.h1
                [ css
                    [ Tw.text_center
                    , Tw.font_bold
                    , Tw.text_5xl
                    , Tw.uppercase
                    , Tw.mb_8
                    ]
                ]
                [ Html.text "Sale Pending" ]
            , Html.p [] [ Html.text "A customer is planning to purchase this item. If it is not sold by the end of the day, it will be available again tomorrow." ]
            ]

        --Item Info
        , Html.div
            [ css
                [ Tw.py_8
                ]
            ]
            [ Html.div
                [ css
                    [ Tw.flex
                    , Tw.justify_evenly
                    , Tw.items_center
                    ]
                ]
                [ Html.div
                    [ css
                        [ Tw.text_xs
                        , Tw.text_right
                        ]
                    ]
                    [ Html.p [] [ Html.text "Item Number:" ]
                    , Html.p [] [ Html.text "Número de Artículo:" ]
                    ]
                , Html.h1
                    [ css
                        [ Tw.text_center
                        , Tw.font_bold
                        , Tw.text_5xl
                        ]
                    ]
                    [ Html.text (ItemNumber.toString itemNumber) ]
                ]
            , Html.p
                [ css
                    [ Tw.text_center
                    , Tw.capitalize
                    , Tw.text_xs
                    , Tw.mt_2
                    ]
                ]
                [ Html.text (TagColor.toStringEn color ++ " / " ++ TagColor.toStringEs color) ]
            ]

        -- Instructions
        , Html.div
            [ css
                [ Tw.p_8
                , Tw.absolute
                , Tw.bottom_0
                , Tw.left_0
                , Tw.w_full
                ]
            ]
            [ Html.p [ css [ Tw.text_center ] ]
                [ Html.text "Please leave this slip attached to the item."
                ]
            ]
        ]


bgColor : TagColor -> Theme.Color
bgColor color =
    case color of
        Green ->
            Theme.green_200

        Blue ->
            Theme.blue_200

        Orange ->
            Theme.orange_200

        Yellow ->
            Theme.yellow_200
