module Main exposing (..)
import Html exposing (text)
import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = init, update = update, view = view }
  

-- MODEL

type alias Score = Int

init : Score
init =
  0


-- UPDATE

type Msg = Increment | Decrement

update : Msg -> Score -> Score
update msg score =
  case msg of
    Increment ->
      score + 1

    Decrement -> (
      if score == 0 then
        0 
      else
        score - 1)


-- VIEW

view : Score -> Html Msg
view model =
  div []
    [ button [ onClick Increment ] [ text "+" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Decrement ] [ text "-" ]
    ]