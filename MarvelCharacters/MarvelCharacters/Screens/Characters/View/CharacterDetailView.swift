//
//  CharacterDetailView.swift
//  MarvelCharacters
//
//  Created by Femer Garcia on 5/4/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    var character: Character
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading,spacing: 4){
                if let path = character.thumbnail?.path, let thumbnailExtension = character.thumbnail?.thumbnailExtension {
                    let url = String(format: "%@.%@", path, thumbnailExtension)
                    AsyncImage(
                        url: URL(string: url),
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                        },
                        placeholder: {
                            Image("Placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 170,maxHeight: 170)
                                .background(Color.white)
                                .padding(20)
                        }
                    )}
                
                VStack(alignment: .leading,spacing: 4){
                    if let name = character.name {
                        Text(name)
                            .bold()
                            .multilineTextAlignment(.center)
                            .lineSpacing(4.0)
                            .font(.callout)
                            .foregroundColor(Color("PrimaryTextColor"))
                    }
                    
                    if let modified = character.modified {
                        Text(modified.getFormattedDate())
                            .multilineTextAlignment(.center)
                            .lineSpacing(4.0)
                            .font(.footnote)
                            .foregroundColor(Color("PrimaryTextColor"))
                            .padding(.bottom)
                    }
                    
                    if let description = character.description, description.isEmpty == false {
                        Text(description)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4.0)
                            .font(.footnote)
                            .foregroundColor(Color("PrimaryTextColor"))
                    }else{
                        Text("no_description_available".localized)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4.0)
                            .font(.footnote)
                            .foregroundColor(Color("PrimaryTextColor"))
                    }
                }.padding(14)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: 410)
            .padding(.bottom)
            
            if(character.comics?.items?.isEmpty == false){
                SectionCharacterView(text: "comics".localized, items: character.comics?.items ?? [])
                    .padding()
            }
            
            if(character.series?.items?.isEmpty == false){
                SectionCharacterView(text: "series".localized, items: character.series?.items ?? [])
                    .padding()
            }
            
        }
    }
}

struct SectionCharacterView: View {
    var text:String
    var items: [DetailItem]
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8){
            Text(text)
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.callout)
                .foregroundColor(Color("PrimaryTextColor"))
            
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHStack {
                    ForEach(items, id: \.name) { item in
                        SectionRowView(detailItem: item)
                    }
                }
            }
            .frame(height: 180)
        }
    }
}


struct CharacterDetialView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character.example)
        CharacterDetailView(character: Character.example)
            .preferredColorScheme(.dark)
    }
}
