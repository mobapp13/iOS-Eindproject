//
//  LineUpViewController.swift
//  iOS Eindproject
//
//  Created by Marnix Steel on 29/01/2018.
//  Copyright © 2018 EhB. All rights reserved.
//

import UIKit

class LineUpViewController: UITableViewController {

    var lineUp:[Artist] = [Artist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineUp.append(Artist.init(name: "Kenji Minogue", stage: "Mainstage", time: "Vrijdag 07/07 19u - 20u"))
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
