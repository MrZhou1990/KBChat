//
//  KBChatRoomService.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/28.
//

import UIKit

class KBChatRoomService: NSObject {

    static func sendMessage(_ message: String) {
        let queryItems = [URLQueryItem(name: "message", value: message)]
        var urlComps = URLComponents(string: "http://192.168.1.219:8081/friendsalbum/albumcontroller/testConnect")!
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
