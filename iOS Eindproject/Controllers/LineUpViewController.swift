//
//  LineUpViewController.swift
//  iOS Eindproject
//
//  Created by Marnix Steel on 29/01/2018.
//  Copyright © 2018 EhB. All rights reserved.
//

import UIKit

class LineUpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var lineUp:[Artist] = [Artist]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineUp.append(Artist.init(name: "Kenji Minogue", stage: "Mainstage", time: "Vrijdag 07/07 19u - 20u"))
        lineUp.append(Artist.init(name: "Arno", stage: "Mainstage", time: "Vrijdag 07/07 20u - 22u"))
        lineUp.append(Artist.init(name: "Millionaire", stage: "Marquee", time: "Vrijdag 07/07 22u - 00u"))
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lineUp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cell zoeken in je storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //product halen uit lijst voor deze specifieke rij
        //indexpath -> positie in tabel, bevat zowel section als row
        let currentArtist = lineUp[indexPath.row]
        
        //cel opvullen met productgegevens
        cell.textLabel?.text = currentArtist.name
        cell.detailTextLabel?.text = "\(currentArtist.stage) - \(currentArtist.time)"
        //cell.detailTextLabel?.text = currentArtist.
        
        //cel klaar, mag toegevoegd worden aan scherm
        return cell
    }
    
    
    

}
