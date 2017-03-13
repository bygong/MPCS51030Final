//
//  NetworkService.swift
//  Overwatch Helper
//
//  Created by Benyan Gong on 3/5/17.
//  Copyright © 2017 Alex&Ben. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class SharedNetworking{
    static let Shared = SharedNetworking()
    
    func fetchJSON(URLString :String, completion: @escaping (Any?) -> ()){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let headers = ["Accept" : "application/json"]
        Alamofire.request(URLString, headers: headers).responseJSON(completionHandler: {
            response in
            
            guard let JSON = response.result.value, response.result.error == nil else {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            print(JSON)
            completion(JSON)
        })
    }
    
    func fetchData(URLString :String, completion: @escaping (Data?) -> ()){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let headers = ["Accept" : "application/json"]
        Alamofire.request(URLString, headers: headers).responseJSON(completionHandler: {
            response in
            
            guard let JSON = response.data, response.result.error == nil else {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                completion(nil)
                return
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            print(JSON)
            completion(JSON)
        })
    }
    
    func fetchImage(URLString :String, completion: @escaping (UIImage?) -> ()){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(URLString).responseData(completionHandler: {
            response in
            
            guard let data = response.result.value, response.result.error == nil else {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            let img = UIImage(data: data)
            completion(img)
        })
    }
}
