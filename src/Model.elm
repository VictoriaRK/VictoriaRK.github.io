module Model exposing (Model, Msg(..), init)

type alias Model =
    { count : Int
    , textField : String
    , status : String
    }

init : Model
init =
    { count = 0
    , textField = "anonymous"
    , status = "Ready"
    }

type Msg
    = Increment
    | Decrement
    | UpdateText String
    | Reset
    | Submit