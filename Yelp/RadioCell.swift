//
//  RadioCell.swift
//  Yelp
//
//  Created by Audrey Chaing on 10/24/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol RadioCellDelegate {
    @objc optional func radioSwitchCell(radioCell: RadioCell, didChangeValue value:Bool)
    //@objc optional func switchCategoryCell(switchCategoryCell: SwitchCell, didChangeValue value:Bool)
    //@objc optional func switchDealCell(switchDealCell: SwitchCell, didChangeValue value:Bool)
}


class RadioCell: UITableViewCell {
    
    @IBOutlet weak var radioLabel: UILabel!
    
    @IBOutlet weak var onRadioSwitch: UISwitch!
        
    weak var delegate: RadioCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        onRadioSwitch.addTarget(self, action: #selector(RadioCell.radioValueChanged), for: UIControlEvents.valueChanged)
        print("radioValueChanged called")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func radioValueChanged() {
        delegate?.radioSwitchCell?(radioCell: self, didChangeValue: onRadioSwitch.isOn)
        //delegate?.switchDealCell?(switchDealCell: self, didChangeValue: onSwitch.isOn)
        //delegate?.switchCategoryCell?(switchCategoryCell: self, didChangeValue: onSwitch.isOn)
    }

}
