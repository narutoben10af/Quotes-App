//
//  QuotesModel.swift
//  Quotes App
//
//  Created by Lim Si Eian on 22/10/21.
//

import Foundation

class QuotesModel : ObservableObject
{
    @Published var quotes = [Quote]()
    
    init()
    {
        self.quotes = DataService.getLocalData()
    }
}
