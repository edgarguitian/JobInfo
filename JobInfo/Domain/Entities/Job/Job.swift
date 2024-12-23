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

extension Job: Hashable {
    
}


// MARK: - City
struct City {
    let name: String
    let country: Country
    let state: State
}

extension City: Hashable {
    
}

// MARK: - Country
struct Country {
    let name: String
    let region: Region
}

extension Country: Hashable {
    
}

// MARK: - Region
struct Region {
    let name: String
}

extension Region: Hashable {
    
}

// MARK: - State
struct State {
    let name: String
    let country: Country
}

extension State: Hashable {
    
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

extension Company: Hashable {
    
}
