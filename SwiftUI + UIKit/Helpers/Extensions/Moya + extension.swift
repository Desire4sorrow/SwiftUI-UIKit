//
//  Moya + extension.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Alamofire
import Foundation
import Moya
import Promises

public extension MoyaProvider {

    func request<Resource: Decodable>(_ target: Target, decoder: JSONDecoder = .default) -> Promise<Resource> {
        requestData(target).then { data -> Resource in
            do {
                let resource = try decoder.decode(Resource.self, from: data)
                return resource
            } catch {
                Logger.errorText(error)
                print(error)
                throw error
            }
        }
    }

    func requestData(_ target: Target) -> Promise<Data> {
        wrap { _ = self.request(target, completion: $0) }
            .then(handleResult)
            .catch { error in
                Logger.error(error)
            }
    }

    @discardableResult func send(_ target: Target) -> Promise<Void> {
        requestData(target).then { _ in }
    }

    private func handleResult(_ result: Result<Moya.Response, MoyaError>) throws -> Data {
        switch result {
        case .success(let response):
            return try handleSuccessResponse(response)
        case .failure(let error):
            error.response.map(logResponse)
            Logger.error(error)
            throw NetworkError(moyaError: error)
        }
    }

    private func handleSuccessResponse(_ response: Moya.Response) throws -> Data {
        response.data
    }

    private func logResponse(_ response: Moya.Response) {
        Logger.debug(response.request?.logDescription ?? "")
    }
}

extension MoyaError {

    var nsCode: Int? {
        guard let afError = errorUserInfo[NSUnderlyingErrorKey] as? AFError,
              let underlyingError = afError.underlyingError else
        {
            return nil
        }
        return (underlyingError as NSError).code
    }
}

