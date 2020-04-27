//
//  TicketsTableViewCell.swift
//  beerstasks
//
//  Created by José Alves da Cunha on 26/04/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import UIKit

class TicketsTableViewCell: UITableViewCell {
    
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
