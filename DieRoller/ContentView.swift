import SwiftUI

struct ContentView: View {
    @State private var numberOfPipsL = 1
    @State private var numberOfPipsR = 1
    
    var body: some View {
            VStack {
                
                VStack {
                    HStack {
                        
                        diefaces(numberOfPips: numberOfPipsL)
                            .padding(0.5)
                        
                        diefaces(numberOfPips: numberOfPipsR)
                    }
                    HStack {
                        DieFacesNames(numberOfPips: numberOfPipsL)
                            .font(.title)
                        Text(" - ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        DieFacesNames(numberOfPips: numberOfPipsR)
                            .font(.title)
                    }
                    .padding()
                    
                }
                Spacer()
                Button("Roll") {
                    numberOfPipsL = Int.random(in: 1...6)
                    numberOfPipsR = Int.random(in: 1...6)
                }
                .frame(width: 200.0, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
            }
            .padding(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct diefaces: View {
    var numberOfPips: Int
    
    var body: some View {
        Image(systemName: "die.face.\(numberOfPips).fill")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
    }
}

struct DieFacesNames: View {
    var numberOfPips: Int
    
    var nameOfPips: String {
        switch numberOfPips {
        case 1: return "One"
        case 2: return "Two"
        case 3: return "Three"
        case 4: return "Four"
        case 5: return "Five"
        case 6: return "Six"
        default: return "Error"
        }
    }
    
    var body: some View {
        Text(nameOfPips)
    }
}
