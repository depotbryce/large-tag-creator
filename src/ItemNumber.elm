module ItemNumber exposing
    ( ItemNumber
    , fromInt
    , fromString
    , toInt
    , toString
    )


type ItemNumber
    = ItemNumber Int


fromInt : Int -> ItemNumber
fromInt int =
    ItemNumber int


toInt : ItemNumber -> Int
toInt (ItemNumber int) =
    int


toString : ItemNumber -> String
toString (ItemNumber int) =
    String.fromInt int |> String.padLeft 4 '0'


fromString : String -> Maybe ItemNumber
fromString string =
    String.toInt string
        |> Maybe.map fromInt
