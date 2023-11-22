module Components.NumberInput exposing
    ( NumberInput
    , default
    , view
    , withMax
    , withMin
    , withStep
    )

import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attr exposing (css)
import Html.Styled.Events as Events
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


type NumberInput msg
    = NumberInput
        { value : String
        , label : String
        , id : String
        , min : Maybe Int
        , max : Maybe Int
        , step : Maybe Int
        , onInput : String -> msg
        }


default :
    { value : String
    , label : String
    , id : String
    , onInput : String -> msg
    }
    -> NumberInput msg
default { value, label, id, onInput } =
    NumberInput
        { value = value
        , label = label
        , id = id
        , min = Nothing
        , max = Nothing
        , step = Nothing
        , onInput = onInput
        }


withMin : Int -> NumberInput msg -> NumberInput msg
withMin min (NumberInput options) =
    NumberInput { options | min = Just min }


withMax : Int -> NumberInput msg -> NumberInput msg
withMax max (NumberInput options) =
    NumberInput { options | max = Just max }


withStep : Int -> NumberInput msg -> NumberInput msg
withStep step (NumberInput options) =
    NumberInput { options | step = Just step }


view : NumberInput msg -> Html msg
view (NumberInput options) =
    let
        min =
            case options.min of
                Just n ->
                    String.fromInt n

                Nothing ->
                    ""

        max =
            case options.max of
                Just n ->
                    String.fromInt n

                Nothing ->
                    ""

        step =
            case options.step of
                Just n ->
                    String.fromInt n

                Nothing ->
                    String.fromInt 1
    in
    Html.div [ css [ Tw.flex, Tw.gap_2, Tw.items_center ] ]
        [ Html.label
            [ Attr.for options.id
            , css
                [ Tw.block
                , Tw.text_sm
                , Tw.font_medium
                , Tw.leading_6
                , Tw.text_color Theme.gray_900
                ]
            ]
            [ Html.text options.label ]
        , Html.input
            [ Events.onInput options.onInput
            , Attr.type_ "number"
            , Attr.id options.id
            , Attr.value options.value
            , Attr.min min
            , Attr.max max
            , Attr.step step
            , css
                [ Tw.rounded_md
                , Tw.border_0
                , Tw.py_1_dot_5
                , Tw.px_3
                , Tw.text_color Theme.gray_900
                , Tw.shadow_sm
                , Tw.text_sm
                , Tw.leading_6
                , Tw.ring_1
                , Tw.ring_inset
                , Tw.ring_color Theme.gray_300
                ]
            ]
            []
        ]
