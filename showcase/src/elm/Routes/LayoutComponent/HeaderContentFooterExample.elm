module Routes.LayoutComponent.HeaderContentFooterExample exposing (example)

import Ant.Layout as Layout
import Ant.Tooltip as Tooltip exposing (tooltip)
import Ant.Typography.Text as Text
import Css exposing (..)
import Html exposing (Html)
import Html.Styled as Styled exposing (div, fromUnstyled, toUnstyled)
import Html.Styled.Attributes exposing (css)


headerComponent =
    div
        [ css
            [ backgroundColor (hex "#001529")
            , color (hex "#fff")
            , padding2 (px 4) (px 4)
            , height (px 50)
            ]
        ]
        []


headerContentFooterExample : Layout.LayoutTree msg
headerContentFooterExample =
    let
        mainContent =
            div
                [ css
                    [ backgroundColor (hex "#f0f2f5")
                    , displayFlex
                    , flexDirection column
                    , padding4 (px 36) (px 50) (px 0) (px 50)
                    , height (px 400)
                    ]
                ]
                [ div [ css [ backgroundColor (hex "#fff"), height (pct 100), padding (px 16) ] ] [ fromUnstyled (Text.text "Content" |> Text.toHtml) ]
                ]

        footerContent =
            div [ css [ backgroundColor (hex "#f0f2f5"), padding2 (px 16) (px 24), textAlign center ] ]
                [ fromUnstyled (Text.text "Make software great again by Elm" |> Text.toHtml) ]
    in
    Layout.layout2
        (Layout.header <| toUnstyled headerComponent)
        (Layout.layout2
            (Layout.content <| toUnstyled mainContent)
            (Layout.footer <| toUnstyled footerContent)
        )


headerSider : Layout.LayoutTree msg
headerSider =
    let
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

        mainContent =
            div
                [ css
                    [ backgroundColor (hex "#f0f2f5")
                    , displayFlex
                    , flexDirection column
                    , padding (px 24)
                    , height (px 400)
                    , width (pct 100)
                    ]
                ]
                [ div [ css [ backgroundColor (hex "#fff"), height (pct 100), padding (px 16) ] ] [ fromUnstyled (Text.text "Content" |> Text.toHtml) ]
                ]

        footerContent =
            div [ css [ backgroundColor (hex "#f0f2f5"), padding2 (px 16) (px 24), textAlign center ] ]
                [ fromUnstyled (Text.text "Make software great again by Elm" |> Text.toHtml) ]
    in
    Layout.layout2
        (Layout.header <| toUnstyled headerComponent)
        (Layout.layout2
            (Layout.sidebar (toUnstyled sidebarContent)
                |> Layout.sidebarWidth 246
                |> Layout.sidebarToTree
            )
            (Layout.content <| toUnstyled mainContent)
        )


headerSider2 : Layout.LayoutTree msg
headerSider2 =
    let
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

        mainContent =
            div
                [ css
                    [ backgroundColor (hex "#f0f2f5")
                    , displayFlex
                    , flexDirection column
                    , padding (px 24)
                    , height (px 400)
                    , width (pct 100)
                    ]
                ]
                [ div [ css [ backgroundColor (hex "#fff"), height (pct 100), padding (px 16) ] ] [ fromUnstyled (Text.text "Content" |> Text.toHtml) ]
                ]

        footerContent =
            div [ css [ backgroundColor (hex "#f0f2f5"), padding2 (px 16) (px 24), textAlign center ] ]
                [ fromUnstyled (Text.text "Make software great again by Elm" |> Text.toHtml) ]
    in
    Layout.layout2
        (Layout.header <| toUnstyled headerComponent)
        (Layout.layout2
            (Layout.sidebar (toUnstyled sidebarContent)
                |> Layout.sidebarWidth 246
                |> Layout.sidebarToTree
            )
            (Layout.content <| toUnstyled mainContent)
        )



-- sidebar : Layout.LayoutTree msg
-- sidebar =
--     let
--         content =
--             div
--                 [ css
--                     [ backgroundColor (hex "#fff")
--                     , displayFlex
--                     , flexDirection column
--                     , height (pct 100)
--                     , padding2 (px 4) (px 4)
--                     ]
--                 ]
--                 [ fromUnstyled (Text.text "Sidebar" |> Text.toHtml)
--                 ]
--     in
--     Layout.sidebar (toUnstyled content)
--         |> Layout.sidebarWidth 246
--         |> Layout.sidebarToTree
-- layout : Layout.LayoutTree msg
-- layout =
--     let
--         navbarContent =
--             div [ css [ backgroundColor (hex "#3ba0e9"), padding2 (px 4) (px 4) ] ]
--                 [ fromUnstyled (Text.text "navbar" |> Text.toHtml) ]
--         mainContent =
--             div
--                 [ css
--                     [ backgroundColor (hex "#0000FF")
--                     , displayFlex
--                     , flexDirection column
--                     , padding2 (px 4) (px 4)
--                     , height (px 130)
--                     ]
--                 ]
--                 [ fromUnstyled (Text.text "main content" |> Text.toHtml)
--                 ]
--         footerContent =
--             div [ css [ backgroundColor (hex "#7dbcea"), padding2 (px 4) (px 4) ] ]
--                 [ fromUnstyled (Text.text "footer" |> Text.toHtml) ]
--     in
--     Layout.layout2
--         (Layout.header <| toUnstyled navbarContent)
--         (Layout.layout2
--             sidebar
--             (Layout.layout2
--                 (Layout.content <| toUnstyled mainContent)
--                 (Layout.footer <| toUnstyled footerContent)
--             )
--         )


example : Html msg
example =
    headerSider
        |> Layout.toHtml
