//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by yaelahbro on 05/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Germany","France","Italy","Indonesia"].shuffled()
    @State var acak = Int.random(in: 0...2)
    @State var score = 0
    
    @State var showingScore = false
    @State var scoreTitle = ""
    @State var message = ""
    
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:30){
                VStack{
                    Text("Tap The Flag..")
                        .foregroundColor(.white)
                    Text(countries[acak])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.ngejawab(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }
                
                Text("Score : \(score)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text(message), dismissButton: .default(Text("Continue")) {
                    self.resetgame()
                })
            }
        }
    }
    
    func ngejawab(_ number:Int){
        if(number == acak) {
            scoreTitle = "Correct"
            message = "Congratulation !"
            score += 1
        } else {
            scoreTitle = "Wrong"
            message = "Wrong!, That the flag of \(countries[number])"
            score -= 1
        }
        
        showingScore = true
        
        }
    
    func resetgame() {
        countries.shuffle()
        acak = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
