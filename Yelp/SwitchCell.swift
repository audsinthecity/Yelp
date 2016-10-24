//
//  SwitchCell.swift
//  Yelp
//
//  Created by Audrey Chaing on 10/21/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate {
    @objc optional func switchCell(switchCell: SwitchCell, didChangeValue value:Bool)
    @objc optional func switchCategoryCell(switchCategoryCell: SwitchCell, didChangeValue value:Bool)
    @objc optional func switchDealCell(switchDealCell: SwitchCell, didChangeValue value:Bool)
}

class SwitchCell: UITableViewCell {

    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    weak var delegate: SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        onSwitch.addTarget(self, action: #selector(SwitchCell.switchValueChanged), for: UIControlEvents.valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged() {
        delegate?.switchCell?(switchCell: self, didChangeValue: onSwitch.isOn)
        delegate?.switchDealCell?(switchDealCell: self, didChangeValue: onSwitch.isOn)
        delegate?.switchCategoryCell?(switchCategoryCell: self, didChangeValue: onSwitch.isOn)
    }

}
