//
//  ContentView.swift
//  Sample_SwiftUI_Router
//
//  Created by ウルトラ深瀬 on 30/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PostListView(viewModel: PostListViewModel())
            .environmentObject(PostListModalPresentationState())
    }
}

#Preview {
    ContentView()
}
