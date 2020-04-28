//
//  TicketsViewController.swift
//  beerstasks
//
//  Created by José Alves da Cunha on 26/04/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import UIKit

class TicketsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ticketsTableView: UITableView!
    
    let client = TicketsRequests(apiName: "guizera7@gmail.com", apiKey: "kuHFCPavXTQKMdDHsZQ4w0vscmPxrTyv2wSXKmrZ", host: "beers.zendesk.com", perPage: 25)
    
     var ticketsList: [Ticket] = []
    
    func success (_ tickets: [Ticket]) {
      DispatchQueue.main.async {
        self.ticketsList = tickets
        self.ticketsTableView.reloadData()
      }
    }
    
    func failure(error: String) {
      print(error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        ticketsTableView.delegate = self
        ticketsTableView.dataSource = self
        
        client.next(success: success, failure: failure)
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketsCell", for: indexPath) as! TicketsTableViewCell
        let ticket = ticketsList[indexPath.row]
        cell.subjectLabel!.text = ticket.subject
        cell.descriptionLabel!.text = ticket.description
        cell.statusLabel!.text = ticket.status
        print(ticket.subject!)
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
