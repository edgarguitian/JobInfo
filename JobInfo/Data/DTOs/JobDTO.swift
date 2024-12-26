//
//  JobDTO.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

struct JobDTO: Codable {
    let id: Int
    let extID: String
    let company: CompanyDTO
    let title, location: String
    let types: [RegionDTO]
    let cities: [CityDTO]?
    let countries: [CountryDTO]
    let regions: [RegionDTO]
    let hasRemote: Bool
    let published: Date
    let description: String
    let experienceLevel: String?
    let applicationURL: String
    let language: String
    let salaryMin: String?
    let salaryMax: String?
    let salaryCurrency: String?

    enum CodingKeys: String, CodingKey {
        case id
        case extID = "ext_id"
        case company, title, location, types, cities, countries, regions
        case hasRemote = "has_remote"
        case published, description
        case experienceLevel = "experience_level"
        case applicationURL = "application_url"
        case language
        case salaryMin = "salary_min"
        case salaryMax = "salary_max"
        case salaryCurrency = "salary_currency"
    }
}

// MARK: - City
struct CityDTO: Codable {
    let geonameid: Int
    let asciiname, name: String
    let country: CountryDTO
    let state: StateDTO?
    let timezone, latitude, longitude: String
}

// MARK: - Country
struct CountryDTO: Codable {
    let id: Int
    let code, name: String
    let region: RegionDTO
}

// MARK: - Region
struct RegionDTO: Codable {
    let id: Int
    let name: String
}

// MARK: - State
struct StateDTO: Codable {
    let geonameid: Int
    let code, asciiname, name: String
    let country: CountryDTO
}

// MARK: - Company
struct CompanyDTO: Codable {
    let id: Int
    let name: String
    let logo: String
    let websiteURL, linkedinURL: String
    let twitterHandle: String?
    let githubURL: String?
    let isAgency: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, logo
        case websiteURL = "website_url"
        case linkedinURL = "linkedin_url"
        case twitterHandle = "twitter_handle"
        case githubURL = "github_url"
        case isAgency = "is_agency"
    }
}
