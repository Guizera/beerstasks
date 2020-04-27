//
//  beerTextField.swift
//  beerstasks
//
//  Created by José Alves da Cunha on 27/04/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class TextField : UIView {
    
    let textField = UITextField()
    private var borderView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        settings()
    }
    
    convenience init(placeholder: String = "") {
        self.init()
        setupLayout()
        settings()
        textField.placeholder = placeholder
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        let width: CGFloat = 254
        let height: CGFloat = 42
        self.easy.layout(
            Height(height),
            Width(width))
        
        
        borderView.easy.layout(Edges())
        textField.easy.layout(Left(15), Right(15), Top(), Bottom())
        borderView.layer.borderWidth = 5
        borderView.layer.borderColor = (UIColor(named: "primaryColor") as! CGColor)
        borderView.layer.cornerRadius = 20
    }
    
    func settings() {
        textField.textColor = .white
        textField.autocapitalizationType = .none
    }
}
