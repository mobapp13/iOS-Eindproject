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
            CLLocationCoordinate2DMake(51.135244, 2.732162)
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
        let ehbCoord = CLLocationCoordinate2DMake(51.135244, 2.732162)
        let ehbCoord2:CLLocationCoordinate2D =
            CLLocationCoordinate2DMake(51.135250, 2.732110)
        let ehbCoord3 = CLLocationCoordinate2DMake(51.135248, 2.732120)
        let ehbCoord4 = CLLocationCoordinate2DMake(51.135251, 2.732130)
        let ehbCoord5 = CLLocationCoordinate2DMake(51.1352548, 2.732170)
        //Pin aan maken via klasse
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
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let selectedPin = view.annotation
        print("selected: \(String(describing: selectedPin?.title))")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil;
        }else{
            let pinIdent = "Pin";
            var pinView: MKPinAnnotationView;
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdent) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation;
                pinView = dequeuedView;
            }else{
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinIdent);
                pinView.canShowCallout = true
                
            }
            return pinView;
        }
    }
    
    
}

