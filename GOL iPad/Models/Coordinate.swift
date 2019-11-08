//
//  Coordinate.swift
//  GOL iPad
//
//  Created by Alex Marrinan on 11/8/19.
//  Copyright © 2019 Alex Marrinan. All rights reserved.
//
import Foundation

struct Coordinate: CustomStringConvertible, Hashable{
    let row: Int
    let col: Int
    var description: String{
        return "(\(row), \(col))"
    }
    init(_ row: Int, _ col: Int){
        self.row = row
        self.col = col
    }
    static func makeCoors(_ data: [(row: Int, col: Int)])->[Coordinate]{
        return data.map{ Coordinate($0, $1) }
    }
}

