
module Route exposing (..)

import UrlParser as Url exposing (Parser, (</>))

type Route
    = Home
    | Comments Int
    | NewTopic

route : Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home (Url.s "")
        , Url.map Comments (Url.s "comments" </> Url.int)
        , Url.map NewTopic (Url.s "newtopic")
        ]

routeToString : Route -> String
routeToString r =
    let pathlist = case r of
        Home -> []
        Comments id -> ["comments", toString id]
        NewTopic -> ["newtopic"]
    in
        "/" ++ String.join "/" pathlist

