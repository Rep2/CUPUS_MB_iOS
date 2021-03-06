//
//  TabbarControllerCreator.swift
//  CUPUSMobilBroker
//
//  Created by Rep on 1/21/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import UIKit

struct TabbarViewItem{
    let name: RegisteredViewControllers
    let title: String
    let iconTitle: String
}

/// Creates view controller for UITabbarController
class TabbarControllerViewsCreator{
    
    func createTabbarViews(controllerNames: [TabbarViewItem]) -> [UIViewController]{
        
        var viewControllers = [UIViewController]()
        
        for item in controllerNames{
            viewControllers.append(
                createBaseNavigationController(item))
        }
        
        return viewControllers
    }
    
    private func createBaseNavigationController(tabbarViewItem: TabbarViewItem) -> UINavigationController{
        
        let navigationController = UINavigationController(rootViewController: Wireframe.instance.getViewController(tabbarViewItem.name))
        navigationController.navigationBar.setBackgroundImage(UIImage(named: "Nav"), forBarMetrics: .Default) 
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController.navigationBar.tintColor = UIColor.whiteColor()
        
        navigationController.tabBarItem = UITabBarItem(title: tabbarViewItem.title, image: UIImage(named: tabbarViewItem.iconTitle), selectedImage: nil)
        
        return navigationController;
    }
    
}