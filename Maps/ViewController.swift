//
//  ViewController.swift
//  Maps
//
//  Created by Adam Moore on 4/9/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        // How close zoomed in
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        // Physical location coordinates
        let latitude: CLLocationDegrees = 47.21
        let longitude: CLLocationDegrees = -122.67
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        // Region plotted on map based on the zoom (span) and the location (coordinates)
        let region = MKCoordinateRegion(center: location, span: span)
        
        // Sets actual place on map
        map.setRegion(region, animated: true)
        
        // Annotation
        let annotation = MKPointAnnotation()
        
        annotation.title = "Some Oregon wildlife refuge."
        
        annotation.subtitle = "One day, I'll live near here, hopefully..."
        
        annotation.coordinate = location
        
        map.addAnnotation(annotation)
        
        
        // uilpgr stands for the object contructor initials
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "New place"
        
        annotation.subtitle = "Maybe I'll go here too!"
        
        map.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

