//
//  TypesViewErrorTests.swift
//  JobInfoUITests
//
//  Created by Edgar Guitian Rey on 26/12/24.
//

import XCTest

final class TypesViewErrorTests: XCTestCase {

    private var app: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments += [IdentifiersUI.errorHandlingJobsTypes]
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

    func test_types_view_screen_show_error() throws {
        /// Nav Types
        let navType = app.buttons[IdentifiersUI.identifierNavItemType]
        XCTAssertTrue(navType.exists, "No existe el navType")
        navType.tap()

        let btnAlert = app.alerts.element.buttons["OK"]
        XCTAssert(btnAlert.waitForExistence(timeout: 5), app.alerts.debugDescription)

    }
}
