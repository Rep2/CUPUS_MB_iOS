//
//  BaseNavigationViewController.swift
//  CUPUSMobilBroker
//
//  Created by Rep on 1/21/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import UIKit

/// TabbarController controller made for easy use
class BaseTabViewController: UITabBarController{
    
    /// Initializes tabbar with views
    init(viewControllers: [UIViewController]){
        super.init(nibName: nil, bundle: nil)
        
        self.viewControllers = viewControllers
        
        postInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        postInit()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    /// Customizes tabbar
    func postInit(){
        tabBar.backgroundImage = UIImage(named: "Tab")
        tabBar.tintColor = UIColor.whiteColor()
    }
    
    
}
