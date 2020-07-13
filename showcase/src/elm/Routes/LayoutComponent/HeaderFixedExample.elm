module Routes.LayoutComponent.HeaderFixedExample exposing (example)

import Ant.Layout as Layout
import Ant.Tooltip as Tooltip exposing (tooltip)
import Ant.Typography.Text as Text
import Css exposing (..)
import Html exposing (Html)
import Html.Styled as Styled exposing (div, text, fromUnstyled, toUnstyled)
import Html.Styled.Attributes exposing (css)


example : Html msg
example =
    let
        headerContent =
            div
                [ css
                    [ backgroundColor (hex "#001529")
                    , color (hex "#fff")
                    , padding2 (px 4) (px 4)
                    , height (px 50)
                    ]
                ]
                []
        
        someContents =
          div
            [ css [ padding (px 40) ] ]
            [ fromUnstyled (Text.text "Some contents..." |> Text.toHtml) ]

        mainContent =
            div
                [ css
                    [ backgroundColor (hex "#f0f2f5")
                    , displayFlex
                    , flexDirection column
                    , padding (px 36)
                    , maxHeight (px 300)
                    , overflow auto
                    ]
                ]
                [ div [ css [ backgroundColor (hex "#fff"), height (pct 100), padding (px 16) ] ] 
                  [ someContents
                  , someContents
                  , someContents
                  , someContents
                  , someContents
                  , someContents
                  , someContents
                   ]
                ]

        footerContent =
            div [ css [ backgroundColor (hex "#f0f2f5"), padding2 (px 16) (px 24), textAlign center ] ]
                [ fromUnstyled (Text.text "Make software great again by Elm" |> Text.toHtml) ]
    in
    Layout.layout2
        (Layout.header <| toUnstyled headerContent)
        (Layout.content <| toUnstyled mainContent)
        |> Layout.toHtml