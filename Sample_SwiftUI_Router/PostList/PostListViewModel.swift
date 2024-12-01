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
    
    let transition = PassthroughSubject<Transition, Never>()
    
    func createPostButtonTapped() {
        transition.send(.postCreate)
    }
}
