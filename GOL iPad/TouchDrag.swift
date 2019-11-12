//
//  TouchDrag.swift
//  GOL iPad
//
//  Created by Alex Marrinan on 11/10/19.
//  Copyright © 2019 Alex Marrinan. All rights reserved.
//

import SwiftUI
import Foundation

struct TouchDrag: View {
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(Color.red)
            .offset(x: self.currentPosition.width, y: self.currentPosition.height)
        .gesture(DragGesture()
            .onChanged{ value in
                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
            }
        .onEnded{ value in
            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
            print(self.newPosition.width)
            print(self.newPosition.height)
            print(" ")
            self.newPosition = self.currentPosition
            
            }
        )
    }
}

struct TouchDrag_Previews: PreviewProvider {
    static var previews: some View {
        TouchDrag()
    }
}

