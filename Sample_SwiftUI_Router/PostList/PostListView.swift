//
//  PostListView.swift
//  Sample_SwiftUI_Router
//
//  Created by ウルトラ深瀬 on 30/11/24.
//

import SwiftUI

struct PostListView<ViewModel: PostListViewModelInterface>: View {
    @StateObject private var viewModel: ViewModel
    @ObservedObject private var postCreateNavigationState = PostCreateNavigationState()
    
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
            isPresented: $postCreateNavigationState.isPresented,
            onDismiss: {
                
            },
            content: {
                PostCreateView()
                    .environmentObject(postCreateNavigationState)
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
                postCreateNavigationState.present()
            }
        }
    }
}

#Preview {
    PostListView(viewModel: PostListViewModel())
}
