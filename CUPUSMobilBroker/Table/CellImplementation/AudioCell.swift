//
//  AudioCell.swift
//  CUPUSMobilBroker
//
//  Created by Rep on 1/21/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import UIKit

class AudioCell:GenericCellImplementation{
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    override func initElements(){
        elements[CellElementIdentifiers.FirstLabel] = firstLabel
        elements[CellElementIdentifiers.SecondLabel] = secondLabel
        elements[CellElementIdentifiers.ThirdLabel] = thirdLabel
    }
    
}