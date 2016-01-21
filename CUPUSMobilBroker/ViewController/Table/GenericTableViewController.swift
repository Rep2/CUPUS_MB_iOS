//
//  GenericTableViewController.swift
//  Glaxo
//
//  Created by Rep on 12/7/15.
//  Copyright © 2015 IN2. All rights reserved.
//

import UIKit

/**
    Generic UIViewController inmplementing BasicTable
*/
class GenericTableViewController: UIViewController{
    
    @IBOutlet weak var table: BasicTable!
    
    var sections:[CellSection]!
    var titleView:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.sections = sections ?? []
        titleView = title ?? "Title"
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: "backgroundTapped")
        
        table.addGestureRecognizer(gestureRecognizer)
    }
    
    func setSections(sections:[CellSection], title: String){
        self.sections = sections
        self.title = title
        
        if table != nil{
            table.sections = sections
            table.reloadData()
        }
        
        if view != nil{
            titleView = title
        }
    }
    
    func backgroundTapped(){
        table.endEditing(true)
    }
}
