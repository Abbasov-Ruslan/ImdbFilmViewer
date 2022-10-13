//
//  APIManager.swift
//  ImdbFilms
//
//  Created by Ruslan Abbasov on 13.10.2022.
//

import Alamofire

class APIManager {

    // MARK: - Vars & Lets

    private let sessionManager: Session
    static let networkEnviroment: NetworkEnvironment = .dev

    // MARK: - Vars & Lets

    private static var sharedApiManager: APIManager = {
        let apiManager = APIManager(sessionManager: Session())

        return apiManager
    }()

    // MARK: - Accessors

    class func shared() -> APIManager {
        return sharedApiManager
    }

    // MARK: - Initialization

    private init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }


    func call<T>(type: EndPointType, params: Parameters? = nil, handler: @escaping (T?, _ error: AlertMessage?)->()) where T: Codable {

        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers).validate().responseJSON { data in
                                        switch data.result {
                                        case .success(_):
                                            let decoder = JSONDecoder()
                                            if let jsonData = data.data {
                                                let result = try! decoder.decode(T.self, from: jsonData)
                                                handler(result, nil)
                                            }
                                            break
                                        case .failure(_):
                                            handler(nil, self.parseApiError(data: data.data))
                                            break
                                        }
                                    }
    }

    func call(type: EndPointType, params: Parameters? = nil, handler: @escaping (()?, _ error: AlertMessage?)->()) {
        self.sessionManager.request(type.url,
                                    method: type.httpMethod,
                                    parameters: params,
                                    encoding: type.encoding,
                                    headers: type.headers).validate().responseJSON { data in
                                        switch data.result {
                                        case .success(_):
                                            handler((), nil)
                                            break
                                        case .failure(_):
                                            handler(nil, self.parseApiError(data: data.data))
                                            break
                                        }
                                    }
    }

    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(NetworkError.self, from: jsonData) {
            return AlertMessage(title: Constants.errorAlertTitle, body: error.key ?? error.message)
        }
        return AlertMessage(title: Constants.errorAlertTitle, body: Constants.genericErrorMessage)
    }

}
