//
//  ChecklistTests.swift
//  ChecklistTests
//
//  Created by Heang Sok on 14/4/2022.
//

import XCTest

@testable import Checklist

class ChecklistTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testJson() throws {

        let data = try? Data(contentsOf: ContentView.fileURL)
        let response = try JSONDecoder().decode(ItemListViewModel.self, from: data!)
        
        XCTAssertNotNil(response)
    }
    
    func testItemViewModel() throws {
        let title = TitleOfEachChecklist(title: "Book")
        let itemDetail = ItemDetail(item: Item(itemName: "Harry Potter", isTicked: true))
        
        XCTAssert(title.title == "Book")
        XCTAssertTrue(itemDetail.item.isTicked == true, "True")
    }
    
    func testItemListViewModel() throws {
        let itemName = "Harry"
        let isTicked = true
        let itemDetail = Item(itemName: itemName, isTicked: isTicked)
        let itemDetailList = [itemDetail, itemDetail]
        let itemLists = [["Banana", itemDetailList], ["Apple", itemDetailList]]
        
        XCTAssert(itemDetail.itemName == itemName)
        XCTAssert(itemDetail.isTicked == isTicked)
        XCTAssertEqual(itemDetail.itemName == itemName, itemDetail.isTicked==isTicked)
        XCTAssertNotNil(itemDetail.itemName)
        
        XCTAssert(itemDetailList[0].itemName == itemName)
        XCTAssertTrue(itemDetailList[1].isTicked == true)
        
        XCTAssert(itemLists[0][0] as! String == "Banana")
        
    }
    
    func testItemDetail() throws {
        let itemDetail = Item(itemName: "Taylor", isTicked: false)
        XCTAssert(itemDetail.itemName == "Taylor")
        XCTAssert(itemDetail.isTicked == false)
        XCTAssertEqual(itemDetail.itemName == "Taylor", itemDetail.isTicked==false)
        XCTAssertNotNil(itemDetail.itemName)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
