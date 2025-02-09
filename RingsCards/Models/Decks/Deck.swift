//
//  Deck.swift
//  RingsCards
//
//  Created by Christoph Freier on 25.09.23.
//

import Foundation
import SwiftData

@Model
final class Deck: Identifiable {
    var name: String
    let date_creation: Date
    var date_update: Date
//    var description_md: String
//    var user_id: Int
    var heroes: [String:Int]
    var slots: [String:Int]
//    var sideslots: [String:Int]
//    var version: String
    var last_pack: String
//    var freeze_comments: String?
//    var is_published: Bool
//    var nb_votes: Int
//    var nb_favorites: Int
//    var nb_comments: Int
    var starting_threat: Int
    var campaigns: [Campaign]?

    init(name: String, date_creation: Date = .now, heroes: [String:Int]? = [:], slots: [String:Int]? = [:]) {
        self.name = name
        self.date_creation = date_creation
        self.date_update = date_creation
//        self.description_md = ""
//        self.user_id = 0
        self.heroes = heroes ?? [:]
        self.slots = slots ?? [:]
//        self.sideslots = [:]
//        self.version = ""
        self.last_pack = "Core Set"
//        self.freeze_comments = ""
//        self.is_published = false
//        self.nb_votes = 0
//        self.nb_favorites = 0
//        self.nb_comments = 0
        self.starting_threat = 0
    }
}

extension Deck {
    static var emptyDeck: Deck {
        Deck(name: "", heroes: [:], slots: [:])
    }
}

extension Deck {
    static func predicate(
        searchText: String
    ) -> Predicate<Deck> {

        return #Predicate<Deck> { deck in
            (searchText.isEmpty || deck.name.localizedStandardContains(searchText))
        }
    }
}
