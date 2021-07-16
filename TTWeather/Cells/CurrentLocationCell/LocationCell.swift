//
//  CurrentLocationCell.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import UIKit

/// Location Cell For TableView
class LocationCell: UITableViewCell {
    // MARK: - Properties
    /// Location Type
    var locationType: LocationType = .currentLocation {
        didSet {
            self.changeImage()
        }
    }
    
    
    // MARK: - View Object
    
    /// Location Name Label
    @IBOutlet weak var locationNameLabel: UILabel!
    
    /// Location Image View
    @IBOutlet private weak var locationImageView: UIImageView!
    
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
    
    /// Change Image for location type
    private func changeImage() {
        /// Location Image
        let image: UIImage = {
            switch self.locationType {
            case .currentLocation:
                return UIImage(systemName: "mappin.and.ellipse") ?? UIImage()
            case .savedLocation:
                return UIImage(systemName: "book.closed") ?? UIImage()
            case .findLocation:
                return UIImage(systemName: "map") ?? UIImage()
            }
        }()
        self.locationImageView.image = image
    }
}

/// Location Type
public enum LocationType {
    case currentLocation
    case savedLocation
    case findLocation
}
