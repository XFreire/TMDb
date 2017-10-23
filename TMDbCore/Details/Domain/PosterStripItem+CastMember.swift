//
//  PosterStripItem+CastMember.swift
//  TMDbCore
//
//  Created by Alexandre Freire García on 23/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import Foundation

extension PosterStripItem {
    init(castMember: Credits.CastMember) {
        identifier = castMember.identifier
        mediaType = .person // to navigate
        title = castMember.name
        metadata = castMember.character
        posterPath = castMember.profilePath
    }
}
