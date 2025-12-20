module arch exposing (..)
import Browser
import Html exposing (Html, Attribute, div, input, text, button, h1, img)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
-- MODEL

type alias Score = Int
type alias ModelName = { content : String}

scoreNumber : Score
scoreNumber = 0

inputName : ModelName
inputName = { content = "" }


-- UPDATE

type Inc = Increment | Decrement

type Name = Change String

updateScore : Inc -> Score -> Score
updateScore msg score =
  case msg of
    Increment ->
      score + 1

    Decrement -> (
      if score == 0 then
        0 
      else
        score - 1)

updateName : Name -> ModelName -> ModelName
updateName msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }

-- VIEW

btn : Score -> Html Inc
btn model =
  div []
    [ button [ onClick Increment ] [ text "+" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Decrement ] [ text "-" ]
    ]


inputNamebox model = 
  div []
  [
    input [ placeholder "input your name", value model.content, onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
  ] 

main = 
  Browser.sandbox { init = scoreNumber, update = updateScore, view = view }

view : Score -> Html Inc
view score =
    div []
        [ -- 1. INJECT CSS & FONTS HERE
          -- Html.node "style" [] [ text ""]
        
        -- 2. THE REST IS THE SAME
        div [ class "page-container" ]
            [ 
              -- Navigation Bar
              div [ id "header-container" ] [ 
                Html.img [ src "media/pictures/me/selfportrait.png", class "responsive-img" ] []
                , Html.h1 [] [ text "No HTML file needed!" ] 
              ]
                
              ,
              -- Main Content
              div [class "main-page"] [
                -- Left Sidebar
                div [ class "left-side" ] [ text "Left Nav" ]

                -- Center Column
              , div [ class "centre" ] [ btn score ]


                -- Right Sidebar
              , div [ class "right-side" ] [ text "Right Nav" ]
              ]
            ]
        ]

