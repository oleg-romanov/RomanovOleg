//
//  CouncilMember.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import Foundation

struct CouncilMember: Codable {
    enum Rank: String, Codable {
        case grandmaster = "Grandmaster"
        case headOfCouncil = "Head of Jedi Council"
        case master = "Master"
        case knight = "Knight"
    }
    let id: String
    let name: String
    let rank: Rank
    let imageUrl: URL?
}
