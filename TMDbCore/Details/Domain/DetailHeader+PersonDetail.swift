//
//  DetailHeader+PersonDetail.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 23/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(person: PersonDetail) {
        title = person.name
        metadata = [
            person.birthday.map{ "Born: \($0)" },
            person.deathday.map{ "Died: \($0)" }
        ].flatMap{ $0 }.joined(separator: "\n")
        
        posterPath = person.profilePath
        backdropPath = person.taggedImages.results
            .filter{ $0.aspectRatio > 1.7 }
            .map{ $0.path }
            .first
    }
}
