module Main exposing (main)

import Browser
import Model exposing (Model, Msg, init)
import Update exposing (update)
import View exposing (view)

main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> ( init, Cmd.none ) -- Document requires a Tuple (Model, Command)
        , view = view
        , update = \msg model -> ( update msg model, Cmd.none ) -- Returns (Model, Command)
        , subscriptions = \_ -> Sub.none
        }