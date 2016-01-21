//
//  SecondViewController.swift
//  CUPUSMobilBroker
//
//  Created by IN2 MacbookPro on 20/01/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import UIKit
import GoogleMaps

class SubscriberViewController: UIViewController {
    var mapView: GMSMapView!
    var centerLocation:CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItems = [
            
            UIBarButtonItem(image: UIImage(named: "Setup"), style: .Plain, target: self, action: "pushSubscriberSettings"),
            UIBarButtonItem(image: UIImage(named: "List"), style: .Plain, target: self, action: "pushList")]
        
        if let location = LocationManager.location{
            centerLocation = location
        }else{
            centerLocation = CLLocation(latitude: 45.1, longitude: 19.2)
        }
        
        let camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: centerLocation.coordinate.latitude, longitude: centerLocation.coordinate.longitude), zoom: 8, bearing: CLLocationDirection(), viewingAngle: 0)
 
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        
        let button = UIButton(frame: CGRect(x: 16, y: view.bounds.size.height - 163, width: view.bounds.size.width - 32, height: 40))
        button.backgroundColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 1)
        button.setTitle("Start subscriber", forState: .Normal)
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        
        
        
        mapView.addSubview(button)
   
        self.view = mapView;
        
        addRect()
    }
    
    func pushSubscriberSettings(){
        
        let cells1 = [
            CellModel(cellIdentifier: CellIdentifiers.TwoLabelRightDetail.rawValue, data: [
                CellElementIdentifiers.FirstLabel: "Latitude width",
                CellElementIdentifiers.FirstField: "1"
                ]),
            CellModel(cellIdentifier: CellIdentifiers.TwoLabelRightDetail.rawValue, data: [
                CellElementIdentifiers.FirstLabel: "Longitude width",
                CellElementIdentifiers.FirstField: "1"
                ]),
            CellModel(cellIdentifier: CellIdentifiers.OneLabelCheckBox.rawValue,  data: [
                CellElementIdentifiers.FirstLabel: "Using position filter"
                ])
            
            ]
        
        let cells2 = [
            CellModel(cellIdentifier: CellIdentifiers.TwoLabelRightDetail.rawValue, data: [
                CellElementIdentifiers.FirstLabel: "Minimum value",
                CellElementIdentifiers.FirstField: "1"
                ]),
            CellModel(cellIdentifier: CellIdentifiers.TwoLabelRightDetail.rawValue, data: [
                CellElementIdentifiers.FirstLabel: "Maximum value",
                CellElementIdentifiers.FirstField: "100"
                ]),
            CellModel(cellIdentifier: CellIdentifiers.OneLabelCheckBox.rawValue,  data: [
                CellElementIdentifiers.FirstLabel: "Using value filter"
                ])
        ]
        
        pushGenericTableView(
            [CellSection(title: "Position filter", cells: cells1),
            CellSection(title: "Value filter", cells: cells2)],
            title: "Subscription"
        )
        
    }
    
    func pushList(){
        
        let cells = [
            CellModel(cellIdentifier: CellIdentifiers.AudioCell.rawValue,
                height: 69,
                data: [
                    CellElementIdentifiers.FirstLabel : "Volume level: 11.32 dB",
                    CellElementIdentifiers.SecondLabel : "Location: 45.102, 15.11",
                    CellElementIdentifiers.ThirdLabel : "22:11:03 11.2.2015"
                ]),
            CellModel(cellIdentifier: CellIdentifiers.AudioCell.rawValue,
                height: 69,
                data: [
                    CellElementIdentifiers.FirstLabel : "Volume level: 14.32 dB",
                    CellElementIdentifiers.SecondLabel : "Location: 44.102, 15.11",
                    CellElementIdentifiers.ThirdLabel : "22:11:06 11.2.2015"
                ]),
            CellModel(cellIdentifier: CellIdentifiers.AudioCell.rawValue,
                height: 69,
                data: [
                    CellElementIdentifiers.FirstLabel : "Volume level: 19.32 dB",
                    CellElementIdentifiers.SecondLabel : "Location: 45.102, 15.11",
                    CellElementIdentifiers.ThirdLabel : "22:12:03 11.2.2015"
                ])
        ]
        
        pushGenericTableView([CellSection(title: nil, cells: cells)],
        title: "Recieved subscriptions")
        
    }

    func addRect(){
        let path = GMSMutablePath()
        path.addCoordinate(CLLocationCoordinate2DMake(centerLocation.coordinate.latitude + 0.5   , centerLocation.coordinate.longitude + 0.7))
        path.addCoordinate(CLLocationCoordinate2DMake(centerLocation.coordinate.latitude - 0.5   , centerLocation.coordinate.longitude + 0.7))
        path.addCoordinate(CLLocationCoordinate2DMake(centerLocation.coordinate.latitude - 0.5   , centerLocation.coordinate.longitude - 0.7))
        path.addCoordinate(CLLocationCoordinate2DMake(centerLocation.coordinate.latitude + 0.5   , centerLocation.coordinate.longitude - 0.7))
        path.addCoordinate(CLLocationCoordinate2DMake(centerLocation.coordinate.latitude + 0.5   , centerLocation.coordinate.longitude + 0.7))
        
        let rectangle = GMSPolyline(path: path)
        rectangle.strokeColor = UIColor.darkGrayColor()
        rectangle.map = mapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

