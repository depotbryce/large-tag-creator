module Components.NumberInput exposing (view)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attr exposing (css)
import Html.Styled.Events as Events
import TagColor exposing (TagColor(..))
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


view :
    { value : String
    , label : String
    , id : String
    , onInput : String -> msg
    }
    -> Html msg
view props =
    Html.div [ css [ Tw.flex, Tw.gap_2, Tw.items_center ] ]
        [ Html.label
            [ Attr.for props.id
            , css
                [ Tw.block
                , Tw.text_sm
                , Tw.font_medium
                , Tw.leading_6
                , Tw.text_color Theme.gray_900
                ]
            ]
            [ Html.text props.label ]
        , Html.input
            [ Events.onInput props.onInput
            , Attr.type_ "number"
            , Attr.id props.id
            , Attr.value props.value
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
