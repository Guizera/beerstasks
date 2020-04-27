//
//  ViewController.swift
//  beerstasks
//
//  Created by José Alves da Cunha on 24/04/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func backgroundColor() {
        
        let primaryColor = UIColor(named: "primaryColor")
        let secondColor = UIColor(named: "secondColor")
        //self.view.backgroundColor = primaryColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [primaryColor?.cgColor, secondColor?.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         backgroundColor()
    }


}

