//
//  AnyNetwork.swift
//  Popcorn
//
//  Created by ammar on 30/08/2023.
//

import Foundation
import Alamofire
import Combine
protocol AnyNetwork {
    func request<T: Decodable>(
        endPoint: String,
        parameters: Parameters?,
        method: HTTPMethod
    ) -> Future<T, NetworkError>
}
