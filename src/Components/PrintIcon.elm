module Components.PrintIcon exposing (view)

import Html.Styled exposing (Html)
import Html.Styled.Attributes exposing (attribute)
import Svg.Styled exposing (node, path, svg)
import Svg.Styled.Attributes exposing (class, d, fill, viewBox)


view : Html msg
view =
    svg
        [ class "feather feather-printer"
        , fill "none"
        , attribute "height" "24"
        , attribute "stroke" "currentColor"
        , attribute "stroke-linecap" "round"
        , attribute "stroke-linejoin" "round"
        , attribute "stroke-width" "2"
        , viewBox "0 0 24 24"
        , attribute "width" "24"
        , attribute "xmlns" "http://www.w3.org/2000/svg"
        ]
        [ node "polyline"
            [ attribute "points" "6 9 6 2 18 2 18 9" ]
            []
        , path [ d "M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2" ]
            []
        , node "rect"
            [ attribute "height" "8", attribute "width" "12", attribute "x" "6", attribute "y" "14" ]
            []
        ]
