module Update exposing (update)

import Model exposing (Model, Msg(..))

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1, status = "Incremented" }

        Decrement ->
            if model.count > 0 then
                { model | count = model.count - 1, status = "Decremented" }
            else
                { model | count = -1, status = "Decremented" }

        UpdateText newContent ->
            { model | textField = newContent }

        Reset ->
            Model.init

        Submit ->
            { model | status = "Saved: " ++ model.textField, textField = "" }
        