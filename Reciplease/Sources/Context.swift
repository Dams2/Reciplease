//
//  Context.swift
//  Reciplease
//
//  Created by Damien Rojo on 20.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class Context {

    // MARK: - Properties

    public let client: HTTPClient
    
    public let stack: CoredataStack

    // MARK: - Init

    init() {
        let engine = HTTPEngine(configuration: .default)
        client = HTTPClient(engine: engine)
        stack = CoredataStack()
    }
}
