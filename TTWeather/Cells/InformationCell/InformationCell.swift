//
//  InformationCell.swift
//  TTWeather
//
//  Created by Sinan Özman on 15.07.2021.
//

import UIKit

class InformationCell: UITableViewCell {

    // MARK: - Left Section
    /// Left Section Title Label
    @IBOutlet weak var leftSectionTitleLabel: UILabel!
    /// Left Section Content Label
    @IBOutlet weak var leftSectionContentLabel: UILabel!
    // MARK: - Right Section
    /// Right Section Title Label
    @IBOutlet weak var rightSectionTitleLabel: UILabel!
    /// Right Section Content Label
    @IBOutlet weak var rightSectionContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
