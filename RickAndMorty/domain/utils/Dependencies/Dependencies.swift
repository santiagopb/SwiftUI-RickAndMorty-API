//
//  Dependencies.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import Foundation

class Dependencies {
    init() {
        @Provider var rickAndMortyApi = RickAndMortyApi(url: RickAndMortyApi.BASE_URL,
                                                        requestRetrier: nil,
                                                        requestAdapter: nil,
                                                        eventMonitor: RickAndMortyApiEventMonitor(),
                                                        urlProtocols: nil)
    }
}

