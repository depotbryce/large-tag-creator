module Components.HelpIcon exposing (view)

import Html.Styled exposing (Html)
import Svg.Styled as Svg exposing (svg)
import Svg.Styled.Attributes exposing (..)
import Tailwind.Utilities as Tw


view : Html msg
view =
    svg
        [ width "24"
        , height "24"
        , viewBox "0 0 24 24"
        , fill "none"
        , stroke "currentColor"
        , strokeWidth "2"
        , strokeLinecap "round"
        , strokeLinejoin "round"
        , class "feather feather-help-circle"
        , css
            [ Tw.h_6
            , Tw.w_6
            ]
        ]
        [ Svg.circle
            [ cx "12"
            , cy "12"
            , r "10"
            ]
            []
        , Svg.path
            [ d "M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"
            ]
            []
        , Svg.line
            [ x1 "12"
            , y1 "17"
            , x2 "12.01"
            , y2 "17"
            ]
            []
        ]
