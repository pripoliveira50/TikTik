//
//  EmptyStateView.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//

import SwiftUI

struct EmptyStateView: View {
    
    // MARK: - Properties
    
    @State private var isAnimating = false
    private let secondaryAccentColor = Color("SecondaryAccentColor")
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                titleText
                descriptionText
                addTaskButton
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: startAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - Private Views
    
    private var titleText: some View {
        Text("No tasks yet!")
            .font(.title)
            .fontWeight(.semibold)
    }
    
    private var descriptionText: some View {
        Text("Ready to be productive? Tap the button below to add your first task and start organizing your day!")
            .padding(.bottom, 10)
    }
    
    private var addTaskButton: some View {
        NavigationLink(destination: TaskAddView()) {
            Text("Add First Task ✨")
                .foregroundStyle(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(isAnimating ? secondaryAccentColor : .accentColor)
                .cornerRadius(10)
        }
        .padding(.horizontal, isAnimating ? 30 : 50)
        .shadow(
            color: isAnimating ? secondaryAccentColor.opacity(0.7) : .accentColor.opacity(0.7),
            radius: isAnimating ? 30 : 10,
            x: 0,
            y: isAnimating ? 50 : 30
        )
        .scaleEffect(isAnimating ? 1.1 : 1.0)
        .offset(y: isAnimating ? -7 : 0)
    }
    
    // MARK: - Private Methods
    
    private func startAnimation() {
        guard !isAnimating else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                isAnimating.toggle()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        EmptyStateView()
            .navigationTitle("Tasks")
    }
}
