//
//  MapVC.swift
//  Vacations
//
//  Created by Bouziane Bey on 24/07/2019.
//  Copyright © 2019 Bouziane Bey. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var userPosition: CLLocation?
    var calanques: [Calanque] = CollectionCalanque().all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        mapView.showsUserLocation = true
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        addAnnotations()
        NotificationCenter.default.addObserver(self, selector: #selector(notifDetail), name: Notification.Name("detail"), object: nil)
        if calanques.count > 0 {
            let premiere = calanques[0].coordinate
            setupMap(coordinate: premiere)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            if let myPosition = locations.last{
                userPosition = myPosition
            }
        }
    }
    
    func setupMap(coordinate: CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    @objc func notifDetail(notification: Notification){
        if let calanque = notification.object as? Calanque{
            toDetail(calanque: calanque)
        }
        
    }
    
    func toDetail(calanque: Calanque){
        performSegue(withIdentifier: "detail", sender: calanque)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            if let controller = segue.destination as? detailVC{
                controller.receivedCalanque = sender as? Calanque
            }
        }
    }
    
    func addAnnotations(){
        for calanques in calanques{
        
            //Anotation standard
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = calanques.coordinate
//            annotation.title = calanques.name
//            mapView.addAnnotation(annotation)
            
            //Custon annotation
            let annotation = Annotation(calanques)
            mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseIdentifier = "reuseID"
        
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        }
        if let ano = annotation as? Annotation{
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
            if annotationView == nil{
                
                //annotationView = MyAnnotation(annotation: ano, reuseIdentifier: reuseIdentifier)
                annotationView = MyAnnotation(controller: self, annotation: ano, reuseIdentifier: reuseIdentifier)
                
                return annotationView
            } else {
                return annotationView
            }
        }
        
        return nil
    }
    
    @IBAction func segmentedChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = MKMapType.standard
        case 1:
            mapView.mapType = MKMapType.satellite
        case 2:
            mapView.mapType = MKMapType.hybrid
        default: break
        }
        
    }
    
    @IBAction func getPosition(_ sender: Any) {
        if userPosition != nil {
            setupMap(coordinate: userPosition!.coordinate)
        }
    }
    
}
