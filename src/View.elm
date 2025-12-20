module View exposing (view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model, Msg(..))

-- Change return type to Browser.Document Msg
view : Model -> Browser.Document Msg
view model =
    { title = "a pear's corner for " ++  model.textField -- Dynamic Title!
    , body = 
        [ div [ style "padding" "20px", style "font-family" "sans-serif" ]
            [ div [ id "header-container" ] [ 
                Html.img [ src "media/pictures/me/selfportrait.png", class "responsive-img" ] []
                , Html.h1 [] [ text "This is Me" ] 
              ]
            , div [class "main-page"] [
                -- Left Sidebar
                div [ class "left-side" ] [ 
                    text "Left Nav" 
                    , input [ placeholder "enter your name...", value model.textField, onInput UpdateText ] []
                ]

                -- Center Column
              , div [ class "centre" ] [ text "Hey there, is this ", text model.textField, text "?"]


                -- Right Sidebar
              , div [ class "right-side" ] [ 
                text "Right Nav" 
                , div [] 
                    [ button [ onClick Decrement ] [ text "-" ]
                    , span [ style "margin" "0 10px" ] 
                    [ 
                        if model.count < 0 then
                            text "yOu cAn'T gO bElOw zErO !! i wOrKeD hArD oN tHiS !!"
                        else 
                            text (String.fromInt model.count) 
                    ]
                    , button [ onClick Increment ] [ text "+" ]
                    ]
                ]
              ]
            ]
        ]
    }


