//
//  ContentView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 06.05.2024.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @State private var currentTab: String = "Profile"
    @EnvironmentObject var viewModel: AuthViewModel
    
    let recyclingLocations: [PlaceAnnotation] = [
            PlaceAnnotation(coordinate: CLLocationCoordinate2D(latitude: 43.3025, longitude: 76.9195), title: "Recycling Center A", subtitle: "Serikov St 61, Almaty 050000"),
            PlaceAnnotation(coordinate: CLLocationCoordinate2D(latitude: 43.26111, longitude: 76.965), title: "Bottlemat", subtitle: "Central Park, Gogol St 1, Almaty 050002"),
            PlaceAnnotation(coordinate: CLLocationCoordinate2D(latitude: 43.2578, longitude: 76.8820), title: "Recycling Center C", subtitle: "Secondary recycling location"),
            PlaceAnnotation(coordinate: CLLocationCoordinate2D(latitude: 43.25556, longitude: 76.94333), title: "Bottlemat", subtitle: "Kazakh-British Technical University, Tole Bi Street 59, Almaty 050000"),
            PlaceAnnotation(coordinate: CLLocationCoordinate2D(latitude: 43.2534, longitude: 76.8895), title: "Recycling Center E", subtitle: "Secondary recycling location"),
            PlaceAnnotation(coordinate: CLLocationCoordinate2D(latitude: 43.2354, longitude: 76.8875), title: "Recycling Center F", subtitle: "City outskirts recycling location"),
    ]

    var body: some View {
        
        NavigationView {
            if viewModel.userSession != nil {
                TabView(selection: $currentTab) {
                    BonusView()
                        .tag("Bonus")
                        .tabItem {
                            Image(systemName: "creditcard.fill")
                            Text("Bonus")
                        }
                    ExchangeListView()
                        .tag("List")
                        .tabItem {
                            Image(systemName: "app.gift.fill")
                            Text("Catalog")
                        }
                    InfoView()
                        .tag("Info")
                        .tabItem {
                            Image(systemName: "info.bubble.fill.rtl")
                            Text("Info")
                        }
                    MapView(recyclingLocations: recyclingLocations)
                        .tag("Map")
                        .tabItem {
                            Image(systemName: "map.fill")
                            Text("Map")
                    }
                    ProfileView()
                        .tag("Profile")
                        .tabItem {
                            Image(systemName: "person.crop.circle.fill")
                            Text("Profile")
                    }
                    
                }
            } else {
                // Show login view if not logged in
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
