//
//  JobsResultMapper.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class JobsResultMapper {
    func map(jobsResult: JobResultDTO) -> JobResult{
        var jobResults: [Job] = []
        for jobResult in jobsResult.results {
            let company = Company(name: jobResult.company.name,
                                  logo: jobResult.company.logo,
                                  websiteURL: jobResult.company.websiteURL,
                                  linkedinURL: jobResult.company.linkedinURL,
                                  twitterHandle: jobResult.company.twitterHandle,
                                  githubURL: jobResult.company.githubURL,
                                  isAgency: jobResult.company.isAgency)
            let jobTypes: [Region] = jobResult.types.map { Region(name: $0.name) }
            let jobCities: [City] = jobResult.cities.map { City(name: $0.name,
                                                                  country: Country(name: $0.country.name, region: Region(name: $0.country.region.name)),
                                                                  state: State(name: $0.state.name,
                                                                               country: Country(name: $0.state.country.name,
                                                                                                region: Region(name: $0.state.country.region.name)
                                                                                               )
                                                                              )
            )}
            let jobCountries: [Country] = jobResult.countries.map { Country(name: $0.name, region: Region(name: $0.region.name)) }
            let jobRegions: [Region] = jobResult.regions.map { Region(name: $0.name) }
            let job = Job(company: company,
                          title: jobResult.title,
                          location: jobResult.location,
                          types: jobTypes,
                          cities: jobCities,
                          countries: jobCountries,
                          regions: jobRegions,
                          hasRemote: jobResult.hasRemote,
                          published: jobResult.published,
                          description: jobResult.description,
                          experienceLevel: jobResult.experienceLevel,
                          applicationURL: jobResult.applicationURL,
                          language: jobResult.language,
                          salaryMin: jobResult.salaryMin,
                          salaryMax: jobResult.salaryMax,
                          salaryCurrency: jobResult.salaryCurrency)
            
            jobResults.append(job)
        }
        return JobResult(count: jobsResult.count,
                         next: jobsResult.next,
                         previous: jobsResult.previous,
                         results: jobResults)
    }
}
