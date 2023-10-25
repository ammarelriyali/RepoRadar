//
//  NetworkError.swift
//  Popcorn
//
//  Created by ammar on 30/08/2023.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
