//
//  PostListViewModel.swift
//  Sample_SwiftUI_Router
//
//  Created by ウルトラ深瀬 on 1/12/24.
//

import Foundation
import Combine

final class PostListViewModel: ObservableObject {
    enum Transition {
        case postList
        case postCreate
    }
    
    @Published var postList: [Post] = []
    let transition = PassthroughSubject<Transition, Never>()
    
    func viewAppeared() {
        postList = Array(0..<5).map({ index in
               return .init(id: index, title: "投稿\(index)", description: "投稿してみました〜")
        })
    }
    
    func createPostButtonTapped() {
        transition.send(.postCreate)
    }
}
