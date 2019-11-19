//
//  Task.swift
//  TaskList
//
//  Created by Colin Masters on 2019-10-21.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation

struct Task: Codable {
    var title: String?
    var detail: String?
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
    }
}
