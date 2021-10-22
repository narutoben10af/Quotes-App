//
//  DataService.swift
//  Quotes App
//
//  Created by Lim Si Eian on 22/10/21.
//

import Foundation

class DataService
{
    static func getLocalData() -> [Quote]
    {
        //Parse 1ocal json file
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "quotes", ofType: "json")
        //Check if pathString is not nill, otherwise return empty recipe list
        guard pathString != nil else
        {
            return [Quote]()
        }
        // Create a url obiect
        let url = URL(fileURLWithPath: pathString!)
        
        do
        {
            // Create a data obiect
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do
            {
                let quoteData = try decoder.decode([Quote].self, from: data)
                
                // Add the unique IDs
                for r in quoteData
                {
                    r.id = UUID()
                }
                
                // Return the recipes
                return quoteData
            }
            catch
            {
                print(error)
            }
            

        }
        catch
        {
            print(error)
        }
        

        
        return [Quote]()
    }
    
}
