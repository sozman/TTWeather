//
//  NetworkClient.swift
//  TTWeather
//
//  Created by Sinan Özman on 12.07.2021.
//

import Foundation
import Alamofire

// MARK: - Network Client Protocol
/// Making Request
public protocol NetworkClientProtocol {
    /// Executing Request
    /// - Parameters:
    ///   - endpoint: Endpoint
    ///   - model: Response Model
    ///   - completion: Response Model and Any Error
    func executeRequest<ResponseModel: Codable>(
        endpoint: EndpointProtocol,
        model:ResponseModel.Type,
        completion: @escaping (ResponseModel?, Error?) -> Void
    )
}

// MARK: - Network Client
/// Network Layer
public class NetworkClient {
    /// Base URL
    private var baseURL: String = Config.BaseAPIURL
    
    init(
        baseURL: String? = nil
    ) {
        guard let url = baseURL else { return }
        self.baseURL = url
    }
}

// MARK: - Network Client Protocol for Network Client
extension NetworkClient: NetworkClientProtocol {
    public func executeRequest<ResponseModel: Codable>(
        endpoint: EndpointProtocol,
        model: ResponseModel.Type,
        completion: @escaping (ResponseModel?, Error?) -> Void){
        let decoder = JSONDecoder.init()
        do {
            let url: URL = try {
                var urlString: String = "\(baseURL)\(endpoint.path)"
                if let parameter = endpoint.parameters {
                    urlString = "\(urlString)?"
                    parameter.enumerated().forEach { param in
                        urlString = "\(urlString)\(param.element.key)=\(param.element.value)"
                        if (param.offset + 1) < parameter.count {
                            urlString = "\(urlString)&"
                        }
                    }
                }
                return try urlString.asURL()
            }()
            AF.request(url,
                       method: endpoint.method,
                       parameters: endpoint.body?.dictionary,
                       encoding: Alamofire.JSONEncoding.default,
                       headers: endpoint.headers)
                .validate()
                .responseDecodable(of: model,decoder: decoder) { (result: DataResponse<ResponseModel, AFError>) in
                    switch result.result {
                    case .success(let response):
                        completion(response, nil)
                    case .failure(let error):
                        completion(nil, error)
                    }
                }
        } catch {
            completion(nil, error)
        }
    }
}
