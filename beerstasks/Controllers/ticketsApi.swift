//
//  ticketsApi.swift
//  beerstasks
//
//  Created by José Alves da Cunha on 25/04/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import Foundation



class TicketsRequests {
    
    var tickets: [Ticket] = []
    let apiName: String
    let apiKey: String
    let host: String
    let perPage: Int
    
    
    var page: String?
    var previousPage: URL? = nil
    var nextPage: URL? = nil
    
    let path = "/api/v2/tickets.json"
    
    //kuHFCPavXTQKMdDHsZQ4w0vscmPxrTyv2wSXKmrZ
    
    init(apiName: String, apiKey: String, host: String, perPage: Int) {
      self.apiName = apiName
      self.apiKey = apiKey
      self.host = host
      self.perPage = perPage
    }
    
    func url() -> URL {
      var component = URLComponents()
      component.scheme = "https"
      component.host = host
      component.path = path
      component.queryItems = [URLQueryItem(name: "per_page", value: String(perPage))]
      return component.url!
    }
    
    func authHeader() -> String {
      let loginData = String(format: "%@/token:%@", apiName, apiKey).data(using: String.Encoding.utf8)!
      return loginData.base64EncodedString()
    }
    
    func get(url: URL) -> URLRequest{
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      
      request.setValue("Basic \(authHeader())", forHTTPHeaderField: "Authorization")
      return request
    }
    
    func fetchTickets(success: @escaping (_ tickets: [Ticket]) -> Void = {_ in}, failure: @escaping (String) -> Void = {_ in}, url: URL)  {
      print("start the thing")
      
      let dataTask = URLSession.shared.dataTask(with: self.get(url: url)) { (data, _, error) in
        do {
          let ticketResponse = try JSONDecoder().decode(TicketResponse.self, from: data!)
          self.tickets = ticketResponse.tickets
//          self.previousPage = URL(string: ticketResponse.previous_page ?? "")
//          self.nextPage = URL(string: ticketResponse.next_page ?? "")
//          self.page = ticketResponse.page
          success(self.tickets)
        } catch {
          print ("There is an error resiving data", error)
          failure("Error Happened")
          
        }
      }
      
      // Start the download task.
      dataTask.resume()
    }
    
    func postTickets(subject: String, description: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> Swift.Void {
        print("start POST")
        
        var request = URLRequest(url: url())
        request.httpMethod = "POST"
        request.setValue("Basic \(authHeader())", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let json: [String: Any] = ["ticket" : ["subject": subject, "description": description]]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData
        print(jsonData!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            completionHandler(data, response, error)
        }.resume()
    }
    
    func next(success: @escaping (_ tickets: [Ticket]) -> Void = {_ in}, failure: @escaping (String) -> Void = {_ in}) {
      var nextUrl = url()
      if self.nextPage != nil {
        nextUrl = self.nextPage!
      }
      self.fetchTickets(success: success, failure: failure, url: nextUrl)
    }
    
    func previous(success: @escaping (_ tickets: [Ticket]) -> Void = {_ in}, failure: @escaping (String) -> Void = {_ in}) {
      if previousPage != nil {
        self.fetchTickets(success: success, failure: failure, url: previousPage!)
      }
    }
    
    
}
