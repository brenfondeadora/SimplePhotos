//
//  Photo.swift
//  SimplePhotos
//
//  Created by Brenda Saavedra  on 28/04/23.
//

import Foundation

struct Photo: Codable, Hashable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
