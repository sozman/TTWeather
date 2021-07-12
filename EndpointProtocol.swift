//
//  EndpointProtocol.swift
//  TTWeather
//
//  Created by Sinan Özman on 12.07.2021.
//

import Foundation
import Alamofire

public typealias Parameters = [String: String]

/// Endpoint Protocol for HTTP Request
public protocol EndpointProtocol {
    /// URL Path
    var path: String { get }
    /// Http Header
    var headers: HTTPHeaders? { get }
    /// URL Parameter
    var parameters: Parameters? { get }
    /// HTTP Metod
    var method: HTTPMethod { get }
    /// HTTP Body
    var body: Codable? { get }
}
