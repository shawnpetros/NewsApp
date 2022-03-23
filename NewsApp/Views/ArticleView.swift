//
//  ArticleView.swift
//  NewsApp
//
//  Created by Shawn Petros on 6/10/21.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article
    
    static let articleDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    var body: some View {
        HStack {
            if let imgUrl = article.image,
               let url = URL(string: imgUrl) {
                
                URLImage(url) {
                    // This view is displayed before download starts
                    PlaceholderImageView()
                } inProgress: { progress in
                    // Display progress
                    PlaceholderImageView()
                } failure: { error, retry in
                    // Display error and retry button
                    PlaceholderImageView()
                } content: { image in
                    // Downloaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                
            } else {
                PlaceholderImageView()
            }
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                HStack {
                    Text(article.source ?? "N/A")
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Spacer()
                    Text("Posted: \(article.date ?? Date(), formatter: Self.articleDateFormat)")
                            .foregroundColor(.gray)
                            .font(.footnote)
                            .padding(.horizontal, 7)
                }
            })
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
