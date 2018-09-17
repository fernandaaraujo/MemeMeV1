//
//  MemeMeOneUITests.swift
//  MemeMeOneUITests
//
//  Created by Fernanda Araújo on 17/09/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import XCTest

class MemeMeOneUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAlbumButton() {
        let app = XCUIApplication()
        let albumButton = app.toolbars["Toolbar"].buttons["Album"]
        albumButton.tap()
        app.navigationBars["Photos"].buttons["Cancel"].tap()
    }
    
    func testAddsTexts() {
        let app = XCUIApplication()
        app.textFields["topText"].tap()
        app.typeText("THIS IS")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["bottomText"].tap()
        app.typeText("A TEST")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()

    }
    
    func testShare() {
        let app = XCUIApplication()
        let albumButton = app.toolbars["Toolbar"].buttons["Album"]
        albumButton.tap()
        sleep(8)
        
        app.tables.cells.element(boundBy: 1).tap()
        sleep(2)
        app.collectionViews["PhotosGridView"].cells["Photo, Landscape, March 12, 2011, 9:17 PM"].tap()
        
        app.navigationBars["MemeMeOne.View"].buttons["Share"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).buttons["Cancel"].tap()
    }
    
    func testCancel() {
        let app = XCUIApplication()
        let albumButton = app.toolbars["Toolbar"].buttons["Album"]
        albumButton.tap()
        sleep(8)
        
        app.tables.cells.element(boundBy: 1).tap()
        sleep(2)
        app.collectionViews["PhotosGridView"].cells["Photo, Landscape, March 12, 2011, 9:17 PM"].tap()
        
        let mememeoneViewNavigationBar = app.navigationBars["MemeMeOne.View"]
        let cancelButton = mememeoneViewNavigationBar.buttons["Cancel"]
        cancelButton.tap()
        
        let doYouWantToCancelEditingAlert = app.alerts["Do you want to cancel editing?"]
        doYouWantToCancelEditingAlert.buttons["No"].tap()
        cancelButton.tap()
        doYouWantToCancelEditingAlert.buttons["Yes"].tap()
    }
    
}
