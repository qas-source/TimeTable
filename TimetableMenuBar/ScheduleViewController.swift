//
//  ScheduleViewController.swift
//  TimetableMenuBar
//
//  Created by Mohamed Ebsim on 2017-10-26.
//  Copyright © 2017 Mohamed Ebsim. All rights reserved.
//

import Cocoa

class ScheduleViewController: NSViewController {
    
    @IBOutlet var d11: NSTextField!
    @IBOutlet var d12: NSTextField!
    
    @IBOutlet var d21: NSTextField!
    @IBOutlet var d22: NSTextField!
    
    @IBOutlet var d31: NSTextField!
    @IBOutlet var d32: NSTextField!
    
    @IBOutlet var d41: NSTextField!
    @IBOutlet var d42: NSTextField!
    
    

    @IBOutlet var Cohort: NSPopUpButton!
 
    
    
    var timetable = ["","","","","","","","", ""]
    
    /*
     Learnt reading and writing: https://stackoverflow.com/a/24098149
     
     Simple:
     
     When opened: find all the labels information
                    AKA read file
     
     When closed: save all the labels information
                    AKA write file
     
     Added: save button for simplicity sake.
     
    */
    
    
    
    func readFile() -> String {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileURL = dir!.appendingPathComponent("schedule.txt")
        
        //reading
        do {
            let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            return text2
        }
        catch {/* error handling here */}
        return ""
    }
    
    func writeFile(toWrite: String) {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileURL = dir!.appendingPathComponent("schedule.txt")
        
        
        //writing
        do {
            try toWrite.write(to: fileURL, atomically: false, encoding: .utf8)
        }
        catch {/* error handling here */}
    }
    
    func updateTimetable() {
        let x = readFile().components(separatedBy: "\n")
        print(x)
        for i in 0 ..< x.count {
            timetable[i] = x[i]
        }
        d11.stringValue = timetable[0]
        d12.stringValue = timetable[1]
        d21.stringValue = timetable[2]
        d22.stringValue = timetable[3]
        d31.stringValue = timetable[4]
        d32.stringValue = timetable[5]
        d41.stringValue = timetable[6]
        d42.stringValue = timetable[7]
        
    }
    
    func saveTimetable() {
        var text = d11.stringValue + "\n" + d12.stringValue
        text = text + "\n" + d21.stringValue + "\n" + d22.stringValue
        text = text + "\n" + d31.stringValue + "\n" + d32.stringValue
        text = text + "\n" + d41.stringValue + "\n" + d42.stringValue + "\n"
        
        text = text + Cohort.titleOfSelectedItem!
        
        writeFile(toWrite:text)
        

        //let t = TimetableViewController()
        
        TimetableViewController().updateTimetable_1()
    }
    
    override func viewDidLoad() {
        updateTimetable()
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear() {
        saveTimetable()
        super.viewWillDisappear()
    }
    
    @IBAction func save(sender: NSButton) {
        saveTimetable()
        
    }

    


}

