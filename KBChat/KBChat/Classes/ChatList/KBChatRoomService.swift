//
//  KBChatRoomService.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/28.
//

import UIKit

class KBChatRoomService: NSObject {

    static func sendMessage(_ message: String) {
        let toToken = (KBToolUtils.shareInstance.token == "79f9a86f97481f0c07f8ff0001e378c4e8ad2281bc1528a2d2783a9f0cec58c5") ? "03854972fada97ddf2b2f61ea61adb1004f7af4a20a556b4b8948348ec5b7561" : "79f9a86f97481f0c07f8ff0001e378c4e8ad2281bc1528a2d2783a9f0cec58c5"
        
        guard let user = (KBToolUtils.shareInstance.token?.prefix(2)) else {
            return
        }
        
        
        let queryItems = [URLQueryItem(name: "fromToken", value: KBToolUtils.shareInstance.token),
                          URLQueryItem(name: "toToken", value: toToken),
                          URLQueryItem(name: "title", value: "\(String(user))token用户"),
                          URLQueryItem(name: "subTitle", value: message)]
        
        var urlComps = URLComponents(string: "http://192.168.31.5:8081/push/kbpush/push")!
        urlComps.queryItems = queryItems
        guard let url = urlComps.url else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle data
            print(data as Any)
            print(response as Any)
            print(error as Any)
        }

        task.resume()
    }
}
