//
//  NetworkService.swift
//  ReactiveMVVM
//
//  Created by Yarden Eitan on 9/2/17.
//  Copyright © 2017 Yarden Eitan. All rights reserved.
//

import Foundation
import Moya

struct API {
    static let amount = 50
}

enum NetworkService {
    case fetchUsers(amount: Int)
}

extension NetworkService: TargetType {
    var baseURL: URL { return URL(string: "https://uinames.com/api")! }
    var path: String {
        switch self {
        case .fetchUsers(_):
            return ""
        }
    }
    var method: Moya.Method {
        switch self {
        case .fetchUsers:
            return .get
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .fetchUsers(let amount):
            return ["ext": "",
                    "amount": amount]
        }
    }
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .fetchUsers:
            return URLEncoding.queryString
        }
    }
    var task: Task {
        switch self {
        case .fetchUsers:
            return .requestParameters(parameters: parameters!,
                                      encoding: parameterEncoding)
        }
    }
    var sampleData: Data {
        switch self {
        case .fetchUsers(let amount):
            return "{\"amount\": \(amount)}".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

private extension String {
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
