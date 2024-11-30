//
//  PostCreateConfirmationView.swift
//  Sample_SwiftUI_Router
//
//  Created by ウルトラ深瀬 on 30/11/24.
//

import SwiftUI

struct PostCreateConfirmationView: View {
    var postNameText = "dammy"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Post Name")
                .font(.system(size: 20))
            
            Text(postNameText)
                .font(.system(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 60)
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Create")
            })
            .frame(maxWidth: .infinity)
            
            Spacer().frame(height: 60)
        }
        .padding(EdgeInsets(top: 32, leading: 16, bottom: 16, trailing: 16))
        .navigationTitle("Confirmation")
    }
}

#Preview {
    PostCreateConfirmationView()
}
