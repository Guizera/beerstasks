//
//  TasksModel.swift
//  beerstasks
//
//  Created by José Alves da Cunha on 24/04/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import Foundation

struct Ticket: Codable {
    
    var subject: String?
    var description: String?
    var status: String?
}

struct TicketResponse: Codable {
    
    let tickets: [Ticket]
    let page: String?
    let next_page: String?
    let previous_page: String?
}
