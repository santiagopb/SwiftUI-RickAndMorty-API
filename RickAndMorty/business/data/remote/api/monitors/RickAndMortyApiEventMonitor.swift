//
//  RickAndMortyApiEventMonitor.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import Alamofire

final class RickAndMortyApiEventMonitor: EventMonitor {
    
    func requestDidResume(_ request: Request) {
        let body = request.request.flatMap { $0.httpBody.map { String(decoding: $0, as: UTF8.self) } } ?? "None"
        let message = """
        ⚡️
        --> Request Started: \(request)
        --> Body Data: \(body)
        """
        Log.verbose(message)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: AFDataResponse<Value>) {
        let message = """
        ⚡️
        <-- Response Received: \(response.response?.statusCode ?? 0) - from \(request.request?.url?.absoluteString ?? "")
        """
        Log.verbose(message)
    }
}
