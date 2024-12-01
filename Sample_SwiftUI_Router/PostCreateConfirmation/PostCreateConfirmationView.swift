//
//  PostCreateConfirmationView.swift
//  Sample_SwiftUI_Router
//
//  Created by ウルトラ深瀬 on 30/11/24.
//

import SwiftUI

struct PostCreateConfirmationView: View {
    var postNameText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Post Name")
                .font(.system(size: 16))
            
            Text(postNameText)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 40)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Create")
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.tint)
                    .foregroundStyle(Color(.label))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            })
            
            Spacer().frame(height: 60)
        }
        .padding(EdgeInsets(top: 32, leading: 16, bottom: 16, trailing: 16))
        .navigationTitle("Confirmation")
    }
}

#Preview {
    PostCreateConfirmationView(postNameText: "Post1")
}
