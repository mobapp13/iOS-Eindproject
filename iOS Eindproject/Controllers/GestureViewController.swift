//
//  GestureViewController.swift
//  iOS Eindproject
//
//  Created by Marnix Steel on 01/02/2018.
//  Copyright © 2018 EhB. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {

    @IBOutlet weak var ivFullScreen: UIImageView!
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ivFullScreen.image = image
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
