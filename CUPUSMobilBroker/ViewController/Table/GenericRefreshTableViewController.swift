//
//  GenericRefreshTableViewController.swift
//  Appbook
//
//  Created by IN2 MacbookPro on 04/01/16.
//  Copyright © 2016 iOS pro team. All rights reserved.
//

import UIKit

class GenericRefreshTableViewController: ViewControllerWithDecorator{
    
    @IBOutlet weak var table: TableWithRefresh!
    
    var sections:[CellSection]!
    
    var updateFunc:((forceUpdate:Bool, observer:([CellSection]) -> Void) -> [CellSection]?)?
    
    func initController(updateFunc:(forceUpdate:Bool, observer:([CellSection]) -> Void) -> [CellSection]?){
        self.updateFunc = updateFunc
        
        update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.beginRefresh()
        
        if updateFunc != nil{
            table.refresh.addTarget(self, action: "update", forControlEvents: .ValueChanged)
        }
        
        if let sections = sections{
            table.sections = sections
            stopRefresh()
        }else{
            table.sections = []
        }
    }
    
    func setSections(sections:[CellSection]){
        self.sections = sections
        
        if table != nil{
            table.sections = sections
            table.reloadData()
            table.endRefresh()
        }
    }
    
    func update(){
        sections = updateFunc!(forceUpdate: true, observer: setSections)
    }
    
    func stopRefresh(){
        table.endRefresh()
    }
    
}