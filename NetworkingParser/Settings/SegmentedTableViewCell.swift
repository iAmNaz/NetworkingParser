//
//  SegmentedTableViewCell.swift
//  NetworkingParser
//
//  Created by Nazario Mariano on 8/10/21.
//

import UIKit

class SegmentedTableViewCell: UITableViewCell {
    var model: FieldModel! {
        didSet {
            guard let index = model.value as? Int else {
                return
            }
            segmentedControl.selectedSegmentIndex = index
        }
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func onValueChange(_ sender: Any) {
        let control = sender as! UISegmentedControl
        print(control.selectedSegmentIndex)
        // naive solution
        UserDefaultsHelper.set(scrollDirection: control.selectedSegmentIndex)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
