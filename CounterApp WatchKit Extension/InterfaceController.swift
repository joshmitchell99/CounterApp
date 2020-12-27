//
//  InterfaceController.swift
//  CounterApp WatchKit Extension
//
//  Created by Josh Mitchell on 12/22/20.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        
        labelButtons()
        setInitialLabels()
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        labelButtons()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        updatePhone()
    }
    
    
    @IBOutlet weak var AButton: WKInterfaceButton!
    @IBOutlet weak var BButton: WKInterfaceButton!
    @IBOutlet weak var CButton: WKInterfaceButton!
    @IBOutlet weak var DButton: WKInterfaceButton!
    
    @IBOutlet weak var EButton: WKInterfaceButton!
    @IBOutlet weak var FButton: WKInterfaceButton!
    @IBOutlet weak var GButton: WKInterfaceButton!
    @IBOutlet weak var HButton: WKInterfaceButton!
    
    @IBOutlet weak var IButton: WKInterfaceButton!
    @IBOutlet weak var JButton: WKInterfaceButton!
    @IBOutlet weak var KButton: WKInterfaceButton!
    @IBOutlet weak var LButton: WKInterfaceButton!
    
    let defaults = UserDefaults.standard
    
    func labelButtons() {
        
        AButton.setTitle(defaults.string(forKey: "AName"))
        BButton.setTitle(defaults.string(forKey: "BName"))
        CButton.setTitle(defaults.string(forKey: "CName"))
        DButton.setTitle(defaults.string(forKey: "DName"))
        
        EButton.setTitle(defaults.string(forKey: "EName"))
        FButton.setTitle(defaults.string(forKey: "FName"))
        GButton.setTitle(defaults.string(forKey: "GName"))
        HButton.setTitle(defaults.string(forKey: "HName"))
        
        IButton.setTitle(defaults.string(forKey: "IName"))
        JButton.setTitle(defaults.string(forKey: "JName"))
        KButton.setTitle(defaults.string(forKey: "KName"))
        LButton.setTitle(defaults.string(forKey: "LName"))
        
    }
    
    
    
    func todaysDate() -> String {
        let currentDateTime = Date()
        
        let formatter = DateFormatter()
        formatter.isLenient = true
        formatter.timeStyle = .long
        formatter.dateFormat = "dd.MM.yyyy"
        
        let dateTimeString = formatter.string(from: currentDateTime)
        
        return dateTimeString
    }
    
    
    
    func setInitialLabels() {
        
        if (defaults.string(forKey: "AName") == nil) {defaults.set("A", forKey: "AName")}
        if (defaults.string(forKey: "BName") == nil) {defaults.set("B", forKey: "BName")}
        if (defaults.string(forKey: "CName") == nil) {defaults.set("C", forKey: "CName")}
        if (defaults.string(forKey: "DName") == nil) {defaults.set("D", forKey: "DName")}
        
        if (defaults.string(forKey: "EName") == nil) {defaults.set("E", forKey: "EName")}
        if (defaults.string(forKey: "FName") == nil) {defaults.set("F", forKey: "FName")}
        if (defaults.string(forKey: "GName") == nil) {defaults.set("G", forKey: "GName")}
        if (defaults.string(forKey: "HName") == nil) {defaults.set("H", forKey: "HName")}
        
        if (defaults.string(forKey: "IName") == nil) {defaults.set("I", forKey: "IName")}
        if (defaults.string(forKey: "JName") == nil) {defaults.set("J", forKey: "JName")}
        if (defaults.string(forKey: "KName") == nil) {defaults.set("K", forKey: "KName")}
        if (defaults.string(forKey: "LName") == nil) {defaults.set("L", forKey: "LName")}
        
    }
    
    
    
    
    
    
    //MARK: - WATCHCONNECTIVITY
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    
    func updatePhone() {
        print("sending message from watchapp")
        if (WCSession.default.isReachable) && true { //storedDate != todaysDate() {
            
            guard let storedDate = defaults.string(forKey: "currentDate") else {
                defaults.set(todaysDate(), forKey: "currentDate")
                return
            }
            
            let countArray = [
                storedDate,
                (defaults.string(forKey: "AName")!, String(defaults.integer(forKey: "A"))),
                (defaults.string(forKey: "BName")!, String(defaults.integer(forKey: "B"))),
                (defaults.string(forKey: "CName")!, String(defaults.integer(forKey: "C"))),
                (defaults.string(forKey: "DName")!, String(defaults.integer(forKey: "D"))),
                
                (defaults.string(forKey: "EName")!, String(defaults.integer(forKey: "E"))),
                (defaults.string(forKey: "FName")!, String(defaults.integer(forKey: "F"))),
                (defaults.string(forKey: "GName")!, String(defaults.integer(forKey: "G"))),
                (defaults.string(forKey: "HName")!, String(defaults.integer(forKey: "H"))),
                
                (defaults.string(forKey: "IName")!, String(defaults.integer(forKey: "I"))),
                (defaults.string(forKey: "JName")!, String(defaults.integer(forKey: "J"))),
                (defaults.string(forKey: "KName")!, String(defaults.integer(forKey: "K"))),
                (defaults.string(forKey: "LName")!, String(defaults.integer(forKey: "L"))),
            ] as [Any]
            let toSendDict = ["Message": countArray]
            
            
            
            
            
            let message = ["Message": "Hello"]
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}





//func updatePhone() {
//
//    guard let storedDate = defaults.string(forKey: "currentDate") else {
//        defaults.set(todaysDate(), forKey: "currentDate")
//        return
//    }
//    if true {//storedDate != todaysDate() {
//        let countArray = [
//            (defaults.string(forKey: "AName")!, defaults.integer(forKey: "A")),
//            (defaults.string(forKey: "BName")!, defaults.integer(forKey: "B")),
//            (defaults.string(forKey: "CName")!, defaults.integer(forKey: "C")),
//            (defaults.string(forKey: "DName")!, defaults.integer(forKey: "D")),
//
//            (defaults.string(forKey: "EName")!, defaults.integer(forKey: "E")),
//            (defaults.string(forKey: "FName")!, defaults.integer(forKey: "F")),
//            (defaults.string(forKey: "GName")!, defaults.integer(forKey: "G")),
//            (defaults.string(forKey: "HName")!, defaults.integer(forKey: "H")),
//
//            (defaults.string(forKey: "IName")!, defaults.integer(forKey: "I")),
//            (defaults.string(forKey: "JName")!, defaults.integer(forKey: "J")),
//            (defaults.string(forKey: "KName")!, defaults.integer(forKey: "K")),
//            (defaults.string(forKey: "LName")!, defaults.integer(forKey: "L")),
//        ]
//        let toSendDict = [storedDate: countArray as Any]
//        //let messageData: [String: Any] = ["messageData": "HALLO!!!!!!!"]
//        let messageData: [String: Any] = ["messageData": "DDDDDDD"]
//        session.sendMessage(["halle":"fff"], replyHandler: nil) { (err) in
//            print("Error ==== ", err)
//        }
//        print("Message sent...")
//    }
//    defaults.set(todaysDate(), forKey: "currentDate")
//}
//
//let session = WCSession.default
//func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//    switch activationState {
//    case .activated:
//        print("Watch WCSession Activated!!")
//    case .notActivated:
//        print("Watch WCSession Not Activated!!")
//    case .inactive:
//        print("Watch WCSession Inactive!!")
//    }
//}
