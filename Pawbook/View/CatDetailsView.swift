//
//  CatDetailsView.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let catCoordinate = CLLocationCoordinate2D(latitude: 41.03252586801304, longitude: 28.984382222365696)
}

struct CatDetailsView: View {
    @ObservedObject var catViewModel: CatViewModel
    
    @State private var catCoordinates = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.03252586801304, longitude: 28.984382222365696),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        AsyncImage(url: URL(string: catViewModel.thumbnailImage)) { image in
                            image.image?.resizable()
                        }
                        .frame(width: 360, height: 360)
                        
                        AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/GAmy2bg8G.jpg")) { image in
                            image.image?.resizable()
                        }
                        .frame(width: 360, height: 360)
                        
                        AsyncImage(url: URL(string: "https://cdn2.thecatapi.com/images/LSaDk6OjY.jpg")) { image in
                            image.image?.resizable()
                        }
                        .frame(width: 360, height: 360)
                    }
                }
                
                HStack {
                    Text("\(catViewModel.catName)")
                        .font(.largeTitle)
                        .bold()
                    Text("from")
                        .font(.largeTitle)
                    Text("\(catViewModel.catNeighborhood)")
                        .font(.largeTitle)
                        .bold()
                }
            }
            
            Text("\(catViewModel.catName) is \(catViewModel.catAge.formatted()) years old.")
                .font(.headline)
            Text("He likes to play with animating objects, run after his human and some other silly things every cat loves to do!")
                .padding()
            
            Map {
                Marker(catViewModel.catName, systemImage: "cat.circle.fill", coordinate: catViewModel.catCoordinates)
            }
            .frame(width: 350, height: 350)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
        }
    }
}

#Preview {
    CatDetailsView(catViewModel: CatViewModel(catModel: CatModel(name: "Arwen", breed: "Tabby", age: 2.5, neighborhood: "Cihangir", coordinate: CLLocationCoordinate2D(latitude: 41.03252586801304, longitude: 28.984382222365696), thumbnailImage: "https://cdn2.thecatapi.com/images/dj5.jpg")))
}