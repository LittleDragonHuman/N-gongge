//: Playground - noun: a place where people can play

import UIKit

var num = 10

//初始化数组
func initArrays(inout array: Array<Array<Int>>, numOfColumn: Int)
{
    for var i = 0; i < numOfColumn; i++ { //初始化为0
        var tmpArray = Array<Int>()
        for var j = 0; j < numOfColumn; j++ {
            tmpArray.append(0)
        }
        array.append(tmpArray)
    }
}

//奇数阶幻方，返回值可不用，增加返回值是因为单偶数阶幻方使用
func fillOddArray(inout array: Array<Array<Int>>, beginNum: Int, column: Int) -> Int
{
    initArrays(&array, numOfColumn: column)
    var preI = 0
    var preJ = 0
    array[0][column / 2] = beginNum + 1;
    preI = 0
    preJ = column / 2
    for var i = 2; i <= column * column; i++ {
        var currentI = (preI - 1) < 0 ? (column - 1) : (preI - 1)
        var currentJ = (preJ + 1) >= column ? 0 : (preJ + 1)
        if array[currentI][currentJ] > 0 {
            currentI = preI + 1
            currentJ = preJ
        }
        array[currentI][currentJ] = beginNum + i
        preI = currentI
        preJ = currentJ
    }
    return (beginNum + column * column)
}

//打印结果
func printArray(var array: Array<Array<Int>>, column: Int) {
    for var i = 0; i < column; i++ {
        var tmpStr = ""
        for var j = 0; j < column; j++ {
            tmpStr += "\(array[i][j])"
            if j != column - 1 {
                tmpStr += ","
            }
        }
        print("\n\(tmpStr)")
    }
}


//奇数阶幻方:将1放置在第一行中间列，按照斜上45度依次放值(上一行(到头从0)，上一列(到头从0))，若遇到已有值的情况，在放在当前值的下方。

if num % 2 != 0 {
    var arrays = Array<Array<Int>>()
    fillOddArray(&arrays, beginNum: 0, column: num)
    printArray(arrays, column: num)
}
//双偶数阶幻方 num = 4 * n：将幻方分成多个4 * 4 的小方阵，针对每一个小方阵，修改双对角线的值，使其成为互补数(就是在 n 阶幻方中，如果两个数的和等于幻方中最大的数与 1 的和(即 n×n＋1)我们称它们为一对互补数。如在三阶幻方中，每一对和为 10 的数，是一对互补数 ；在四阶幻方中，每一对和为 17 的数，是一对互补数.)
else if num % 4 == 0 {
    
    var arrays = Array<Array<Int>>()
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
    printArray(arrays, column: num)
}
//单偶数阶幻方 num = 4 * k + m：将幻方划分为4个小方阵，分别为A,B,C,D,按照A,D,B,C的顺序，填充小方阵(填充规则同奇数阶幻方)，针对A,C，取中间行中间列，从左到右标出k个数字，其他行从最左开始标出k个数字，然后将A和C标出的数字按照对应的位置进行交换；针对B,D，取中间列，从右向左标出k-1列，B的k-1列与D的k-1列进行互换
else {
    let k = num / 4
    let numOfColumn = num / 2
    var baseNum = 0
    var arrayA = Array<Array<Int>>()
    baseNum = fillOddArray(&arrayA, beginNum: baseNum, column: numOfColumn)
    
    var arrayD = Array<Array<Int>>()
    baseNum = fillOddArray(&arrayD, beginNum: baseNum, column: numOfColumn)
    
    var arrayB = Array<Array<Int>>()
    baseNum = fillOddArray(&arrayB, beginNum: baseNum, column: numOfColumn)
    
    var arrayC = Array<Array<Int>>()
    baseNum = fillOddArray(&arrayC, beginNum: baseNum, column: numOfColumn)
    
    let middleI = numOfColumn / 2
    var middleJ = numOfColumn / 2
    
    for var i = 0; i < numOfColumn; i++ {
        for var j = 0; j < k; j++ {
            if (i == middleI) {
                var tmp = arrayA[middleI][middleJ]
                arrayA[middleI][middleJ] = arrayC[middleI][middleJ]
                arrayC[middleI][middleJ] = tmp
                middleJ++
            }
            else {
                var tmp = arrayA[i][j]
                arrayA[i][j] = arrayC[i][j]
                arrayC[i][j] = tmp
            }
        }
    }
    
    middleJ = numOfColumn / 2
    
    for var j = 0; j < (k - 1); j++ {
        for var i = 0; i < numOfColumn; i++ {
            var tmp = arrayB[i][middleJ]
            arrayB[i][middleJ] = arrayD[i][middleJ]
            arrayD[i][middleJ] = tmp
        }
        middleJ--
    }
    
    var arrays = Array<Array<Int>>()
    initArrays(&arrays, numOfColumn: num)
    
    for var i = 0; i < num; i++ {
        if (i < num / 2) {
            arrays[i] = arrayA[i] + arrayB[i]
        }
        else {
            arrays[i] = arrayC[i - num / 2] + arrayD[i - num/2]
        }
    }
    printArray(arrays, column: num)
}




