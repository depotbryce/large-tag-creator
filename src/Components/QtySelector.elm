module Components.QtySelector exposing (view)

import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attr exposing (css, id)
import Html.Styled.Events as Events
import TagColor exposing (TagColor(..))
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


view : { qty : Int, onQtyChanged : Int -> msg } -> Html msg
view { qty, onQtyChanged } =
    let
        id =
            "component-qty-selector-input"
    in
    Html.div
        [ css
            [ Tw.flex
            , Tw.items_center
            , Tw.justify_between
            , Tw.gap_2
            , Tw.w_fit
            ]
        ]
        [ Html.label [ Attr.for id ] [ Html.text "Quantity: " ]
        , Html.input
            [ Events.onInput
                (\str ->
                    str
                        |> String.toInt
                        |> Maybe.withDefault 4
                        |> onQtyChanged
                )
            , Attr.id id
            , Attr.type_ "number"
            , Attr.value (String.fromInt qty)
            , Attr.min "4"
            , Attr.max "1000"
            , Attr.step "4"
            , css
                [ Tw.form_input
                , Tw.border_2
                , Tw.border_color Theme.slate_300
                , Tw.rounded
                , Tw.w_32
                ]
            ]
            []
        ]
