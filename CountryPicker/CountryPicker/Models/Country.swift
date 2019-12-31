//
//  SCountry.swift
//  SmartLab
//
//  Created by Esraa Ali on 10/3/19.
//  Copyright © 2019 Asgatech. All rights reserved.
//

import UIKit

struct Country {
      var name = ""
      var code = ""
      var phoneCode = ""
      
      var upCode: String {
          return code.uppercased()
      }
}
