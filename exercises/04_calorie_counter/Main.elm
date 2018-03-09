module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { count : Int
    , incAmount : String
    }


initModel : Model
initModel =
    { count = 0
    , incAmount = ""
    }



-- update


type Msg
    = AddCalorie
    | Clear
    | TrackInput String


update : Msg -> Model -> Model
update msg model =
    case Debug.log "msg" msg of
        AddCalorie ->
            { model | count = model.count + (Result.withDefault 0 (String.toInt model.incAmount)) }

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
        ]


main =
    Html.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
