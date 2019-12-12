//
//  MapView.swift
//  SwiftUI-MapView
//
//  Created by Anand Nimje on 17/10/19.
//  Copyright © 2019 Anand. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    let landmarks = LandmarkAnnotation.requestMockData()
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }
    
    /**
     - Description - Replace the body with a make UIView(context:) method that creates and return an empty MKMapView
     */
    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        //If you changing the Map Annotation then you have to remove old Annotations
        //mapView.removeAnnotations(mapView.annotations)
        view.delegate = context.coordinator
        view.addAnnotations(landmarks)
    }
    
    
    class MapView: NSObject, MKMapViewDelegate {
        
        var mapViewController: MapView
        
        init(_ control: MapView) {
            self.mapViewController = control
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
            let annotationView = MKAnnotationView(annotation: annotation,
                                                  reuseIdentifier: "customView")
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "locationPin")
            return annotationView
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
