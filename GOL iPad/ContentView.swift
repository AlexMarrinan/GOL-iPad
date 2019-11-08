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
    var colony = Colony("Test",20)
    var body: some View {
        Text(colony.description)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
