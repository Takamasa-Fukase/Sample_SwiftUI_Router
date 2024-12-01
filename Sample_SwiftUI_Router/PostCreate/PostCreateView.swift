//
//  PostCreateView.swift
//  Sample_SwiftUI_Router
//
//  Created by ウルトラ深瀬 on 30/11/24.
//

import SwiftUI

struct PostCreateView: View {
    @State var postNameText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Post Name", text: $postNameText)
                    .textFieldStyle(.plain)
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.secondary, lineWidth: 0.5)
                    }
                
                Spacer()
                
                NavigationLink {
                    PostCreateConfirmationView(postNameText: postNameText)
                    
                } label: {
                    Text("to Confirmation")
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(.tint)
                        .foregroundStyle(Color(.label))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Spacer().frame(height: 60)
            }
            .padding(EdgeInsets(top: 32, leading: 16, bottom: 16, trailing: 16))
            .navigationTitle("Post Create")
        }
    }
}

#Preview {
    PostCreateView()
}
