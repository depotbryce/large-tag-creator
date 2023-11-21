module Version exposing (current)


currentVersion : Version
currentVersion =
    Version 3 0 0


type Version
    = Version Int Int Int


toString : Version -> String
toString (Version major minor patch) =
    "v"
        ++ String.join "."
            [ String.fromInt major
            , String.fromInt minor
            , String.fromInt patch
            ]


current : String
current =
    toString currentVersion
