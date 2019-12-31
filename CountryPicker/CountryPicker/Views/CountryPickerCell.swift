//
//  CountryPickerCell.swift
//  SmartLab
//
//  Created by Esraa Ali on 10/3/19.
//  Copyright © 2019 Asgatech. All rights reserved.
//

import UIKit

class CountryPickerCell: UITableViewCell {
    
    // Mark: - Outlets
    @IBOutlet weak var flagImg: UIImageView!
    @IBOutlet weak var countryCodeLbl: UILabel!
    @IBOutlet weak var countryNameLbl: UILabel!
    
    // Mark: - Variable
    var country: Country! {
        didSet {
            populateView()
        }
    }
    
    // Mark: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func populateView() {
        flagImg.image = UIImage(named: country.upCode) ?? UIImage()
        countryCodeLbl.text = country.phoneCode
        countryNameLbl.text = country.name
    }
    
}
