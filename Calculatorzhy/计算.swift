//
//  计算.swift
//  Calculatorzhy
//
//  Created by Mr.Zhao on 16/3/28.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//
/*
calculation：计算
Currentalgorithm:当前算法
algorithm：算法
Nochoice：未选择
Setcurrentalgorithm：设置当前算法
temporary：临时
Readthecurrentalgorithm：读取当前算法
addition：加法
subtraction：减法
multiplication：乘法
division：除法
Percent：百分号
Resultseeking：求结果
Operationnumber：操作数
Operandoperand：被操作数
revert：返回
*/

import Foundation

struct calculation {
    private var Currentalgorithm:algorithm = .Nochoice
    
    mutating func Setcurrentalgorithm(temporary:algorithm) {
        Currentalgorithm = temporary
    }
    
    func Readthecurrentalgorithm() -> algorithm {
        return Currentalgorithm
    }
    
    enum algorithm {
        case addition
        case subtraction
        case multiplication
        case division
        case Percent
        case Nochoice
    }
    
    func Resultseeking(Operationnumber Operationnumber:Double, Operandoperand:Double) ->String {
        var revert = ""
        switch Currentalgorithm {
        case .addition:
            revert = "\(Operationnumber + Operandoperand)"
        case .subtraction:
            revert = "\(Operationnumber - Operandoperand)"
        case .multiplication:
            revert = "\(Operationnumber * Operandoperand)"
        case .division where Operandoperand != 0 :
            revert = "\(Operationnumber / Operandoperand)"
        case .Percent:
            revert = "\(Operationnumber / 100)"
        case .Nochoice:
            revert = "错误：未选择算法"
        default:
            revert = "0 不能做被除数！"
            
        }
        return revert
    }
}