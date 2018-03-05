module Main exposing (..)

import Html
import String


(~=) str1 str2 =
    (String.left 1 str1) == (String.left 1 str2)


main =
    Html.text (toString ((~=) "Hello World" "Goodbye World"))
