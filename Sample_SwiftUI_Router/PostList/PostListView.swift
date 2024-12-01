//
//  PostListView.swift
//  Sample_SwiftUI_Router
//
//  Created by ウルトラ深瀬 on 30/11/24.
//

import SwiftUI

final class PostListModalPresentationState: ObservableObject {
    @Published var isPresentedPostCreateView = false
}

struct PostListView<ViewModel: PostListViewModelInterface>: View {
    @StateObject private var viewModel: ViewModel
    @ObservedObject private var modalPresentationState = PostListModalPresentationState()
    
    init(
        viewModel: ViewModel
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                ZStack(alignment: .center, content: {
                    ScrollView {
                        ForEach(viewModel.postList) { post in
                            Text(post.title)
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(Color(.secondarySystemBackground))
                        }
                    }
                    
                    VStack {
                        Spacer()
                        Button(action: {
                            viewModel.createPostButtonTapped()
                            
                        }, label: {
                            Text("+ Create Post")
                                .font(.system(size: 20))
                                .foregroundStyle(Color(.label))
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(.tint)
                        })
                    }
                })
            }
            .navigationTitle("PostList")
        }
        .sheet(
            isPresented: $modalPresentationState.isPresentedPostCreateView,
            onDismiss: {
                
            },
            content: {
                PostCreateView()
                    .environmentObject(modalPresentationState)
            }
        )
        .onAppear {
            viewModel.viewAppeared()
        }
        .onReceive(viewModel.transition) { transition in
            switch transition {
            case .postList:
                break
            case .postCreate:
                // MARK: 投稿作成画面をモーダル表示
                modalPresentationState.isPresentedPostCreateView = true
            }
        }
    }
}

#Preview {
    PostListView(viewModel: PostListViewModel())
}
