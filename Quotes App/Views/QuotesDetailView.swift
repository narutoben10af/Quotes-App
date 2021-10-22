//
//  QuotesDetailView.swift
//  Quotes App
//
//  Created by Lim Si Eian on 22/10/21.
//

import SwiftUI

struct QuotesDetailView: View
{
    var quote: Quote
    var body: some View
    {
        ScrollView
        {
            VStack
            {
                Text(quote.strQuote).font(.largeTitle).fontWeight(.bold)
                Text(quote.author).font(.title).fontWeight(.bold)
                Spacer()
                Divider()
                Text(quote.explanation).fontWeight(.semibold).padding()
            }
        }
    }
}

struct QuotesDetailView_Previews: PreviewProvider {
    static var previews: some View
    {
        let quote = QuotesModel()
        QuotesDetailView(quote: quote.quotes[0])
    }
}
