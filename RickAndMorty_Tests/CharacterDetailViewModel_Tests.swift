//
//  CharacterDetailViewModel_Tests.swift
//  RickAndMorty_Tests
//
//  Created by Santiago Pereira on 5/2/23.
//

import XCTest
import Mocker

@testable import RickAndMorty
class CharacterDetailViewModel_Tests: XCTestCase {

    var setup = MockDependencies()
    var viewModel = CharacterDetailView.ViewModel(id: 1)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CharacterDetailViewModel_service_shouldBeInjectedAndNotBeNil() {
        XCTAssertNotNil(viewModel.service)
    }
    
    func test_CharacterDetailViewModel_character_shouldReturnExpectedCharacter() {
        let id = 1
        viewModel = CharacterDetailView.ViewModel(id: id)
        let apiEndpoint = URL(string: "https://api.mock.com/character/\(id)")!
        let expectedCharacter = MockGenerator.characterApiObject(id: id)
        let mockedData = try! JSONEncoder().encode(expectedCharacter)
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()

        let exp = XCTestExpectation(description: "Should return expected character after a second.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            exp.fulfill()
        })
        wait(for: [exp], timeout: 2)
        
        XCTAssertNotNil(viewModel.character)
        XCTAssertNotNil(viewModel.character?.id)
        XCTAssertEqual(viewModel.character?.id, expectedCharacter.id)
    }
    
    func test_CharacterDetailViewModel_character_shouldReturnNilWhenBuildWithoutId() {
        let id = 2
        viewModel = CharacterDetailView.ViewModel(id: id)
        let apiEndpoint = URL(string: "https://api.mock.com/character/\(id)")!
        let expectedCharacter = MockGenerator.characterApiObject(id: nil)
        let mockedData = try! JSONEncoder().encode(expectedCharacter)
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [.get: mockedData])
        mock.register()

        let exp = XCTestExpectation(description: "Should return nil after a second.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            exp.fulfill()
        })
        wait(for: [exp], timeout: 2)
        
        XCTAssertNil(viewModel.character)
    }
    
    func test_CharacterDetailViewModel_character_shouldReturnNilWhenLoadFromServiceFail() {
        let id = 3
        viewModel = CharacterDetailView.ViewModel(id: id)
        let apiEndpoint = URL(string: "https://api.mock.com/character/\(id)")!
        let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 404, data: [.get: Data()])
        mock.register()

        let exp = XCTestExpectation(description: "Should return nil after a second.")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            exp.fulfill()
        })
        wait(for: [exp], timeout: 2)
        
        XCTAssertNil(viewModel.character)
    }
}


