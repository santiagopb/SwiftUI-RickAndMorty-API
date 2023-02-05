//
//  ProcessInfoExtension.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 5/2/23.
//

import Foundation

extension ProcessInfo {
    static var IS_UNIT_TESTING: Bool {
        return processInfo.environment["IS_UNIT_TESTING"] == "TRUE"
    }
}
