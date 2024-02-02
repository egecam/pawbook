//
//  CatViewModel.swift
//  Pawbook
//
//  Created by Ege Çam on 2.02.2024.
//

import Foundation
import CoreLocation

class CatViewModel: ObservableObject {
    @Published var catModel: CatModel
    
    init(catModel: CatModel) {
        self.catModel = catModel
    }
    
    var catName: String {
        return catModel.name
    }
    
    var catBreed: String {
        return catModel.breed
    }
    
    var catAge: Double {
        return catModel.age
    }
    
    var catNeighborhood: String {
        return catModel.neighborhood
    }
    
    var catCoordinates: CLLocationCoordinate2D {
        return catModel.coordinate ?? .init(latitude: 1, longitude: 1)
    }
    
    var thumbnailImage: String {
        return catModel.thumbnailImage
    }
}
