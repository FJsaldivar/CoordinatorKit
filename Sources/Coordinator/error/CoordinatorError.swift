//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 30/11/21.
//

import Foundation

public struct CoordinatorError: Error, LocalizedError {
    public var errorDescription: String?

    public init(message: String) {
        self.errorDescription = "Coordinator Error:" + message
    }
}
