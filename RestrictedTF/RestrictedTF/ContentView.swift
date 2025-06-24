//
//  ContentView.swift
//  RestrictedTF
//
//  Created by Yung Hak Lee on 6/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                RestrictedTextField(hint: "Y_H Lee", characters: characters, value: $username) { textfield, errorMessage in
                    ZStack(alignment: .bottomLeading) {
                        let isEmpty = errorMessage.isEmpty
                        
                        textfield
                            .padding(.horizontal, 15)
                            .padding(.vertical, 12)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.gray.opacity(0.2))
                            }
                        
                        if !isEmpty {
                            Text("Username contains invalid \(errorMessage) character")
                                .font(.caption2)
                                .foregroundStyle(.gray)
                                .offset(y: 25)
                                .transition(.blurReplace)
                        }
                    }
                    .animation(.smooth, value: errorMessage)
                }
            }
            .padding(15)
            .navigationTitle("Restricted Text Field")
        }
    }
    
    var characters: CharacterSet {
        var chars = CharacterSet.letters.inverted
        chars.remove("_")
        return chars
    }
}

#Preview {
    ContentView()
}
