//
//  MockDependencies.swift
//  RickAndMorty_Tests
//
//  Created by Santiago Pereira on 5/2/23.
//

import Foundation
import Mocker

@testable import RickAndMorty
class MockDependencies {
    init() {
        self.injectDependencies()
    }
    
    private func injectDependencies() {
        @Provider var rickAndMortyApi = RickAndMortyApi(url: "https://api.mock.com/",
                                                        requestRetrier: nil,
                                                        requestAdapter: nil,
                                                        eventMonitor: RickAndMortyApiEventMonitor(),
                                                        urlProtocols: [MockingURLProtocol.self]) as RickAndMortyApiProtocol
    }
}
