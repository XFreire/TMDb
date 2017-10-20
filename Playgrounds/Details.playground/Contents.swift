//: Playground - noun: a place where people can play

@testable import TMDbCore

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let assembly = CoreAssembly()

let posterStrip = PosterStripView.instantiate()
posterStrip.frame = CGRect(x: 0, y: 0, width: 375, height: 218)
posterStrip.presenter = assembly.detailsAssembly.posterStripPresenter()
posterStrip.title = "cast"
posterStrip.items = [
    PosterStripItem(identifier: 1223786,
                    mediaType: .person,
                    title: "Emilia Clarke",
                    metadata: "Daenerys Targaryen",
                    posterPath: "/iNuaYKoWb7psag7Tg3eRucj5sn2.jpg"),
    PosterStripItem(identifier: 239019,
                    mediaType: .person,
                    title: "Kit Harington",
                    metadata: "Jon Snow",
                    posterPath: "/4MqUjb1SYrzHmFSyGiXnlZWLvBs.jpg"),
    PosterStripItem(identifier: 22970,
                    mediaType: .person,
                    title: "Peter Dinklage",
                    metadata: "Tyrion Lannister",
                    posterPath: "/8Z7cq5pUkz8FtpzOBsd0tgZPoO6.jpg"),
    PosterStripItem(identifier: 17286,
                    mediaType: .person,
                    title: "Lena Headey",
                    metadata: "Cersei Lannister",
                    posterPath: "/wcpy6J7KLzmVt0METboX3CZ0Jp.jpg"),
    PosterStripItem(identifier: 12795,
                    mediaType: .person,
                    title: "Nikolaj Coster-Waldau",
                    metadata: "Jaime Lannister",
                    posterPath: "/1r6SwIV4QqZgdkRuql0EQHd0rUB.jpg"),
]

PlaygroundPage.current.liveView = posterStrip
