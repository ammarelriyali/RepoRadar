//
//  NetworkClient.swift
//  Popcorn
//
//  Created by ammar on 29/08/2023.
//

import Foundation
import Alamofire

struct NetworkClient: AnyNetwork {
    
    private typealias Constants = NetworkConstants

    func load<T: Decodable>(
        endPoint: String,
        parameters: Parameters?,
        method: HTTPMethod
    ) async throws -> T {
        
        let url = Constants.apiUrl + endPoint
        let headers: HTTPHeaders = [
            Constants.acceptHeader: Constants.acceptHeaderContent]
        return try await AF.request(
            url,
            method: method,
            parameters: parameters,
            headers: headers
        ).validate()
            .serializingDecodable(T.self).value
    }
}
