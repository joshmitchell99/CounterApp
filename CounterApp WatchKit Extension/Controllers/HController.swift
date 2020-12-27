//
//  AController.swift
//  CounterApp WatchKit Extension
//
//  Created by Josh Mitchell on 12/22/20.
//

import WatchKit
import Foundation


class HController: WKInterfaceController {
    
    @IBOutlet weak var countLabel: WKInterfaceLabel!
    
    let defaults = UserDefaults.standard
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        countLabel.setText(String(defaults.integer(forKey: "H")))
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func plusPressed() {
        let number = defaults.integer(forKey: "H")
        defaults.set(number+1, forKey: "H")
        print(defaults.integer(forKey: "H"))
        countLabel.setText(String(number+1))
    }
    
    @IBAction func minusPressed() {
        let number = defaults.integer(forKey: "H")
        defaults.set(number-1, forKey: "H")
        print(defaults.integer(forKey: "H"))
        countLabel.setText(String(number-1))
    }
    
    @IBAction func clearPressed() {
        defaults.set(0, forKey: "H")
        countLabel.setText("0")
    }
    
    @IBAction func renamePressed() {
        presentTextInputController(withSuggestions: [""], allowedInputMode:   WKTextInputMode.plain) { (arr: [Any]?) in
            self.defaults.set(arr?.first, forKey:"HName")
        }
    }
    

}

