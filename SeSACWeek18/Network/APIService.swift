//
//  APIService.swift
//  SeSACWeek18
//
//  Created by CHOI on 2022/11/02.
//

import Foundation
import Alamofire

struct Login: Codable {
    let token: String
}

struct Profile: Codable {
    let user: User
}

struct User: Codable {
    let photo: String
    let email: String
    let username: String
}

class APIService {
    
    func signup() {
        let api = SeSACAPI.signup(userName: "testZiuge", email: "testZiuge@testZiuge.com", password: "12345678")
//        let url = SeSACAPI.signup.url
//        let header: HTTPHeaders = SeSACAPI.signup.headers
//        let parameter = [
//            "userName": "testZiuge",
//            "email": "testZiuge@testZiuge.com",
//            "password": "12345678"
//        ]
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers)
            .responseString { response in
            print(response)
            print(response.response?.statusCode)
        }
    }
    
    func login() {
        let api = SeSACAPI.login(email: "testZiuge@testZiuge.com", password: "12345678")
//        let url = SeSACAPI.login.url
//        let header: HTTPHeaders = SeSACAPI.login.headers
//        let parameter = [
//            "email": "testZiuge@testZiuge.com",
//            "password": "12345678"
//        ]
        
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Login.self) { response in
            switch response.result {
            case .success(let data):
                print(data.token)
                UserDefaults.standard.set(data.token, forKey: "token")
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
    }
    
    func profile() {
        let url = SeSACAPI.profile.url
        let header: HTTPHeaders = SeSACAPI.profile.headers
        
        AF.request(url, method: .get, headers: header)
            .responseDecodable(of: Profile.self) { response in
            switch response.result {
            case .success(let data):
                print(data)
                
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
    }
    
}
