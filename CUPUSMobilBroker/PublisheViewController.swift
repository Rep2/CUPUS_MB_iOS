//
//  FirstViewController.swift
//  CUPUSMobilBroker
//
//  Created by IN2 MacbookPro on 20/01/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import UIKit

class PublisheViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var table: BasicTable!
    
    var recorder: AudioLevelRecording!
    var locationManager: LocationManager!
    
    var cells = [CellModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.sections = [CellSection(title: nil, cells: [])]
        
        recorder = AudioLevelRecording(readPeriod: 1, observer: recivedAudioReading)
        locationManager = LocationManager()
        
        recorder.prepeare { (allowed) -> Void in
            self.recordButton.enabled = allowed
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var recording = false
    
    @IBAction func startRecording(sender: AnyObject) {
        if !recording{
            recorder.startRecording()
            recordButton.setTitle("Stop detector", forState: .Normal)
        }else{
            recorder.stopRecording()
            recordButton.setTitle("Start detector", forState: .Normal)
        }
        
        recording = !recording
    }
    
    func recivedAudioReading(value: Float){
        let location = LocationManager.location
        
        let locationText = location != nil ? NSString(format: "Location: %.3f, %.3f", location!.coordinate.latitude, location!.coordinate.longitude) : "Location not available"
        
        let dateFormater = NSDateFormatter()
        dateFormater.dateFormat = "HH:mm:ss dd.MM.yyyy"
        
        let cell = CellModel(cellIdentifier: CellIdentifiers.AudioCell.rawValue,
            height: 69,
            data: [
                CellElementIdentifiers.FirstLabel : "Volume level: \(value) dB",
                CellElementIdentifiers.SecondLabel : locationText,
                CellElementIdentifiers.ThirdLabel : dateFormater.stringFromDate(NSDate())
            ])
        
        table.sections[0].cells.append(cell)
        
        dispatch_async(dispatch_get_main_queue(), {
            self.table.insertRowsAtIndexPaths([NSIndexPath(forRow: self.table.sections[0].cells.count - 1, inSection: 0)], withRowAnimation: .Fade)
            self.table.scrollToRowAtIndexPath(NSIndexPath(forRow: self.table.sections[0].cells.count - 1, inSection: 0), atScrollPosition: UITableViewScrollPosition.None, animated: false)
        })
    }


}

