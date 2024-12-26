//
//  JobsViewErrorTests.swift
//  JobInfoUITests
//
//  Created by Edgar Guitian Rey on 26/12/24.
//

import XCTest

final class JobsViewErrorTests: XCTestCase {

    private var app: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments += [IdentifiersUI.errorHandlingJobs]
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

    func test_types_view_screen_show_error() throws {
        /// Nav Region
        let navRegion = app.buttons[IdentifiersUI.identifierNavItemRegion]
        XCTAssertTrue(navRegion.exists, "No existe el navRegion")
        navRegion.tap()
        
        /// Items Region
        let itemsRegion = app.buttons[IdentifiersUI.identifierJobsRegions]
        
        XCTAssertTrue(itemsRegion.waitForExistence(timeout: 5), "No existen los items de Region")
        let firstRegion = itemsRegion.firstMatch
        firstRegion.tap()

        let btnAlert = app.alerts.element.buttons["OK"]
        XCTAssert(btnAlert.waitForExistence(timeout: 5), app.alerts.debugDescription)

    }
}
