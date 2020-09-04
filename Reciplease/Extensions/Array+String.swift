//
//  Array+String.swift
//  Reciplease
//
//  Created by Damien Rojo on 20.08.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

extension String {
    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ,")
        return self.filter {okayChars.contains($0) }
    }
}
