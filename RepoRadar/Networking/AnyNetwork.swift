//
//  AnyNetwork.swift
//  Popcorn
//
//  Created by ammar on 30/08/2023.
//

import Foundation
import Alamofire

protocol AnyNetwork {
    
    func load<T: Decodable>(
        endPoint: String,
        parameters: Parameters?,
        method: HTTPMethod
    ) async throws -> T
}
