//
//  Network.swift
//  Popcorn
//
//  Created by ammar on 29/08/2023.
//

import Foundation
import Alamofire
import Combine

struct Network: AnyNetwork {
    private typealias Constans = NewtorkConstans
    func request<T: Decodable>(
        endPoint: String,
        parameters: Parameters?,
        method: HTTPMethod
    ) async throws -> T {
        let url = Constans.apiUrl + endPoint
        let headers: HTTPHeaders = [
            Constans.acceptHeader: Constans.acceptHeaderContent]
        return try await AF.request(
            url,
            method: method,
            parameters: parameters,
            headers: headers
        ).validate()
            .serializingDecodable(T.self).value
    }
}
