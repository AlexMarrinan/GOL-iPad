//
//  ContentView.swift
//  GOL iPad
//
//  Created by Alex Marrinan on 11/8/19.
//  Copyright © 2019 Alex Marrinan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //prints colony test
    @State var colony = Colony(10)
    
    var body: some View {
        VStack{
            Text("Generatio: \(colony.generationNumber)")
            ForEach(0..<colony.size, id: \.self){ row in
                HStack{
                    ForEach(0..<self.colony.size, id: \.self){ col in
                        Button(action: {
                            self.colony.changeCellState(row, col)
                        }) {
                            if self.colony.isCellAlive(row, col){
                                Rectangle()
                                    .fill(Color.yellow)
                                    .frame(width: 20, height: 20)
                            }else{
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                }
            }
            Button(action: {
                self.colony.wrappingEvolve()
            }) {
                Text("Evolve")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
