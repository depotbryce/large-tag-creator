module Pages.Home_ exposing (Model, Msg, page)

import Components.BottomSlip
import Components.ColorSelector
import Components.DisplaySwitcher
import Components.Policies
import Components.PrintInstructions
import Components.QtySelector
import Components.TopSlip
import Css
import Css.Media exposing (only, print, withMedia)
import Display exposing (Display(..))
import Effect exposing (Effect)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import ItemNumber exposing (ItemNumber)
import Page exposing (Page)
import Route exposing (Route)
import Shared
import TagColor exposing (TagColor(..))
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw
import Version
import View exposing (View)


page : Shared.Model -> Route () -> Page Model Msg
page _ _ =
    Page.new
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { selectedColor : TagColor
    , qty : Int
    , itemNumbers : Maybe (List ItemNumber)
    , display : Display
    }


init : () -> ( Model, Effect Msg )
init _ =
    ( { selectedColor = TagColor.Green
      , qty = 4
      , itemNumbers = Nothing
      , display = Preview
      }
    , Effect.getItemNumberStart 4 GotItemNumberStart
    )


type Msg
    = ChangedColor TagColor
    | ChangedTagQty Int
    | GotItemNumberStart Int
    | ChangedDisplay Display


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        ChangedColor color ->
            ( { model | selectedColor = color }, Effect.none )

        ChangedTagQty qty ->
            ( { model
                | qty = qty
              }
            , Effect.getItemNumberStart model.qty GotItemNumberStart
            )

        ChangedDisplay newDisplay ->
            ( { model | display = newDisplay }
            , if newDisplay /= Preview && model.itemNumbers == Nothing then
                Effect.getItemNumberStart model.qty GotItemNumberStart

              else
                Effect.none
            )

        GotItemNumberStart start ->
            ( { model
                | itemNumbers =
                    Just
                        (List.map
                            ItemNumber.fromInt
                            (List.range start (start + model.qty - 1))
                        )
              }
            , Effect.none
            )


