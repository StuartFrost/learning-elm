module Main exposing (..)

import Html
import String


wordCount =
    String.words >> List.length


main =
    wordCount "Foo bar dolor ipsum minor aeolian"
        |> toString
        |> Html.text
