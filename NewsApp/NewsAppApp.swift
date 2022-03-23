//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Shawn Petros on 6/10/21.
//

import SwiftUI
import URLImage
import URLImageStore

@main
struct NewsAppApp: App {
    var body: some Scene {
        let urlImageService = URLImageService(fileStore: URLImageFileStore(),
                                            inMemoryStore: URLImageInMemoryStore())
        WindowGroup {
            HomeView()
                .environment(\.urlImageService, urlImageService)
        }
    }
}
