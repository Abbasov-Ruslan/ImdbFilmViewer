//
//  AutoCompleteItem.swift
//  ImdbFilms
//
//  Created by Ruslan Abbasov on 13.10.2022.
//

import Foundation

// MARK: - Welcome
class Welcome: Codable {
    let d: [D]
    let q: String
    let v: Int

    init(d: [D], q: String, v: Int) {
        self.d = d
        self.q = q
        self.v = v
    }
}

// MARK: - D
class D: Codable {
    let i: I?
    let id, l, q, qid: String
    let rank: Int
    let s: String
    let y: Int?
    let yr: String?

    init(i: I?, id: String, l: String, q: String, qid: String, rank: Int, s: String, y: Int?, yr: String?) {
        self.i = i
        self.id = id
        self.l = l
        self.q = q
        self.qid = qid
        self.rank = rank
        self.s = s
        self.y = y
        self.yr = yr
    }
}

class I: Codable {
    let height: Int
    let imageURL: String
    let width: Int

    enum CodingKeys: String, CodingKey {
        case height
        case imageURL
        case width
    }

    init(height: Int, imageURL: String, width: Int) {
        self.height = height
        self.imageURL = imageURL
        self.width = width
    }
}
