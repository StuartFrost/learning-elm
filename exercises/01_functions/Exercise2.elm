module Main exposing (..)

import Html


uppercase_longer_than_10 name =
    if String.length name > 10 then
        String.toUpper name
    else
        name


main =
    let
        name =
            "Stuart Frost"
    in
        Html.text (uppercase_longer_than_10 name ++ " - name length: " ++ toString (String.length name))
