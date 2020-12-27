//
//  ViewController.swift
//  CounterApp
//
//  Created by Josh Mitchell on 12/22/20.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
    }
    
    @IBOutlet weak var dataLabel: UILabel!
    
    
    
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    func sessionDidDeactivate(_ session: WCSession) {
    }
    
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("received message on iPhone")
        dataLabel.text = "rrrr"
        DispatchQueue.main.async {
            self.dataLabel.text = "eee"//message["Message"].debugDescription as! String
        }
    }
    
    
    
    
    
    
    
    
}



////var session: WCSession?
//
//func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
//    switch activationState {
//    case .activated:
//        print("iPhone WCSession Activated!!")
//    case .notActivated:
//        print("iPhone WCSession Not Activated!!")
//    case .inactive:
//        print("iPhone WCSession Inactive!!")
//    }
//}
//func sessionDidBecomeInactive(_ session: WCSession) {
//    print("Session went inactive")
//}
//func sessionDidDeactivate(_ session: WCSession) {
//    print("Session deactivated")
//}
//
//func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {//[String : Any]) {
//    print("received message: \(message)")
//    dataLabel.text = "receiving!!!"
////        DispatchQueue.main.async { //6
////            //            if let messageData = message["messageData"] {
////            //                print("THIS IS THE messagedata", messageData)
////            //                self.dataLabel.text = messageData
////            //                self.saveData(data: messageData as! [String : Any])
////            //            }
////        }
//}
