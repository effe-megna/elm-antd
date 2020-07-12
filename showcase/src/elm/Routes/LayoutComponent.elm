module Routes.LayoutComponent exposing (Model, Msg, route)

import Css exposing (displayFlex, height, marginRight, maxWidth, pct, px, width)
import Html exposing (Html)
import Html.Styled as Styled exposing (div, fromUnstyled, span, text)
import Html.Styled.Attributes exposing (css)
import Routes.LayoutComponent.HeaderContentFooterExample as HeaderContentFooterExample
import UI.Container as Container
import UI.Typography as Typography
    exposing
        ( codeText
        , documentationHeading
        , documentationSubheading
        , documentationText
        , documentationUnorderedList
        )
import Utils exposing (ComponentCategory(..), DocumentationRoute)


type alias Model =
    { headerContentFooterExample : Container.Model }


type DemoBox
    = HeaderContentFooterExample


type Msg
    = DemoBoxMsg DemoBox Container.Msg


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    ( model, Cmd.none )


route : DocumentationRoute Model Msg
route =
    { title = "Layout"
    , category = Layout
    , view = view
    , update = update
    , initialModel =
        { headerContentFooterExample = { sourceCodeVisible = False, sourceCode = "" }
        }
    }


basicExample : Model -> Styled.Html Msg
basicExample model =
  constructExample
    { model = model.headerContentFooterExample
    , lift = HeaderContentFooterExample
    , view = HeaderContentFooterExample.example
    , metaInfo =
        { title = "Type"
        , content = "Basic Example"
        , ellieDemo = ""
        , sourceCode = "" }
    }

view : Model -> Styled.Html Msg
view model =
    div []
        [ documentationHeading "Layout"
        , documentationSubheading Typography.WithoutAnchorLink "Examples"
        , div [ css [ displayFlex ] ]
            [ div [ css [ width (pct 100), height (pct 100) ] ] [ basicExample model ]
            ]
        ]

-- HELPERS

type alias ExampleArgs =
    { model : Container.Model
    , lift : DemoBox
    , view : Html Container.Msg
    , metaInfo : Container.ContainerMetaSection
    }


constructExample : ExampleArgs -> Styled.Html Msg
constructExample exampleArgs =
    let
        styledExampleContents =
            fromUnstyled exampleArgs.view

        styledDemoContents =
            div [ css [ displayFlex ] ] [ styledExampleContents ]
    in
    Container.demoBox exampleArgs.metaInfo styledDemoContents
        |> Container.view exampleArgs.model
        |> Styled.map (DemoBoxMsg exampleArgs.lift)
