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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

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
