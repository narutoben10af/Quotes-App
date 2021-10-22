//
//  Quotes.swift
//  Quotes App
//
//  Created by Lim Si Eian on 22/10/21.
//

import Foundation
import Combine

class Quote : Identifiable, Decodable
{
    var id:UUID?
    var image:String
    var author:String
    var strQuote:String
    var explanation:String
}
