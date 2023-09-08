//
//  Deck.swift
//  RingsCards
//
//  Created by Christoph Freier on 27.08.23.
//

import Foundation

struct Deck: Hashable, Codable, Identifiable {
    var id: UUID
    var name: String
    var date_creation: String
    var date_update: String
    var description_md: String
    var user_id: Int
    var heroes: [String:Int]
    var slots: [String:Int]
    var sideslots: [String:Int]
    var version: String
    var last_pack: String
    var freeze_comments: String?
    var is_published: Bool
    var nb_votes: Int
    var nb_favorites: Int
    var nb_comments: Int
    var starting_threat: Int
}

extension Deck {
    init(name: String) {
        self.id = UUID()
        self.name = name
        self.date_creation = Date.now.formatted(date: .abbreviated, time: .shortened)
        self.date_update = Date.now.formatted(date: .abbreviated, time: .shortened)
        self.description_md = ""
        self.user_id = 0
        self.heroes = [:]
        self.slots = [:]
        self.sideslots = [:]
        self.version = ""
        self.last_pack = "Core Set"
        self.freeze_comments = ""
        self.is_published = false
        self.nb_votes = 0
        self.nb_favorites = 0
        self.nb_comments = 0
        self.starting_threat = 0
    }
}