view : Model -> View Msg
view model =
    let
        itemNumbers =
            case model.itemNumbers of
                Just list ->
                    list

                Nothing ->
                    []
    in
    { title = "Large Item Tag Creator"
    , body =
        [ -- Container
          Html.div
            [ css
                [ Tw.grid
                , Tw.grid_cols_1
                , Tw.h_screen
                , Tw.w_screen
                , Tw.overflow_hidden
                , Css.property "grid-template-rows" "auto 1fr"
                , mediaPrint [ Tw.h_auto, Tw.w_auto ]
                ]
            ]
            [ --Version
              Html.div
                [ css
                    [ Tw.text_xs
                    , Tw.text_color Theme.slate_600
                    , Tw.fixed
                    , Tw.bottom_2
                    , Tw.left_2
                    , mediaPrint [ Tw.hidden ]
                    ]
                ]
                [ Html.text Version.current ]
            , -- Controls
              Html.div
                [ css
                    [ Tw.flex
                    , Tw.justify_between
                    , Tw.items_center
                    , Tw.p_4
                    , Tw.shadow
                    , Tw.bg_color Theme.slate_50
                    , mediaPrint [ Tw.hidden ]
                    , Tw.text_color Theme.slate_800
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
                , Components.DisplaySwitcher.view
                    { currentDisplay = model.display
                    , onDisplayChanged = ChangedDisplay
                    }
                ]
            , -- Content Area (Tags)
              Html.div
                [ css
                    [ Tw.overflow_y_scroll
                    , Tw.bg_color Theme.slate_200
                    , mediaPrint [ Tw.overflow_y_auto ]
                    ]
                ]
                [ Html.div
                    [ css
                        [ Tw.mx_auto
                        , Tw.w_fit
                        , mediaPrint [ Tw.w_full, Tw.mx_0 ]
                        ]
                    ]
                    [ case model.display of
                        Preview ->
                            viewPreview model

                        TopSlips ->
                            Html.div [ css [ Css.width (Css.inches 10) ] ]
                                [ Html.div
                                    [ css
                                        [ Tw.fixed
                                        , Tw.top_32
                                        , Tw.right_4
                                        , mediaPrint [ Tw.hidden ]
                                        ]
                                    ]
                                    [ Components.PrintInstructions.view
                                        { margins = "None"
                                        , doubleSided = "Flip on Long Edge"
                                        , scale = "100%"
                                        }
                                    ]
                                , viewTagSheet
                                    { itemNumbers = itemNumbers
                                    , backContent =
                                        Content Components.Policies.view
                                    }
                                    (\itemNumber ->
                                        Components.TopSlip.view
                                            { color = model.selectedColor
                                            , itemNumber = itemNumber
                                            }
                                    )
                                ]

                        BottomSlips ->
                            Html.div [ css [ Css.width (Css.inches 10) ] ]
                                [ Html.div
                                    [ css
                                        [ Tw.fixed
                                        , Tw.top_32
                                        , Tw.right_4
                                        , mediaPrint [ Tw.hidden ]
                                        ]
                                    ]
                                    [ Components.PrintInstructions.view
                                        { margins = "None"
                                        , doubleSided = "None"
                                        , scale = "100%"
                                        }
                                    ]
                                , viewTagSheet
                                    { itemNumbers = itemNumbers
                                    , backContent = Blank
                                    }
                                    (\itemNumber ->
                                        Components.BottomSlip.view
                                            { color = model.selectedColor
                                            , itemNumber = itemNumber
                                            }
                                    )
                                ]
                    ]
                ]
            ]
        ]
    }


viewPreview : Model -> Html Msg
viewPreview model =
    let
        bgColor color =
            case color of
                Green ->
                    Theme.green_200

                Blue ->
                    Theme.blue_200

                Orange ->
                    Theme.orange_200

                Yellow ->
                    Theme.yellow_200

        itemNumber =
            case model.itemNumbers of
                Just (num :: _) ->
                    num

                _ ->
                    ItemNumber.fromInt 0
    in
    Html.div
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
                    , Tw.bg_color (bgColor model.selectedColor)
                    ]
                ]
                [ Components.TopSlip.view
                    { color = model.selectedColor
                    , itemNumber = itemNumber
                    }
                ]
            ]
        , Html.div []
            [ Html.div
                [ css
                    [ Tw.shadow
                    , Tw.shadow_color Theme.slate_400
                    , Tw.border_color Theme.slate_100
                    , Tw.bg_color Theme.white
                    ]
                ]
                [ Components.BottomSlip.view
                    { color = model.selectedColor
                    , itemNumber = itemNumber
                    }
                ]
            ]
        ]


viewTagSheet :
    { itemNumbers : List ItemNumber
    , backContent : BackContent
    }
    -> (ItemNumber -> Html Msg)
    -> Html Msg
viewTagSheet { itemNumbers, backContent } viewSheet =
    let
        sheetStyles =
            [ Tw.grid
            , Tw.grid_cols_2
            , Tw.mt_8
            , Css.width (Css.inches 8.5)
            , Tw.shadow
            , Tw.overflow_hidden
            , Tw.bg_color Theme.white
            , Css.property "break-inside" "avoid"
            , Css.property "break-after" "page"
            , mediaPrint
                [ Tw.shadow_none
                , Tw.mt_0
                ]
            ]

        slipStyles =
            [ Tw.outline_1
            , Tw.outline_dashed
            , Tw.outline_color Theme.gray_100
            ]
    in
    Html.div
        []
    <|
        List.map
            (\slipPage ->
                Html.div []
                    [ Html.div
                        [ css sheetStyles ]
                      <|
                        List.map
                            (\itemNumber ->
                                Html.div
                                    [ css slipStyles ]
                                    [ viewSheet itemNumber ]
                            )
                            slipPage
                    , case backContent of
                        Blank ->
                            Html.text ""

                        Content content ->
                            Html.div [ css sheetStyles ] <|
                                List.repeat 4
                                    (Html.div [ css slipStyles ] [ content ])
                    ]
            )
            (paginateItems itemNumbers)


mediaPrint : List Css.Style -> Css.Style
mediaPrint styles =
    withMedia [ only print [] ] styles


paginateItems : List a -> List (List a)
paginateItems items =
    let
        paginate paginated input =
            if List.length input > 0 then
                paginate
                    (paginated ++ [ List.take 4 input ])
                    (List.drop 4 input)

            else
                paginated
    in
    paginate [] items


{-| Represents the contents to display on the bag of a slip
-}
type BackContent
    = Blank
    | Content (Html Msg)
