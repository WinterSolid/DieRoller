import SwiftUI

struct DieRollerView: View {
    @State private var numberOfPipsL = 1
    @State private var numberOfPipsR = 1
    
    var body: some View {
            VStack {
                    HStack {
                        
                        diefaces(numberOfPips: numberOfPipsL)
                            .padding(0.5)
                        
                        diefaces(numberOfPips: numberOfPipsR)
                    }
                    HStack {
                        DieFacesNames(numberOfPips: numberOfPipsL)
                            .font(.largeTitle)
                        Text("  -  ")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.red)
                        DieFacesNames(numberOfPips: numberOfPipsR)
                            .font(.largeTitle)
                    }.foregroundColor(.white)
                    .padding()
                    
                    .padding()
                Button("Roll") {
                    numberOfPipsL = Int.random(in: 1...6)
                    numberOfPipsR = Int.random(in: 1...6)
                }.font(.largeTitle)
                .frame(width: 250.0, height: 50)
                .background(.red)
                .foregroundColor(.white)
                .cornerRadius(15)
            }
            .padding(50).background(.black).scaledToFill()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DieRollerView()
            
    }
}

struct diefaces: View {
    var numberOfPips: Int
    
    var body: some View {
        Image(systemName: "die.face.\(numberOfPips).fill")
            .resizable()
            .frame(width: 150, height: 150)
            .foregroundColor(.white)
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
