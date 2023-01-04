//
////
////  PropertyData.swift
////  Turf
////
////  Created by Jim Lambert on 12/28/22.
////
//
//import Foundation
//
//class PropertyViewModel {
//
//    func getPropertyData() async {
//        
//        let headers = [
//            "X-RapidAPI-Key": "1c83f9affemshab506cdc8886fe2p1b9ac4jsnac4bb8278a3c",
//            "X-RapidAPI-Host": "realty-mole-property-api.p.rapidapi.com" ]
//        
//        let request = NSMutableURLRequest(url: NSURL(string: "https://realty-mole-property-api.p.rapidapi.com/properties?address=5500%20Grand%20Lake%20Dr%2C%20San%20Antonio%2C%20TX%2C%2078244")! as URL)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//        
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            
//            //  Unwrapping Data
//            guard let data = data else {
//                print("ERROR: \(String(describing: error)) \n")
//                return
//            }
//            
//            // Response Header from URLSession
//            if let response = response {
//                print("1. RESPONSE FROM URLSession")
//                print("TYPE: \(type(of: response))")
//                print("DATA:\n\(String(describing: response)) \n")
//                
//            }
//            
//            // Data returned from URLSession
//            print("2. PROPERTY DATA: RECIEVED")
//            print("PARSED: \(String(describing: data))")
//            print("TYPE: \(type(of: data)) \n")
//            
//            let decoder = JSONDecoder()
//            
//            do {
//                let propertyJSON = try? decoder.decode(Property.self, from: data)
//                
//                // Decoder Status
//                print("3. JSON DECODE: SUCCESSFUL")
//                print("DATA: \(String(describing: propertyJSON))")
//                print("TYPE: \(type(of: propertyJSON)) \n")
//                
//                // Check for Error
//                guard let propertyData = propertyJSON else  {
//                    print("ERROR UNWRAPPING OPTIONAL: \(String(describing: error)) \n")
//                    return
//                }
//                
//                // Unwrapping Optional
//                print("4. UNWARPPED OPTIONAL")
//                print("DATA: \(String(describing: propertyData))")
//                print("TYPE: \(type(of: propertyData)) \n")
//                
//                // Looping Array
//                print("5. PROPERTY ARRAY")
//                print("TYPE: \(type(of: propertyData))")
//                print("ARRAY: \(String(describing: propertyData)) \n")
//                
//                // Property Element
//                let propertyElement = propertyData[0]
//                print("6. PROPERTY ELEMENT")
//                print("TYPE: \(type(of: propertyElement))")
//                print("PROPERTY OBJECT: \(String(describing: propertyElement)) \n")
//                
//                // OUTPUT HEADER
//                //            let consoleHeader = " PROPERTY MIRROR "
//                //            let dash = "-"
//                //            let dashOutput = String(repeating: dash, count: consoleHeader.count)
//                //            print(dashOutput)
//                //            print(consoleHeader)
//                //            print(dashOutput)
//                //
//                // CREATE ARRAY USING MIRRORS
//                let propertyMirror = Mirror(reflecting: propertyElement)
//                var iteration = 0
//                for propertyChild in propertyMirror.children  {
//                    guard let label = propertyChild.label else {
//                        print("ERROR: NO LABEL") // UNWRAPPING OPTIONALS
//                        return
//                    }
//                    let value = propertyChild.value
//                    
//                    // OUTPUT TO CONSOLE
//                    print("  \(iteration)")
//                    print("  LABEL: (\(type(of: label))) \(String(describing: label))")
//                    print("  VALUE: (\(type(of: value)))  \(String(describing: value)) \n")
//                    iteration += 1
//                }
//            }
//        })
//        
//        dataTask.resume()
//    }
//    
//    
//    
//}
