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
    ) -> Future<T, NetworkError> {
        let url = Constans.apiUrl + endPoint
        let headers: HTTPHeaders = [
            Constans.acceptHeader: Constans.acceptHeaderContent]
        return Future({ promise in
            AF.request(
                url,
                method: method,
                parameters: parameters,
                headers: headers
            ).validate()
                .responseDecodable(decoder: JSONDecoder(), completionHandler: { (response: DataResponse<T, AFError>) in
                    switch response.result {
                    case .success(let value):
                        promise(.success(value))
                    case .failure(let error):
                        let backendError = response.data.flatMap {
                            try? JSONDecoder().decode(BackendError.self, from: $0)
                        }
                        let networkError = NetworkError(initialError: error, backendError: backendError)
                        promise(.failure(networkError))
                    }
                })
        })
    }

}
