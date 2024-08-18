//
//  MapView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 06.05.2024.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let almatyCoordinate = CLLocationCoordinate2D(latitude: 43.2389, longitude: 76.8897)
    var recyclingLocations: [PlaceAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.region = MKCoordinateRegion(center: almatyCoordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.addAnnotations(recyclingLocations) // Add recycling locations as annotations
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(recyclingLocations)
    }

}

//#Preview {
//    MapView()
//}
