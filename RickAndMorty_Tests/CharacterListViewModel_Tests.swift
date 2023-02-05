//
//  CharacterListViewModel_Tests.swift
//  RickAndMorty_Tests
//
//  Created by Santiago Pereira on 5/2/23.
//

import XCTest
import Mocker

@testable import RickAndMorty
class CharacterListViewModel_Tests: XCTestCase {

    var setup = MockDependencies()
    var viewModel = CharacterListView.ViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CharacterListView.ViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CharecterListViewModel_isLoading_shouldBeTrue() {
        XCTAssertTrue(viewModel.isLoading)
    }
    
    func test_CharecterListViewModel_isLastPage_shouldBeFalse() {
        XCTAssertFalse(viewModel.isLastPage)
    }
    
    func test_CharecterListViewModel_Page_shouldBeOne() {
        XCTAssertEqual(viewModel.page, 1)
    }
    
    func test_CharecterListViewModel_characterList_shouldBeEmpty() {
        XCTAssertTrue(viewModel.characterList.isEmpty)
    }

    func test_CharacterListViewModel_characterList_shouldReturnExpectedCharacterDataWrapper() {
        let apiEndpoint = URL(string: "https://api.mock.com/character?page=1")!
        let expectedCharacterDataWrapper = MockGenerator.characterDataWrapperApiObject()
        let mockedData = try! JSONEncoder().encode(expectedCharacterDataWrapper)
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()

        let exp = XCTestExpectation(description: "Should return expected character list after a second.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            exp.fulfill()
        })
        wait(for: [exp], timeout: 2)
        
        XCTAssertNotNil(viewModel.characterList)
        XCTAssertEqual(viewModel.page, 2)
        XCTAssertFalse(viewModel.isLastPage)
    }
    
    func test_CharecterListViewModel_isLastPage_shouldBeTrueWhenFail() {
        let apiEndpoint = URL(string: "https://api.mock.com/character?page=1")!
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 404, data: [.get: Data()])
        mock.register()

        let exp = XCTestExpectation(description: "Should return true isLastPage after a second.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            exp.fulfill()
        })
        wait(for: [exp], timeout: 2)

        XCTAssertTrue(viewModel.isLastPage)
    }
    
    func test_CharacterListViewModel_isLastPage_shouldBeTrueWhenNextValueIsNil() {
        let apiEndpoint = URL(string: "https://api.mock.com/character?page=1")!
        var expectedCharacterDataWrapper = MockGenerator.characterDataWrapperApiObject()
        expectedCharacterDataWrapper.info?.next = nil
        let mockedData = try! JSONEncoder().encode(expectedCharacterDataWrapper)
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()

        let exp = XCTestExpectation(description: "Should return expected character after a second.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            exp.fulfill()
        })
        wait(for: [exp], timeout: 2)
        
        XCTAssertTrue(viewModel.isLastPage)
    }
}

