module Components.XIcon exposing (..)

import Html.Styled exposing (Html)
import Svg.Styled exposing (line, svg)
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
        , class "feather feather-x"
        , css
            [ Tw.h_6
            , Tw.w_6
            ]
        ]
        [ line
            [ x1 "18"
            , y1 "6"
            , x2 "6"
            , y2 "18"
            ]
            []
        , line
            [ x1 "6"
            , y1 "6"
            , x2 "18"
            , y2 "18"
            ]
            []
        ]
