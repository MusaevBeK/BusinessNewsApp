//
//  NewsModel.swift
//  SomeAppForGitHub
//
//  Created by user on 15/5/22.
//

import Foundation

// MARK: - News
struct NewsModel: Decodable {

    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Decodable {

    let title: String?
    let description: String?
    let urlToImage: String?
    let content: String?

}

//import Foundation
//
//// MARK: - NewsModel
//struct NewsModel: Codable {
//    let status: String?
//    let totalResults: Int?
//    let articles: [Article]?
//}
//
//// MARK: - Article
//struct Article: Codable {
//    let source: Source?
//    let author: String?
//    let title: String?
//    let articleDescription: String?
//    let url: String?
//    let urlToImage: String?
//    let publishedAt: Int?
//    let content: String?
//
//    enum CodingKeys: String, CodingKey {
//        case source, author, title
//        case articleDescription = "description"
//        case url, urlToImage, publishedAt, content
//    }
//}
//
//// MARK: - Source
//struct Source: Codable {
//    let id: String?
//    let name: String?
//}
