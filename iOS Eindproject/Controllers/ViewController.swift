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
        checkLocationIsOk()
        
        //aanmaken coördinaten
        let centerCoord:CLLocationCoordinate2D =
            CLLocationCoordinate2DMake(51.1284823, 2.748015799999962)
        //afwijking
        let centerSpan = MKCoordinateSpanMake(0.25, 0.25)
        //aanmaken regio om op kaart weer te geven
        // nodig is coordinaat voor aanmaken middelpunt en span (hoeveel graden weergeven)
        let centerRegion = MKCoordinateRegionMake (centerCoord, centerSpan)
        //regio aan kaart meegeven
        bigMap.region = centerRegion
        
        createPins()
        
    }
    
    func checkLocationIsOk() {
        //nakijken of de gebruiker de app al toestemming heeft gegeven om de locatie te gebruiken, indien ja update ik de locatie, indien nee, vraag ik toestemming
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            bigMap.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func createPins(){
        //coordinaten aan maken, op welke plaats komen de pincoordinates
        let ehbCoord = CLLocationCoordinate2DMake(51.146294287889894, 2.707185745239258)
        let ehbCoord2 = CLLocationCoordinate2DMake(51.14467892424189, 2.703580856323242)
        let ehbCoord3 = CLLocationCoordinate2DMake(51.15361656072153, 2.728128433227539)
        let ehbCoord4 = CLLocationCoordinate2DMake(51.15264750308282, 2.7205753326416016)
        let ehbCoord5 = CLLocationCoordinate2DMake(51.14650966543823, 2.7078723907470703)
        
        //Pin aan maken via klaehbCoord
        let ehbPoint = MapPoint.init(coord: ehbCoord, title: "Vistival", subtitle: "Ontvangst")
        let ehbPoint2 = MapPoint.init(coord: ehbCoord2, title: "Vistival", subtitle: "Podium Garnaalvisser")
        let ehbPoint3 = MapPoint.init(coord: ehbCoord3, title: "Vistival", subtitle: "Podium Zeezicht")
        let ehbPoint4 = MapPoint.init(coord: ehbCoord4, title: "Vistival", subtitle: "Eventhal Proeverij")
        let ehbPoint5 = MapPoint.init(coord: ehbCoord5, title: "Vistival", subtitle: "Kinderanimatie")
        // pin (annotation toevoegen aan kaart, mapview)
        bigMap.addAnnotation(ehbPoint)
        bigMap.addAnnotation(ehbPoint2)
        bigMap.addAnnotation(ehbPoint3)
        bigMap.addAnnotation(ehbPoint4)
        bigMap.addAnnotation(ehbPoint5)
        
    }
    
    
    
    }
    //standaard in mapviewdelegate, bepaalt hoe elke annotatie is opgebouwd

   

    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let selectedPin = view.annotation
        print("selected: \(String(describing: selectedPin?.title))")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
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
                let view = MKAnnotationView(annotation:myAnnotation, reuseIdentifier: identifier)
                // nu de view is gemaakt kan alles gefinetuned worden.
                view.image = UIImage.init(named: "visPin.png")
                view.canShowCallout = true
                // indien je een call out (pop up) hebt kan je links en rechts daarbinnen componenten toevoegen
                let button = UIButton.init(type: .infoLight)
                view.rightCalloutAccessoryView = button
                
                return view
            }
        }
        return nil
    }


