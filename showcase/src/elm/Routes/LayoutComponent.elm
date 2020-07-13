module Routes.LayoutComponent exposing (Model, Msg, route)

import Css exposing (column, displayFlex, flexDirection, height, marginRight, maxWidth, pct, px, width)
import Html exposing (Html)
import Html.Styled as Styled exposing (div, fromUnstyled, span, text)
import Html.Styled.Attributes exposing (css)
import Routes.LayoutComponent.HeaderContentFooterExample as HeaderContentFooterExample
import Routes.LayoutComponent.HeaderFixedExample as HeaderFixedExample
import Routes.LayoutComponent.HeaderSider2Example as HeaderSider2Example
import Routes.LayoutComponent.HeaderSiderExample as HeaderSiderExample
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
    { headerContentFooterExample : Container.Model
    , headerSiderExample : Container.Model
    , headerSider2Example : Container.Model
    , headerFixedExample : Container.Model
    }


type DemoBox
    = HeaderContentFooterExample
    | HeaderSiderExample
    | HeaderSider2Example
    | HeaderFixedExample


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
        , headerSiderExample = { sourceCodeVisible = False, sourceCode = "" }
        , headerSider2Example = { sourceCodeVisible = False, sourceCode = "" }
        , headerFixedExample = { sourceCodeVisible = False, sourceCode = "" }
        }
    }


headerContentFooterExample : Model -> Styled.Html Msg
headerContentFooterExample model =
    constructExample
        { model = model.headerContentFooterExample
        , lift = HeaderContentFooterExample
        , view = HeaderContentFooterExample.example
        , metaInfo =
            { title = "Header-Content-Footer"
            , content = "Basic Example"
            , ellieDemo = ""
            , sourceCode = ""
            }
        }


headerSiderExample : Model -> Styled.Html Msg
headerSiderExample model =
    constructExample
        { model = model.headerSiderExample
        , lift = HeaderSiderExample
        , view = HeaderSiderExample.example
        , metaInfo =
            { title = "Header-Sider"
            , content = "Basic Example"
            , ellieDemo = ""
            , sourceCode = ""
            }
        }


headerSider2Example : Model -> Styled.Html Msg
headerSider2Example model =
    constructExample
        { model = model.headerSider2Example
        , lift = HeaderSider2Example
        , view = HeaderSider2Example.example
        , metaInfo =
            { title = "Header-Sider 2"
            , content = "Basic Example"
            , ellieDemo = ""
            , sourceCode = ""
            }
        }


headerFixedExample : Model -> Styled.Html Msg
headerFixedExample model =
    constructExample
        { model = model.headerFixedExample
        , lift = HeaderFixedExample
        , view = HeaderFixedExample.example
        , metaInfo =
            { title = "Header Fixed"
            , content = "Basic Example"
            , ellieDemo = ""
            , sourceCode = ""
            }
        }


view : Model -> Styled.Html Msg
view model =
    div []
        [ documentationHeading "Layout"
        , documentationSubheading Typography.WithoutAnchorLink "Examples"
        , div [ css [ displayFlex, flexDirection column ] ]
            [ div [ css [ width (pct 100), height (pct 100) ] ] [ headerContentFooterExample model ]
            , div [ css [ width (pct 100), height (pct 100) ] ] [ headerSiderExample model ]
            , div [ css [ width (pct 100), height (pct 100) ] ] [ headerSider2Example model ]
            , div [ css [ width (pct 100), height (pct 100) ] ] [ headerFixedExample model ]
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
