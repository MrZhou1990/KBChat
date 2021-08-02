//
//  KBChatRoomService.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/28.
//

import UIKit

class KBChatRoomService: NSObject {

    static func sendMessage(_ message: String) {
        let secToken = iPadProToken
        let toToken = (KBToolUtils.shareInstance.token == iPhone11Token) ? secToken : iPhone11Token
        
        guard let user = (KBToolUtils.shareInstance.token?.prefix(2)) else {
            return
        }
        
        
        let queryItems = [URLQueryItem(name: "fromToken", value: KBToolUtils.shareInstance.token),
                          URLQueryItem(name: "toToken", value: toToken),
                          URLQueryItem(name: "title", value: "\(String(user))token用户"),
                          URLQueryItem(name: "subTitle", value: message)]
        
        var urlComps = URLComponents(string: "\(DOMAINURL)kbpush/push")!
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
