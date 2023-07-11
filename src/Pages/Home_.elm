module Pages.Home_ exposing (Model, Msg, page)

import Components.ColorSelector
import Components.QtySelector
import Components.TagBottomCopy
import Components.TagTopCopy
import Effect exposing (Effect)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attr exposing (css)
import ItemNumber exposing (ItemNumber)
import Page exposing (Page)
import Route exposing (Route)
import Shared
import TagColor exposing (TagColor)
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw
import View exposing (View)


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { selectedColor : TagColor
    , qty : Int
    , tags : Maybe (List Tag)
    }


init : () -> ( Model, Effect Msg )
init _ =
    ( { selectedColor = TagColor.Green
      , qty = 4
      , tags = Nothing
      }
    , Effect.none
    )


type Msg
    = ChangedColor TagColor
    | ChangedTagQty Int


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        ChangedColor color ->
            ( { model | selectedColor = color }, Effect.none )

        ChangedTagQty qty ->
            ( { model | qty = qty }, Effect.none )


view : Model -> View Msg
view model =
    { title = "Home"
    , body =
        [ Html.div
            [ Attr.class "controls"
            , css
                [ Tw.flex
                , Tw.justify_between
                , Tw.items_center
                , Tw.p_4
                , Tw.shadow
                , Tw.bg_color Theme.slate_50
                ]
            ]
            [ Components.ColorSelector.view
                { selectedColor = model.selectedColor
                , onColorSelected = ChangedColor
                }
            , Components.QtySelector.view
                { qty = model.qty
                , onQtyChanged = ChangedTagQty
                }
            , Html.text "ViewSwitcher"
            ]
        , Html.div
            [ Attr.class "tags"
            , css
                [ Tw.flex
                , Tw.justify_center
                , Tw.items_center
                ]
            ]
            [ Html.div
                [ css
                    [ Tw.p_8
                    , Tw.flex
                    , Tw.gap_16
                    ]
                ]
                [ Html.div []
                    [ Html.div
                        [ css
                            [ Tw.shadow
                            , Tw.shadow_color Theme.slate_400
                            , Tw.border_color Theme.slate_100
                            ]
                        ]
                        [ Components.TagTopCopy.view
                            { color = model.selectedColor
                            , itemNumber = ItemNumber.fromInt 1000
                            }
                        ]
                    ]
                , Html.div []
                    [ Html.div
                        [ css
                            [ Tw.shadow
                            , Tw.shadow_color Theme.slate_400
                            , Tw.border_color Theme.slate_100
                            ]
                        ]
                        [ Components.TagBottomCopy.view
                            { color = model.selectedColor
                            , itemNumber = ItemNumber.fromInt 1000
                            }
                        ]
                    ]
                ]
            ]
        ]
    }


type alias Tag =
    { color : TagColor
    , itemNumber : Int
    }
