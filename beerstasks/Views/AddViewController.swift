//
//  AddViewController.swift
//  beerstasks
//
//  Created by José Alves da Cunha on 27/04/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var subjectTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    let client = TicketsRequests(apiName: "michellhornung@gmail.com", apiKey: "kBBDrdGBWaMwhTQti05UoEf5B11uYAy918fWdkIV", host: "hornung.zendesk.com", perPage: 25)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendTicket(_ sender: Any) {
        
        client.postTickets(subject: subjectTextField.text!, description: descriptionTextField.text!) {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let responseJSON = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    print(responseJSON)
                }
            }
        }
        self.alertBeer()
        
    }
    
    func alertBeer() {
        let alert = UIAlertController(title: "Success", message: "Yout tickets all done!", preferredStyle: UIAlertController.Style.alert)
               // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default) { (action) -> Void in
            let ListViewController = self.storyboard?.instantiateViewController(withIdentifier: "TicketsViewController")
            self.present(ListViewController!, animated: true, completion: nil)
            
            })
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
               // show the alert
               self.present(alert, animated: true, completion: nil)
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
