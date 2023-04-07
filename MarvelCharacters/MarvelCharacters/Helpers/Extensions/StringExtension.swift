//
//  DateExtension.swift
//  MarvelCharacters
//
//  Created by Femer Garcia on 5/4/23.
//

import Foundation

extension String {
    func getFormattedDate() -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = Constants.General.CharacterFormatter
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = Constants.General.CharacterShortFormatter
        
        let date: Date? = dateFormatterGet.date(from: self)
        return dateFormatterPrint.string(from: date!);
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
}
