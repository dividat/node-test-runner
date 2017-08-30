module Test.Reporter.Console.Format.Color exposing (formatEquality)

import Console
import Test.Reporter.Highlightable as Highlightable exposing (Highlightable(..))


formatEquality : List (Highlightable String) -> List (Highlightable String) -> ( String, String )
formatEquality highlightedExpected highlightedActual =
    let
        formattedExpected =
            highlightedExpected
                |> List.map fromHighlightable
                |> String.join ""

        formattedActual =
            highlightedActual
                |> List.map fromHighlightable
                |> String.join ""
    in
    ( formattedExpected, formattedActual )


fromHighlightable : Highlightable String -> String
fromHighlightable =
    Highlightable.resolve
        -- Cyan seems to look readable with both white and black text on top,
        -- so it should work with both dark and light console themes
        { fromHighlighted = Console.bgCyan
        , fromPlain = identity
        }
