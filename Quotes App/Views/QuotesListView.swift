//
//  ContentView.swift
//  Quotes App
//
//  Created by Lim Si Eian on 22/10/21.
//

import SwiftUI

struct QuotesListView: View
{
    @ObservedObject var model = QuotesModel()
    @State var searchText: String = ""

    var searchResults: [Quote]
    {
        if searchText.isEmpty
        {
            return model.quotes
        }
//        else if (model.quotes.contains(where: searchText))
//        {
//            return model.quotes.filter
//            {
//                $0.author.contains(searchText)
//            }
//        }
        else
        {
            return model.quotes.filter
            { item in
                item.strQuote.localizedCaseInsensitiveContains(searchText) || item.author.localizedCaseInsensitiveContains(searchText)
            }
//            return model.quotes.filter
//            { [$0.strQuote, $0.author].contains(searchText)
//            }

        }
    }
    var body: some View
    {
        if #available(iOS 15.0, *) {
            NavigationView
            {
                ScrollView
                {
                    VStack
                    {
//                        ForEach(model.quotes)
                        ForEach(searchResults)
                        { quote in
                            NavigationLink(
                                destination: QuotesDetailView(quote: quote),
                                label:
                                    {
                                        ZStack
                                        {
                                            Image(quote.image).resizable().aspectRatio(contentMode: .fill).frame(minWidth: 300, idealWidth: 500, maxWidth: 600, minHeight: nil, idealHeight: 200, maxHeight: 200, alignment: .center).cornerRadius(20).clipped().padding(.vertical).shadow(radius: 10)
                                            VStack
                                            {
                                                
                                                Text(quote.strQuote).font(.largeTitle).fontWeight(.bold)
                                                
                                                Text(quote.author).font(.headline).fontWeight(.semibold)
                                                
                                            }.padding().background(Color.gray.opacity(0.5)).cornerRadius(20).foregroundColor(.white)
                                            
                                        }
                                        
                                    })
                        }
                    }.navigationTitle("Quotes")
                }
            }.searchable(text: $searchText, prompt: "Search Quotes", suggestions: {
                ForEach(model.quotes)
                {suggestion in
                    Text(suggestion.strQuote).fontWeight(.bold).foregroundColor(Color.accentColor).searchCompletion(suggestion.strQuote).padding().background(Color.clear).opacity(2.0)
                    
//                        .blur(radius: 0.5, opaque: false)
                }
//                {Text("Unrelenting Guts").searchCompletion("Unrelenting Guts")}{Text("Confronting Courage").searchCompletion("Confronting Courage")}
            }
            )
        } else {
            // Fallback on earlier versions
        }
        
    }
    
//        else
//        {
//            return model.quotes.filter
//            {
//                $0.author.contains(searchText)
//            }
//        }

}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        QuotesListView()
    }
}
