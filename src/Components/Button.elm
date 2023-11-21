module Components.Button exposing (view)

import Css
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attr exposing (css)
import Html.Styled.Events as Events
import TagColor exposing (TagColor(..))
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


view :
    { onClick : msg
    , label : String
    }
    -> Html msg
view { onClick, label } =
    Html.button
        [ Events.onClick onClick
        , Attr.type_ "button"
        , css
            [ Tw.rounded_md
            , Tw.bg_color Theme.slate_600
            , Tw.px_3
            , Tw.py_2
            , Tw.text_color Theme.white
            , Tw.text_sm
            , Tw.font_semibold
            , Tw.shadow_sm
            , Css.hover [ Tw.bg_color Theme.slate_500 ]
            , Css.pseudoClass "focus-visible"
                [ Tw.outline
                , Tw.outline_2
                , Tw.outline_offset_2
                , Tw.outline_color Theme.slate_600
                ]
            ]
        ]
        [ Html.text label ]
