//
//  ResultState.swift
//  NewsApp
//
//  Created by Shawn Petros on 6/10/21.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
