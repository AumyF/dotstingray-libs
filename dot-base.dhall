let foldLeft =
      https://raw.githubusercontent.com/dhall-lang/dhall-lang/v21.1.0/Prelude/List/foldLeft.dhall

let makeArgumentList =
      \(list : List Text) ->
        foldLeft Text list Text (\(a : Text) -> \(b : Text) -> a ++ " " ++ b) ""

let withArgumentList =
      \(prefix : Text) -> \(args : List Text) -> prefix ++ makeArgumentList args

in  { makeArgumentList, withArgumentList }
