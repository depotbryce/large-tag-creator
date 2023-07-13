module Display exposing (Display(..), all)


type Display
    = Preview
    | TopSlips
    | BottomSlips


all : List Display
all =
    [ Preview, TopSlips, BottomSlips ]
