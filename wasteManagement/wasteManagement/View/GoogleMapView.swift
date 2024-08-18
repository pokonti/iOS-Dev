//
//  GoogleMapView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 06.05.2024.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    let recyclingLocations: [RecyclingLocation]
    private let initialCameraPosition = GMSCameraPosition(latitude: 37.7749, longitude: -122.4194, zoom: 12.0)

    func makeUIView(context: Context) -> GMSMapView {
        let mapView = GMSMapView(frame: .zero)
        mapView.camera = initialCameraPosition
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
        addMarkers(to: mapView)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    private func addMarkers(to mapView: GMSMapView) {
        for location in recyclingLocations {
            let marker = GMSMarker(position: location.coordinate)
            marker.title = location.title
            marker.snippet = location.subtitle
            marker.map = mapView
        }
    }

    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: GoogleMapView

        init(_ parent: GoogleMapView) {
            self.parent = parent
        }

        // Implement delegate methods if needed
    }
}


