module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { count : Int
    , incAmount : String
    , errorMsg : String
    }


initModel : Model
initModel =
    { count = 0
    , incAmount = ""
    , errorMsg = ""
    }



-- update


type Msg
    = AddCalorie
    | Clear
    | TrackInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            let
                userInput =
                    model.incAmount
                        |> String.toInt

                newCount =
                    userInput
                        |> Result.withDefault 0
                        |> (+) model.count
            in
                case userInput of
                    Ok input ->
                        { model | count = newCount, incAmount = "", errorMsg = "" }

                    Err error ->
                        { model | errorMsg = "Invalid input. Please enter a number." }

        Clear ->
            initModel

        TrackInput new_input ->
            { model | incAmount = new_input }



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model.count)) ]
        , input
            [ onInput TrackInput
            , value model.incAmount
            ]
            []
        , button
            [ type_ "button"
            , onClick AddCalorie
            ]
            [ text "Add" ]
        , button
            [ type_ "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        , p []
            [ text (model.errorMsg) ]
        ]


main =
    Html.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
