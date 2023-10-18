//
//  Alamofire.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 18.10.23.
//

import Alamofire
import Foundation

struct Reachability {
    static let shared = NetworkReachabilityManager()!
    static var isInternetAvailable:Bool {
        return self.shared.isReachable
    }
}
