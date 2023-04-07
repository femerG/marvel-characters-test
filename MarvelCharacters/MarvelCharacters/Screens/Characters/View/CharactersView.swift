//
//  CharactersView.swift
//  MarvelCharacters
//
//  Created by Femer Garcia on 5/4/23.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()
    
    var columns: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 170)), count: 2)
    }
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    TextField("search_character".localized, text: $viewModel.searchText)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Spacer(minLength: 16)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.filteredCharacters, id: \.id) { item in
                            NavigationLink(destination: CharacterDetailView(character: item)){
                                CharacterRowView(character: item)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    if viewModel.isLoading {
                        LottieView(lottieFile: "wave_loading")
                            .frame(width: 300, height: 300)
                    }
                    
                    if viewModel.showError ||
                        (viewModel.filteredCharacters.isEmpty && !viewModel.isLoading) {
                        VStack(alignment: .center) {
                            Image("SadFace")
                                .resizable()
                                .frame(width: 56,height: 56)
                            Text("No result have been found")
                                .bold()
                                .multilineTextAlignment(.center)
                                .lineSpacing(4.0)
                                .font(.title3)
                                .foregroundColor(Color("PrimaryTextColor"))
                        }
                        .padding(.top,120)
                    }
                }
            }
            .navigationTitle("title".localized)
            .onAppear(perform: viewModel.fetchCharacters)
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
        CharactersView()
            .preferredColorScheme(.dark)
    }
}
