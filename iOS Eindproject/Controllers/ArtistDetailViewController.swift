//
//  ArtistViewController.swift
//  iOS Eindproject
//
//  Created by Marnix Steel on 29/01/2018.
//  Copyright © 2018 EhB. All rights reserved.
//

import UIKit

class ArtistDetailViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var bioText: UITextView!
    @IBOutlet weak var bioPic: UIImageView!
    
    var artiest:Artist?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        lblText.text = artiest?.name
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
