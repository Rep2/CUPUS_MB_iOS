//
//  GenericViewControllerIdentifiers.swift
//  CUPUSMobilBroker
//
//  Created by Rep on 1/21/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import UIKit

enum GenericViewControllerIdentifiers: String{
    case GenericTableViewController = "GenericTableViewController"
}

func pushGenericTableView(sections: [CellSection], title:String){
    
    let controller = UIStoryboard(name: "Generics", bundle: nil).instantiateViewControllerWithIdentifier(GenericViewControllerIdentifiers.GenericTableViewController.rawValue) as! GenericTableViewController
    
    controller.setSections(sections, title: title)
    
    Wireframe.instance.pushViewController(controller, num: 1)
}