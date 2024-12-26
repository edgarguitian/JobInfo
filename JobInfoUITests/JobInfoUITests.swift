//
//  JobInfoUITests.swift
//  JobInfoUITests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import XCTest
@testable import JobInfo

final class JobInfoUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

    func test_content_view_show() throws {
        /// Ttile Content View
        let titleContentView = app.navigationBars[IdentifiersUI.identifierTitleContentView]
        
        /// Nav Buttons
        let navRegion = app.buttons[IdentifiersUI.identifierNavItemRegion]
        let navType = app.buttons[IdentifiersUI.identifierNavItemType]
        let navCompanyType = app.buttons[IdentifiersUI.identifierNavCompanyType]

        XCTAssertTrue(titleContentView.waitForExistence(timeout: 5), "No existe el navigation Title de Content View")
        XCTAssertTrue(navRegion.exists, "No existe el navRegion")
        XCTAssertTrue(navType.exists, "No existe el navType")
        XCTAssertTrue(navCompanyType.exists, "No existe el navCompanyType")
    }
    
    func test_regions_view_show() throws {
        /// Title Regions View
        let titleRegionsView = app.navigationBars[titleRegionsView]

        /// Nav Region
        let navRegion = app.buttons[IdentifiersUI.identifierNavItemRegion]
        XCTAssertTrue(navRegion.exists, "No existe el navRegion")
        navRegion.tap()
        
        /// Items Region
        let itemsRegion = app.buttons[IdentifiersUI.identifierJobsRegions]
        
        XCTAssertTrue(titleRegionsView.waitForExistence(timeout: 5), "No existe el navigation Title de Regions View")
        XCTAssertTrue(itemsRegion.exists, "No existen los items de Region")

    }
    
    func test_types_view_show() throws {
        /// Title Types View
        let titleTypesView = app.navigationBars[titleTypesView]
        
        /// Nav Types
        let navType = app.buttons[IdentifiersUI.identifierNavItemType]
        XCTAssertTrue(navType.exists, "No existe el navType")
        navType.tap()
        
        /// Items Types
        let itemsTypes = app.buttons[IdentifiersUI.identifiersJobsTypes]
        
        XCTAssertTrue(titleTypesView.waitForExistence(timeout: 5), "No existe el navigation Title de Types View")
        XCTAssertTrue(itemsTypes.exists, "No existen los items de Types")

    }
    
    func test_companyTypes_view_show() throws {
        /// Title Company Types View
        let titleCompanyTypesView = app.navigationBars[titleCompanyTypesView]
        
        /// Nav Company Types
        let navCompanyType = app.buttons[IdentifiersUI.identifierNavCompanyType]
        XCTAssertTrue(navCompanyType.exists, "No existe el navCompanyType")
        navCompanyType.tap()
        
        /// Items Company Types
        let itemsCompanyTypes = app.buttons[IdentifiersUI.identifiersJobsCompanyTypes]
        
        XCTAssertTrue(titleCompanyTypesView.waitForExistence(timeout: 5), "No existe el navigation Title de CompanyTypes View")
        XCTAssertTrue(itemsCompanyTypes.exists, "No existen los items de CompanyTypes")

    }
    
    func test_jobs_regions_view_show() throws {
        /// Nav Region
        let navRegion = app.buttons[IdentifiersUI.identifierNavItemRegion]
        XCTAssertTrue(navRegion.exists, "No existe el navRegion")
        navRegion.tap()
        
        /// Items Region
        let itemsRegion = app.buttons[IdentifiersUI.identifierJobsRegions]
        
        XCTAssertTrue(itemsRegion.waitForExistence(timeout: 5), "No existen los items de Region")
        print(app.debugDescription)

    }
}
