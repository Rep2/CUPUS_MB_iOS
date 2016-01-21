//
//  Wireframe.swift
//  CUPUSMobilBroker
//
//  Created by IN2 MacbookPro on 20/01/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import UIKit

/// Registerd view controllers of Main storyboard
enum RegisteredViewControllers: String{
    case Publisher = "Publisher"
    case Subscriber = "Subscriber"
}

/// Base wireframe. For customization split into multiple
class Wireframe{
    
    static var instance: Wireframe!
    
    var navigationController: UITabBarController!
    
    init(){
        Wireframe.instance = self
        
        let tabbarItems = [
            TabbarViewItem(
                name: .Publisher,
                title: "Publisher",
                iconTitle: "Mic"
            ),
            TabbarViewItem(
                name: .Subscriber,
                title: "Subscriber",
                iconTitle: "Down"
            )
        ]
        
        var controllers = TabbarControllerViewsCreator().createTabbarViews(tabbarItems)
        controllers.append(settingsController())
        
        navigationController = BaseTabViewController(viewControllers: controllers)
    }
    
    func getViewController(name: RegisteredViewControllers) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(name.rawValue)
    }
    
    func pushViewController(controller: UIViewController, num: Int){
        (navigationController.viewControllers![num] as! UINavigationController).pushViewController(controller, animated: true)
    }
}

func settingsController() -> UIViewController{
    
    let controller = UIStoryboard(name: "Generics", bundle: nil).instantiateViewControllerWithIdentifier(GenericViewControllerIdentifiers.GenericTableViewController.rawValue) as! GenericTableViewController
    
    let cells = [
        CellModel(cellIdentifier: CellIdentifiers.TwoLabelRightDetail.rawValue,
            data: [
                CellElementIdentifiers.FirstLabel: "IP",
                CellElementIdentifiers.FirstField: "192.168.14.2"
            ]),
        CellModel(cellIdentifier: CellIdentifiers.TwoLabelRightDetail.rawValue,
            data: [
                CellElementIdentifiers.FirstLabel: "Port",
                CellElementIdentifiers.FirstField: "22"
            ]),
        CellModel(cellIdentifier: CellIdentifiers.OneLabelCheckBox.rawValue,
            data: [
                CellElementIdentifiers.FirstLabel: "Notifications enabled"
            ])
    ]
    
    controller.setSections([CellSection(title: nil, cells: cells)], title: "Settings")
    
    let navigationController = UINavigationController(rootViewController: controller)
    navigationController.navigationBar.setBackgroundImage(UIImage(named: "Nav"), forBarMetrics: .Default)
    navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    navigationController.navigationBar.tintColor = UIColor.whiteColor()
    
    navigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "Setup"), selectedImage: nil)
    
    return navigationController
}

