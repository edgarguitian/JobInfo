//
//  Job.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

struct Job {
    let company: Company
    let title, location: String
    let types: [Region]
    let cities: [City]
    let countries: [Country]
    let regions: [Region]
    let hasRemote: Bool
    let published: Date
    let description: String
    let experienceLevel: String?
    let applicationURL: String
    let language: String
    let salaryMin: String?
    let salaryMax: String?
    let salaryCurrency: String?
}


// MARK: - City
struct City {
    let name: String
    let country: Country
    let state: State
}

// MARK: - Country
struct Country {
    let name: String
    let region: Region
}

// MARK: - Region
struct Region {
    let name: Name
}

enum Name: String {
    case africa = "Africa"
    case contract = "Contract"
    case europe = "Europe"
    case fullTime = "Full Time"
    case internship = "Internship"
    case middleEast = "Middle East"
    case partTime = "Part Time"
    case temporary = "Temporary"
}

// MARK: - State
struct State {
    let name: String
    let country: Country
}

// MARK: - Company
struct Company {
    let name: String
    let logo: String
    let websiteURL, linkedinURL: String
    let twitterHandle: String?
    let githubURL: String?
    let isAgency: Bool
}
