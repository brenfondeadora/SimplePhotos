//
//  PhotosViewModel.swift
//  SimplePhotos
//
//  Created by Brenda Saavedra  on 28/04/23.
//

import Foundation

final class PhotosViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    
    init() {
        fetchPhotos()
    }
    
    func fetchPhotos() {
        let getPhotosUrlString = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: getPhotosUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                if let posts = try? JSONDecoder().decode([Photo].self, from: data) {
                    DispatchQueue.main.async {
                        self.photos = posts
                    }
                    return
                }
            }
            #if DEBUG
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            #endif
        }.resume()
    }
}
