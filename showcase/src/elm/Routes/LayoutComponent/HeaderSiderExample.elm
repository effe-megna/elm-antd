module Routes.LayoutComponent.HeaderSiderExample exposing (example)

import Ant.Layout as Layout
import Ant.Tooltip as Tooltip exposing (tooltip)
import Ant.Typography.Text as Text
import Css exposing (..)
import Html exposing (Html)
import Html.Styled as Styled exposing (div, fromUnstyled, toUnstyled)
import Html.Styled.Attributes exposing (css)


mainContentView : Styled.Html msg
mainContentView =
    let
        sidebarContent =
            div
                [ css
                    [ backgroundColor (hex "#fff")
                    , displayFlex
                    , flexDirection column
                    , height (pct 100)
                    , padding2 (px 16) (px 12)
                    , borderRight3 (px 1) solid (hex "#eae6e6")
                    ]
                ]
                [ fromUnstyled (Text.text "Sidebar" |> Text.toHtml)
                ]

        mainContent =
          div
            [ css
                [ backgroundColor (hex "#f0f2f5")
                , displayFlex
                , flexDirection column
                , width (pct 100)
                ]
            ]
            [ div [ css [ backgroundColor (hex "#fff"), height (pct 100), padding (px 16) ] ] [ fromUnstyled (Text.text "Content" |> Text.toHtml) ]
            ]
    in
    div
      [ css
          [ backgroundColor (hex "#f0f2f5")
          , displayFlex
          , flexDirection column
          , height (px 400)
          , width (pct 100)
          , padding4 (px 50) (px 50) (px 14) (px 50)
          ]
      ]
      [ fromUnstyled
          (Layout.layout2
              (Layout.sidebar (toUnstyled sidebarContent)
                  |> Layout.sidebarWidth 246
                  |> Layout.sidebarToTree
              )
              (Layout.content <| toUnstyled (mainContent))
              |> Layout.toHtml
          )
      ]


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

        sidebarContent =
            div
                [ css
                    [ backgroundColor (hex "#fff")
                    , displayFlex
                    , flexDirection column
                    , height (pct 100)
                    , padding2 (px 16) (px 12)
                    ]
                ]
                [ fromUnstyled (Text.text "Sidebar" |> Text.toHtml)
                ]

        footerContent =
            div [ css [ backgroundColor (hex "#f0f2f5"), padding2 (px 16) (px 24), textAlign center ] ]
                [ fromUnstyled (Text.text "Make software great again by Elm" |> Text.toHtml) ]
    in
    Layout.layout
        (Layout.header <| toUnstyled headerContent)
        (Layout.content <| toUnstyled mainContentView)
        (Layout.footer <| toUnstyled footerContent)
        |> Layout.toHtml
