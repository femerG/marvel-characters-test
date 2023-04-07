//
//  Character.swift
//  MarvelCharacters
//
//  Created by Femer Garcia on 5/4/23.
//

import Foundation

// MARK: - Character
struct Character: Codable {
    let id: Int?
    let name, description: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Detail?
    let stories: Detail?
    let events: Detail?
    let urls: [URLElement]?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - Detail
struct Detail: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [DetailItem]?
    let returned: Int?
}

// MARK: - DetailItem
struct DetailItem: Codable {
    let resourceURI: String?
    let name: String?
    let type: String?
}


// MARK: - URLElement
struct URLElement: Codable {
    let type: String?
    let url: String?
}

// MARK: - CharactersResult
struct CharactersResult: Codable {
    let code: Int?
    let status, message: String?
    let data: CharacterDataClass?
    
    init(){
        self.code = nil
        self.status = nil
        self.message = nil
        self.data = nil
    }
}

// MARK: - CharacterDataClass
struct CharacterDataClass: Codable {
    let offset, limit, total, count: Int?
    let results: [Character]?
}

#if DEBUG
// MARK: - Example Item
extension Character {
    
    static var example: Character {
        
        Character(
            id: 1010354,
            name: "Adam Warlock",
            description: "Adam Warlock is an artificially created human who was born in a cocoon at a scientific complex called The Beehive.", modified: "2013-08-07T13:49:06-0400",
            thumbnail:
                Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/a/f0/5202887448860",
                          thumbnailExtension: "jpg"),
            resourceURI: "http://gateway.marvel.com/v1/public/characters/1010354",
            comics:
                Detail(available: 2,
                       collectionURI: "http://gateway.marvel.com/v1/public/characters/1010354/comics",
                       items: [
                        DetailItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/62151",
                                   name: "All-New Guardians of the Galaxy Vol. 3: Infinity Quest (Trade Paperback)",
                                   type: nil),
                        DetailItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/17271",
                                   name: "Annihilation: Conquest (2007) #1",
                                   type: nil)
                       ],
                       returned: 1),
            series:
                Detail(available: 2,
                       collectionURI: "http://gateway.marvel.com/v1/public/characters/1010354/comics",
                       items: [
                        DetailItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/62151",
                                   name: "All-New Guardians of the Galaxy Vol. 3: Infinity Quest (Trade Paperback)",
                                   type: nil),
                        DetailItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/17271",
                                   name: "Annihilation: Conquest (2007) #1",
                                   type: nil)
                        ],
                       returned: 1),
            stories:
                Detail(available: 2,
                       collectionURI: "http://gateway.marvel.com/v1/public/characters/1010354/comics",
                       items: [
                        DetailItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/62151",
                                   name: "All-New Guardians of the Galaxy Vol. 3: Infinity Quest (Trade Paperback)",
                                   type: nil),
                        DetailItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/17271",
                                   name: "Annihilation: Conquest (2007) #1",
                                   type: nil)
                        ],
                       returned: 1),
            events:
                Detail(available: 2,
                       collectionURI: "http://gateway.marvel.com/v1/public/characters/1010354/comics",
                       items: [
                        DetailItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/62151",
                                   name: "All-New Guardians of the Galaxy Vol. 3: Infinity Quest (Trade Paperback)",
                                   type: nil),
                        DetailItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/17271",
                                   name: "Annihilation: Conquest (2007) #1",
                                   type: nil)
                        ],
                       returned: 1),
            urls: [
                URLElement(type: "detail",
                           url: "http://marvel.com/characters/2854/adam_warlock?utm_campaign=apiRef&utm_source=001ac6c73378bbfff488a36141458af2")
            ]
        )
    }
}
#endif
