//
//  PostCreateView.swift
//  Sample_SwiftUI_Router
//
//  Created by ウルトラ深瀬 on 30/11/24.
//

import SwiftUI

struct PostCreateView: View {
    @State var postNameText = ""
    private let rect = RoundedRectangle.rect(cornerRadius: 6)
    
    var body: some View {
        VStack {
            TextField("Post Name", text: $postNameText)
                .textFieldStyle(.plain)
                .frame(height: 40)
                .padding(6)
                .background(.background, in: rect)
                .overlay(rect.stroke(.secondary, lineWidth: 0.5))
                .padding(EdgeInsets(top: 32, leading: 16, bottom: 16, trailing: 16))
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("to Confirmation")
            })
            
            Spacer().frame(height: 60)
        }
        .navigationTitle("Post Create")
    }
}

#Preview {
    PostCreateView()
}
