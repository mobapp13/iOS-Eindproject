//
//  ViewController.swift
//  iOS Eindproject
//
//  Created by Admin on BE61-0129-.
//  Copyright © 2561 BE EhB. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
    
{
    @IBOutlet weak var bigMap: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.bigMap.showsUserLocation = true
        checkLocationIsOk()
        
        //aanmaken coördinaten
        let centerCoord:CLLocationCoordinate2D =
            CLLocationCoordinate2DMake(50.88528, 4.371558)
        //afwijking
        let centerSpan = MKCoordinateSpanMake(0.25, 0.25)
        //aanmaken regio om op kaart weer te geven
        // nodig is coordinaat voor aanmaken middelpunt en span (hoeveel graden weergeven)
        let centerRegion = MKCoordinateRegionMake (centerCoord, centerSpan)
        //regio aan kaart meegeven
        bigMap.region = centerRegion
        
    }
    
    func checkLocationIsOk() {
        //nakijken of de gebruiker de app al toestemming heeft gegeven om de locatie te gebruiken, indien ja update ik de locatie, indien nee, vraag ik toestemming
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            bigMap.showsUserLocation = true;
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func createPins(){
        //coordinaten aan maken, op welke plaats komen de pincoordinates
        let ehbCoord = CLLocationCoordinate2DMake(50.88528, 4.371558)
        
        //Pin aan maken via klasse
        let ehbPoint = MapPoint.init(coord: ehbCoord, title: "Vistival", subtitle: "test")
        // pin (annotation toevoegen aan kaart, mapview)
        bigMap.addAnnotation(ehbPoint)
    }
    
   
    
 

    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    
    }
    //standaard in mapviewdelegate, bepaalt hoe elke annotatie is opgebouwd
    func bigMap (_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    
    //van welk type is de annotatie?
    // if let : initialiseert variabele en kijkt meteen na of alles correct is aangemaakt
    if let myAnnotation = annotation as? MapPoint {
        
        
        //kijken of er al een opmaak was, indien ja hergebruiken, indien nee aanmaken
        //deque -> verwacht identifier om te weten welke opmaak
        let identifier = "Pin"
        
        if let herbruikbareView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
            
            return herbruikbareView
        }else{
            // opmaak bestond nog niet; aanmaken !
            let view = MKPinAnnotationView(annotation:myAnnotation, reuseIdentifier: identifier)
            // nu de view is gemaakt kan alles gefinetuned worden.
            view.pinTintColor = UIColor.cyan
            view.canShowCallout = true
            view.animatesDrop = true
            // indien je een call out (pop up) hebt kan je links en rechts daarbinnen componenten toevoegen
            let button = UIButton.init(type: .infoLight)
            view.rightCalloutAccessoryView = button
            
            return view
            }
        }
        return nil
    }
   

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let selectedPin = view.annotation
        print("selected: \(selectedPin?.title)")
    }



    

    

}

