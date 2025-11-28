module Main exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
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

btn : Score -> Html Msg
btn model =
  div []
    [ button [ onClick Increment ] [ text "+" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Decrement ] [ text "-" ]
    ]




main = 
  Browser.sandbox { init = init, update = update, view = view }

view : Score -> Html Msg
view score =
    div []
        [ -- 1. INJECT CSS & FONTS HERE
          -- Html.node "style" [] [ text ""]
        
        -- 2. THE REST IS THE SAME
        div [ class "page-container" ]
            [ 
              -- Navigation Bar
              div [ id "header-container" ] [ text "My Elm Website" ]
                , Html.h1 [] [ text "No HTML file needed!" ]
                , Html.img [ src "media/pictures/me/selfportrait.png", class "responsive-img" ] []
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

