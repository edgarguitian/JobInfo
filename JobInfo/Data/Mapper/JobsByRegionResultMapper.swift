//
//  JobsByRegionResultMapper.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class JobsByRegionResultMapper {
    func map(jobsByRegionResult: JobResultDTO) -> JobResult{
        var jobResults: [Job] = []
        for jobByRegion in jobsByRegionResult.results {
            let company = Company(name: jobByRegion.company.name,
                                  logo: jobByRegion.company.logo,
                                  websiteURL: jobByRegion.company.websiteURL,
                                  linkedinURL: jobByRegion.company.linkedinURL,
                                  twitterHandle: jobByRegion.company.twitterHandle,
                                  githubURL: jobByRegion.company.githubURL,
                                  isAgency: jobByRegion.company.isAgency)
            let jobTypes: [Region] = jobByRegion.types.map { Region(name: $0.name) }
            let jobCities: [City] = jobByRegion.cities.map { City(name: $0.name,
                                                                  country: Country(name: $0.country.name, region: Region(name: $0.country.region.name)),
                                                                  state: State(name: $0.state.name,
                                                                               country: Country(name: $0.state.country.name,
                                                                                                region: Region(name: $0.state.country.region.name)
                                                                                               )
                                                                              )
            )}
            let jobCountries: [Country] = jobByRegion.countries.map { Country(name: $0.name, region: Region(name: $0.region.name)) }
            let jobRegions: [Region] = jobByRegion.regions.map { Region(name: $0.name) }
            let job = Job(company: company,
                          title: jobByRegion.title,
                          location: jobByRegion.location,
                          types: jobTypes,
                          cities: jobCities,
                          countries: jobCountries,
                          regions: jobRegions,
                          hasRemote: jobByRegion.hasRemote,
                          published: jobByRegion.published,
                          description: jobByRegion.description,
                          experienceLevel: jobByRegion.experienceLevel,
                          applicationURL: jobByRegion.applicationURL,
                          language: jobByRegion.language,
                          salaryMin: jobByRegion.salaryMin,
                          salaryMax: jobByRegion.salaryMax,
                          salaryCurrency: jobByRegion.salaryCurrency)
            
            jobResults.append(job)
        }
        return JobResult(count: jobsByRegionResult.count,
                         next: jobsByRegionResult.next,
                         previous: jobsByRegionResult.previous,
                         results: jobResults)
    }
}
