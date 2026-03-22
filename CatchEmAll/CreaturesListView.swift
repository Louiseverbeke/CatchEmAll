//
//  CreaturesListView.swift
//  CatchEmAll
//
//  Created by Louise Verbeke on 22/03/2026.
//

import SwiftUI

struct CreaturesListView: View {
    var creatures = ["Pickachu", "Squirtle", "Charzard", "Snorlax"]
    
    var body: some View {
        NavigationStack {
            List(creatures, id: \.self) { creature in
                Text(creature)
                    .font(.title2)
        }
            .listStyle(.plain)
            .navigationTitle("Pokemon")
        }
    }
}

#Preview {
    CreaturesListView()
}
