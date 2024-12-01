//
//  PostListViewModel.swift
//  Sample_SwiftUI_Router
//
//  Created by ウルトラ深瀬 on 1/12/24.
//

import Foundation
import Combine

enum PostListTransition {
    case postList
    case postCreate
}

protocol PostListViewModelInterface: ObservableObject {
    var postList: [Post] { get set }
    var transition: PassthroughSubject<PostListTransition, Never> { get }
    func viewAppeared()
    func createPostButtonTapped()
}

final class PostListViewModel {
    @Published var postList: [Post] = []
    let transition = PassthroughSubject<PostListTransition, Never>()
}

extension PostListViewModel: PostListViewModelInterface {
    func viewAppeared() {
        postList = Array(0..<5).map({ index in
               return .init(id: index, title: "投稿\(index)", description: "投稿してみました〜")
        })
    }
    
    func createPostButtonTapped() {
        transition.send(.postCreate)
    }
}
