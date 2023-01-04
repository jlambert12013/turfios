//
//  ProperyData.swift
//  Turf
//
//  Created by Jim Lambert on 1/2/23.
// “Your Time Is Limited, So Don't Waste It Living Someone Else's Life.” - Steve Jobs

import Foundation

class PropertyData: ObservableObject {
    
    @Published var property = []
    
    func getPropertyData() async {
        let headers = [ "X-RapidAPI-Key": "1c83f9affemshab506cdc8886fe2p1b9ac4jsnac4bb8278a3c",
                        "X-RapidAPI-Host": "realty-mole-property-api.p.rapidapi.com" ]
        
        guard let url = URL(string: "https://realty-mole-property-api.p.rapidapi.com/properties?address=5500%20Grand%20Lake%20Dr%2C%20San%20Antonio%2C%20TX%2C%2078244") else {
            print("ERROR: No valid URL \n")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        
        let session = URLSession.shared
        let task =  session.dataTask(with: request) { data, response, error in
            
            if error != nil {
                print("ERROR: \(String(describing: error))\n")
                return
            }
    
            guard let unwrapped = data else {
                print("ERROR: NO DATA FROM SESSION \n")
                return
            }
            
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Property].self, from: unwrapped) {
                print("\n \(decoded[0])")
                
          
                
            } else {
                print("ERROR: DATA NOT PARSED")
            }
            
        }
        task.resume()
    }
    
}
