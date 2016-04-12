//: Playground - noun: a place where people can play

import UIKit

var num = 5

var arrays = Array<Array<Int>>()
var numbers = Array<Int>()
var preI = 0
var preJ = 0

for var i = 0; i < num; i++ {
    var tmpArray = Array<Int>()
    for var j = 0; j < num; j++ {
        tmpArray.append(0)
    }
    arrays.append(tmpArray)
}

if num % 2 != 0 {
    arrays[0][num / 2] = 1;
    preI = 0
    preJ = num / 2
    for var i = 2; i <= num * num; i++ {
        var currentI = (preI - 1) < 0 ? (num - 1) : (preI - 1)
        var currentJ = (preJ + 1) >= num ? 0 : (preJ + 1)
        if arrays[currentI][currentJ] > 0 {
            currentI = preI + 1
            currentJ = preJ
        }
        arrays[currentI][currentJ] = i
        preI = currentI
        preJ = currentJ
    }
}
else {
    
}


for var i = 0; i < num; i++ {
    var tmpStr = ""
    for var j = 0; j < num; j++ {
        tmpStr += "\(arrays[i][j])"
        if j != num - 1 {
            tmpStr += ","
        }
    }
    print("\n\(tmpStr)")
}



