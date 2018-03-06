module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { count : Int
    , inc_amount : String
    }


initModel : Model
initModel =
    { count = 0
    , inc_amount = ""
    }



-- update


type Msg
    = AddCalorie
    | Clear
    | TrackInput String


update msg model =
    case msg of
        AddCalorie ->
            { model | count = model.count + 1 }

        Clear ->
            initModel

        TrackInput new_input ->
            { model | inc_amount = new_input }



-- view


view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model.count) ++ " - " ++ model.inc_amount) ]
        , input
            [ onInput TrackInput ]
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
        ]


main =
    Html.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
