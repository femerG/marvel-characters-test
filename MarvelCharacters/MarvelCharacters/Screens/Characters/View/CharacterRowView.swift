//
//  CharacterRowView.swift
//  MarvelCharacters
//
//  Created by Femer Garcia on 5/4/23.
//

import SwiftUI

struct CharacterRowView: View {
    
    var character: Character
    
    var body: some View{
        VStack(alignment: .leading,spacing: 4){
            
            if let path = character.thumbnail?.path, let thumbnailExtension = character.thumbnail?.thumbnailExtension {
                let url = String(format: "%@.%@", path, thumbnailExtension)
                AsyncImage(
                    url: URL(string: url),
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 170,maxHeight: 170)
                    },
                    placeholder: {
                        Image("Placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 170,maxHeight: 170)
                            .background(Color.white)
                            .padding(20)
                    }
                )
            }
            
            VStack(alignment: .leading){
                if let name = character.name {
                    Text(name)
                        .bold()
                        .multilineTextAlignment(.center)
                        .lineSpacing(4.0)
                        .font(.caption)
                        .foregroundColor(Color("PrimaryTextColor"))
                }
                
                if let modified = character.modified {
                    Text(modified.getFormattedDate())
                        .multilineTextAlignment(.center)
                        .lineSpacing(4.0)
                        .font(.caption)
                        .foregroundColor(Color("PrimaryTextColor"))
                }
            }
            .padding(6)
        }
        .background(Color("ItemBackground"))
        .frame(width: 200, height: 200)
        .cornerRadius(4)
        .shadow(radius: 2,x: 1,y: 1)
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(character: Character.example)
    }
}
