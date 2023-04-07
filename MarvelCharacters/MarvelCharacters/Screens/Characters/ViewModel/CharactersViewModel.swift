//
//  CharactersViewModel.swift
//  MarvelCharacters
//
//  Created by Femer Garcia on 5/4/23.
//

import Foundation

class CharactersViewModel: ObservableObject{
    @Published var characters = [Character]()
    @Published var filteredCharacters = [Character]()
    
    @Published private var _isLoading: Bool = false
    @Published private var _showError: Bool = false
    
    @Published var searchText: String = ""
    
    init(){
        $searchText
            .map{ searchText in
                self.characters.filter{
                    return $0.name?.lowercased().contains(searchText.lowercased()) ?? false || searchText.isEmpty
                }
            }
            .assign(to: &$filteredCharacters)
    }
    
    var isLoading: Bool {
        get { return _isLoading}
    }
    
    var showError: Bool {
        get { return _showError}
    }
    
    func fetchCharacters() {
        _isLoading = true
        let url = URL(string: "\(Constants.Api.serverUri)\(Constants.Api.characters)")!
        let request = APIRequest(url: url)
        request.perform { [weak self] (results: CharactersResult?) -> Void in
            self?._isLoading = false
            guard let results = results else {
                self?._showError = true
                return
            }
            self?.characters = results.data?.results ?? []
            self?.searchText = ""
        }
    }
}
