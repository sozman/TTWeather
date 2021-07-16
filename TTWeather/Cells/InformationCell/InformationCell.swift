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
    
    
    /// Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /// Sets the selected state of the cell, optionally animating the transition between states.
    /// - Parameters:
    ///   - selected: true to set the cell as selected, false to set it as unselected. The default is false.
    ///   - animated: true to animate the transition between selected states, false to make the transition immediate.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
