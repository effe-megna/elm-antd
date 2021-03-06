port module Utils exposing
    ( ComponentCategory(..)
    , DocumentationRoute
    , copySourceToClipboard
    )

import Html.Styled as Styled


port copySourceToClipboard : String -> Cmd msg


type ComponentCategory
    = General
    | Layout
    | Navigation
    | DataEntry
    | DataDisplay
    | Feedback
    | Other


type alias RouteTitle =
    String


type alias DocumentationRoute model msg =
    { title : RouteTitle
    , update : msg -> model -> ( model, Cmd msg )
    , category : ComponentCategory
    , view : model -> Styled.Html msg
    , initialModel : model
    }
