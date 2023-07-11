module TagColor exposing (TagColor(..), all, toStringEn, toStringEs)


type TagColor
    = Green
    | Blue
    | Orange
    | Yellow


all : List TagColor
all =
    [ Green, Blue, Orange, Yellow ]


toStringEn : TagColor -> String
toStringEn color =
    case color of
        Green ->
            "green"

        Blue ->
            "blue"

        Orange ->
            "orange"

        Yellow ->
            "yellow"


toStringEs : TagColor -> String
toStringEs color =
    case color of
        Green ->
            "verde"

        Blue ->
            "azul"

        Orange ->
            "naranja"

        Yellow ->
            "amarillo"
