//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Shawn Petros on 6/10/21.
//

import Foundation

// - Welcome
struct NewsResponse: Codable {
    let articles: [Article]
}

// - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source: String?
    let title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(author: "Brian Stelter and Oliver Darcy, CNN",
              url: "https://www.cnn.com/2021/06/10/media/jeffrey-toobin-returns-cnn/index.html",
              source: "CNN",
              title: "Jeffrey Toobin is back at CNN eight months after exposing himself on Zoom - CNN ",
              articleDescription: "Jeffrey Toobin returned to CNN as the network's chief legal analyst on Thursday, eight months after he exposed himself during a Zoom call with colleagues at The New Yorker.",
              image: "https://cdn.cnn.com/cnnnext/dam/assets/210610144129-jeffrey-toobin-file-restricted-super-tease.jpg",
              date: ISO8601DateFormatter().date(from: "2021-06-10T19:53:00Z"))
    }
}
