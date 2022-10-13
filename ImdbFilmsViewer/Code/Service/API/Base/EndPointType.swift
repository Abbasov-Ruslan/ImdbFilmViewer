//
//  EndPointType.swift
//  ImdbFilms
//
//  Created by Ruslan Abbasov on 13.10.2022.
//


import Alamofire

protocol EndPointType {

    // MARK: - Vars & Lets

    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var version: String { get }

}
