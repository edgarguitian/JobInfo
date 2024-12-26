//
//  CompanyTypesViewErrorTests.swift
//  JobInfoUITests
//
//  Created by Edgar Guitian Rey on 26/12/24.
//

import XCTest

final class CompanyTypesViewErrorTests: XCTestCase {

    private var app: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments += [IdentifiersUI.errorHandlingJobsCompanyTypes]
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

    func test_companyTypes_view_screen_show_error() throws {
        /// Nav Company Types
        let navCompanyType = app.buttons[IdentifiersUI.identifierNavCompanyType]
        XCTAssertTrue(navCompanyType.exists, "No existe el navCompanyType")
        navCompanyType.tap()

        let btnAlert = app.alerts.element.buttons["OK"]
        XCTAssert(btnAlert.waitForExistence(timeout: 5), app.alerts.debugDescription)

    }
}
