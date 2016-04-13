//: Playground - noun: a place where people can play

import UIKit

var num = 8

var arrays = Array<Array<Int>>()

if num % 2 != 0 { //奇数阶幻方
    
    for var i = 0; i < num; i++ { //初始化为0
        var tmpArray = Array<Int>()
        for var j = 0; j < num; j++ {
            tmpArray.append(0)
        }
        arrays.append(tmpArray)
    }
    
    var preI = 0
    var preJ = 0
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
else if num % 4 == 0 { //双偶数阶幻方
    
    for var i = 0; i < num; i++ { //初始化为0
        var tmpArray = Array<Int>()
        for var j = 0; j < num; j++ {
            tmpArray.append(i * num + j + 1)
        }
        arrays.append(tmpArray)
    }
    
    let totalCount = num * num + 1
    let divide = num / 4
    let divideArraysNum = divide * divide
    
    for var n = 0; n < divideArraysNum; n++ {
        var baseI = n / divide
        var baseJ = n % divide

        for var i = 0; i < 4; i++ {
            for var j = 0; j < 4; j++ {
                if ((i == j) || (i == 4 - j - 1)) {
                    arrays[baseI * 4 + i][baseJ * 4 + j] = totalCount - arrays[baseI * 4 + i][baseJ * 4 + j]
                }
            }
        }
    }
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



