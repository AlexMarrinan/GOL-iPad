//
//  Colony.swift
//  GOL iPad
//
//  Created by Alex Marrinan on 11/8/19.
//  Copyright © 2019 Alex Marrinan. All rights reserved.
//

import SwiftUI

struct Colony: CustomStringConvertible{
    var aliveCells: Set<Coordinate> = []
    private (set) var generationNumber = 0
    var size: Int
    init(_ size: Int){
        self.size = size
    }
    var description: String{
        var text = "Generation: \(generationNumber)\n"
        for row in 0...size-1{
            for col in 0...size-1{
                if isCellAlive(row, col){
                    text += " * "
                }else{
                    text += " _ "
                }
            }
            text += "\n"
        }
        return text
    }
    mutating func setCellsFroomCoors(_ data: [Coordinate]){
        clear(); aliveCells = Set(data)
    }
    mutating func changeCellState(_ row: Int, _ col: Int){
        if isCellAlive(row,col){
            setCellDead(row,col)
        }else{
            setCellAlive(row,col)
        }
    }
    mutating func clear(){
        aliveCells = []
    }
    mutating func setCellAlive(_ row: Int, _ col: Int){
        aliveCells.insert(Coordinate(row,col))
    }
    mutating func setCellDead(_ row: Int, _ col: Int){
        aliveCells.remove(Coordinate(row,col))
    }
    func isCellAlive(_ row: Int, _ col: Int)->Bool{
        return aliveCells.contains(Coordinate(row,col))
    }
    var numberLivingCells: Int{
        return aliveCells.count
    }
    var livingCells: [Coordinate]{
        return Array(aliveCells)
    }
    private func neighborsWrapping(_ row: Int, _ col: Int)->Set<Coordinate>{
        let surroundingCells = [(row-1,col-1), (row-1,col), (row-1,col+1), (row,col-1), (row,col+1), (row+1,col-1), (row+1,col), (row+1,col+1)]
        return Set(Coordinate.makeCoors(surroundingCells).map{ makeCoordinateWrapped( $0 )})
    }
    private func aliveNeighborsCountWrapping(_ row: Int, _ col: Int, set: Set<Coordinate>)->Int{
        let surroundingCells = [(row-1,col-1), (row-1,col), (row-1,col+1), (row,col-1), (row,col+1), (row+1,col-1), (row+1,col), (row+1,col+1)]
        let coors = Set(Coordinate.makeCoors(surroundingCells).map{ makeCoordinateWrapped( $0 )})
        return coors.filter { set.contains($0) }.count
    }
    private func makeCoordinateWrapped(_ c: Coordinate)->Coordinate{
        var newRow = c.row
        var newCol = c.col
        if c.row < 0 {
            newRow = size - 1
        }
        if c.row >= size{
            newRow = 0
        }
        if c.col < 0 {
            newCol = size - 1
        }
        if c.col >= size{
            newCol = 0
        }
        return Coordinate(newRow,newCol)
    }
    mutating func wrappingEvolve(){
        let cellsToCheck = Set(aliveCells.map{ neighborsWrapping($0.row, $0.col) }.flatMap{ $0 })
        let oldAliveCells = aliveCells
        for c in cellsToCheck{
            switch (aliveNeighborsCountWrapping(c.row, c.col, set: oldAliveCells)){
                case let a where a<2: setCellDead(c.row, c.col)
                case 3: setCellAlive(c.row,c.col)
                case let a where a>3: setCellDead(c.row, c.col)
            default: break
            }
        }
        generationNumber += 1
    }
}

