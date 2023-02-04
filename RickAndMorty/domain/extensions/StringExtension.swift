//
//  StringExtension.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import Foundation

extension String {
    func localizedString() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
