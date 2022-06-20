//
//  ChecklistUITests.swift
//  ChecklistUITests
//
//  Created by Heang Sok on 14/4/2022.
//

import XCTest

class ChecklistUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testValidScreenSuccess(){
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().navigationBars["CheckLists"].buttons["Add"].tap()
        
        let checklistsNavigationBar = app.navigationBars["CheckLists"]
        checklistsNavigationBar.buttons["Edit"].tap()
        
        let tablesQuery2 = app.tables
        let checklistCell = tablesQuery2.cells["Checklist"]
        XCTAssertTrue(checklistCell.exists)
        
        checklistsNavigationBar.buttons["Done"].tap()
        checklistsNavigationBar.buttons["Add"].tap()
        
        let element = checklistCell.children(matching: .other).element(boundBy: 0).children(matching: .other).element
        element.tap()
                                
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
