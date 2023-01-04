//
//  Property.swift
//  Turf
//
//  Created by Jim Lambert on 1/2/23.
//

import Foundation

struct Property: Decodable {
    var addressLine1, city, state, zipCode: String
    var formattedAddress, assessorID: String
    var bedrooms: Int
    var county, legalDescription: String
    var squareFootage: Int
    var subdivision: String
    var yearBuilt, bathrooms, lotSize: Int
    var propertyType, lastSaleDate: String
    var features: Features
    var taxAssessment: [String: TaxAssessment]
    var propertyTaxes: [String: PropertyTax]
    var owner: Owner
    var id: String
    var longitude, latitude: Double
}

struct Features: Codable {
    var architectureType: String
    var cooling: Bool
    var coolingType, exteriorType: String
    var floorCount: Int
    var foundationType: String
    var garage: Bool
    var garageType: String
    var heating: Bool
    var heatingType: String
    var pool: Bool
    var roofType: String
    var roomCount, unitCount: Int
}

struct Owner: Codable {
    var names: [String]
    var mailingAddress: MailingAddress
}

struct MailingAddress: Codable {
    var id, addressLine1, city, state: String
    var zipCode: String
}

struct PropertyTax: Codable {
    var total: Int
}

struct TaxAssessment: Codable {
    var value, land, improvements: Int
}

