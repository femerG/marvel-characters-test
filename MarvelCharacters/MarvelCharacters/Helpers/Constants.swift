//
//  Constants.swift
//  MarvelCharacters
//
//  Created by Femer Garcia on 5/4/23.
//

import Foundation

enum Constants{
    enum General{
        public static let CharacterFormatter = "yyyy-MM-dd'T'HH:mm:ssZ"
        public static let CharacterShortFormatter = "MMM dd,yyyy"
    }
    
    enum Api{
        public static let serverUri = "https://gateway.marvel.com/v1/public"
        public static let characters = "/characters?ts=thesoer&limit=100&apikey=001ac6c73378bbfff488a36141458af2&hash=72e5ed53d1398abb831c3ceec263f18b"
    }
}
