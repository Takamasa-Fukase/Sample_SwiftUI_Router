//
//  PostListView.swift
//  Sample_SwiftUI_Router
//
//  Created by ウルトラ深瀬 on 30/11/24.
//

import SwiftUI

struct PostListView: View {
    let postList: [String] = [
        "Post1",
        "Post2",
        "Post3"
    ]
    
    @State var isPresentedPostCreateView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                ZStack(alignment: .center, content: {
                    ScrollView {
                        ForEach(postList, id: \.self) { post in
                            Text(post)
                                .frame(maxWidth: .infinity)
                                .frame(height: 60)
                                .background(Color(.secondarySystemBackground))
                        }
                    }
                    
                    VStack {
                        Spacer()
                        Button(action: {
                            // MARK: 投稿作成画面をモーダル表示
                            isPresentedPostCreateView = true
                            
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
            isPresented: $isPresentedPostCreateView,
            onDismiss: {
                
            },
            content: {
                PostCreateView()
            }
        )
    }
}

#Preview {
    PostListView()
}
