//
//  ContentView.swift
//  SimplePhotos
//
//  Created by Brenda Saavedra  on 27/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var photoVM = PhotosViewModel()
    @StateObject var networkReachability = NetworkReachability()
    
    let columns = [GridItem](repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        ScrollView {
            if networkReachability.reachable {
                LazyVGrid(columns: columns) {
                    ForEach(photoVM.photos, id: \.self) { photo in
                        PhotoView(photoData: photo)
                    }
                }
                .padding(.horizontal)
                .padding()
            } else {
                Text("Please connect to the Internet to see the photos")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }.frame(minWidth: 900, minHeight: 800)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
