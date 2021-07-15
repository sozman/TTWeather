//
//  CurrentEndpoint.swift
//  TTWeather
//
//  Created by Sinan Özman on 15.07.2021.
//

import Foundation
import Alamofire

/// Endpoint For Current Weather Condition
enum CurrentEndpoint {
    case getCurrent(request: CurrentRequest, locationKey: String?)
}

// MARK: - Endpoint Protocol
extension CurrentEndpoint: EndpointProtocol {
    var path: String {
        switch self {
        case .getCurrent(request: _, locationKey: let locationKey):
            return "currentconditions/v1/\(locationKey ?? "")"
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getCurrent(request: let req, locationKey: _):
            return req.dictionary
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var body: Codable? {
        switch self {
        default:
            return nil
        }
    }
}
