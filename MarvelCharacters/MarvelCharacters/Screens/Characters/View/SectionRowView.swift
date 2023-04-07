//
//  SectionRowView.swift
//  MarvelCharacters
//
//  Created by Femer Garcia on 6/4/23.
//

import SwiftUI

struct SectionRowView: View {
    
    var detailItem: DetailItem
    
    var body: some View{
        VStack(alignment: .leading,spacing: 4){
            Image("Placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 170,maxHeight: 170)
                .background(Color.white)
                .padding(20)
            if let name = detailItem.name {
                Text(name)
                    .bold()
                    .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                    .lineSpacing(4.0)
                    .lineLimit(1)
                    .font(.caption)
                    .foregroundColor(Color("PrimaryTextColor"))
                .padding(6)
            }
        }
        .background(Color("ItemBackground"))
        .frame(maxWidth: 170,maxHeight: 170)
        .cornerRadius(4)
        .shadow(radius: 2,x: 1,y: 1)
    }
}

struct SectionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SectionRowView(detailItem: Character.example.comics!.items!.first!)
    }
}

