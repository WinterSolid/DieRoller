//
//  DieRollerApp.swift
//  DieRoller
//
//  Created by Zakee Tanksley on 8/1/24.
//

//
//  DieRollerApp.swift
//  DieRoller
//
//  Created by Zakee Tanksley on 8/1/24.
//

import SwiftUI

@main
struct DiceRollerApp: App {
    @State private var isActive = false
    
    var body: some Scene {
        WindowGroup {
            if isActive {
                DieRollerView() // Transition to the main Dice Roller view
            } else {
                LaunchScreenView()
                    .onAppear {
                        // Add a delay before transitioning to the main content
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isActive = true
                            }
                        }
                    }
            }
        }
    }
}

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Image("dice")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundColor(.white)
            Text("Dice Roller")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

// Preview for the LaunchScreenView
struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
