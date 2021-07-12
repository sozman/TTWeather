//
//  SearchEndpoint.swift
//  TTWeather
//
//  Created by Sinan Özman on 12.07.2021.
//

import Foundation
import Alamofire

/// Endpoint for Search
enum SearchEndpoint {
    case getLocationAutoComplete(request: AutoCompleteRequest)
}

// MARK: - Endpoint Protocol
extension SearchEndpoint: EndpointProtocol {
    var path: String {
        switch self {
        case .getLocationAutoComplete(request: _):
            return "locations/v1/cities/autocomplete"
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
        case .getLocationAutoComplete(request: let req):
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
