//
//  ContentView.swift
//  TransitionExercise
//
//  Created by Константин Лопаткин on 11.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State var showLeft = false
    @State var showRight = false
    var body: some View {
        NavigationView {
            VStack(spacing: 26) {
                if showLeft {
                    someView(
                        label: "Left Transition",
                        color: .blue.opacity(0.25)
                    )
                    .transition(.leadingTransition)
                }
                if showRight {
                    someView(
                        label: "Right Transition",
                        color: .green.opacity(0.25)
                    )
                    .transition(.trailingTransition)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("LeftView") {
                        withAnimation {
                            showLeft.toggle()
                        }
                    }
                    .font(.title)
                    .buttonStyle(.bordered)
                    Button("RightView") {
                        withAnimation {
                            showRight.toggle()
                        }
                    }
                    .font(.title)
                    .buttonStyle(.bordered)
                }
            }
            .navigationTitle(Text("Trancision Exercise"))
        }
        
    }
    
    func someView(label: String, color: Color) -> some View {
        VStack {
            Text(label)
                .font(.title)
        }
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
    static var leadingTransition: AnyTransition {
        .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading))
    }
    static var trailingTransition: AnyTransition {
        .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing))
    }
}
