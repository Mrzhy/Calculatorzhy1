//
//  ViewController.swift
//  Calculatorzhy
//
//  Created by Mr.Zhao on 16/3/21.
//  Copyright © 2016年 Mr.Zhao. All rights reserved.
//
/*
计算器:Calculator
显示缓存:Displaycache
缓存:cache
求值:evaluation
点计数:Pointcount
点按:click
数字:number
前一个数字:Lastnumber
临时:temporary
结果:result
屏幕：screen
小数点：point
加号：plussign
减号：minussign
乘号：multiplicationsign
除号：divisionsign
百分号：percent
重置当前：Resetcurrent
重置所有：Resetall
等号：equalsign
*/

import UIKit

class ViewController: UIViewController {
    var Calculator = calculation()
    var Displaycache = ""
    var cache = 0.0
    var cache2:Double?

    @IBOutlet weak var screen: UITextField!
    
    @IBAction func number9(sender: AnyObject) {
        click("9")
    }
    @IBAction func number8(sender: AnyObject) {
        click("8")
    }
    @IBAction func number7(sender: AnyObject) {
        click("7")
    }
    @IBAction func number6(sender: AnyObject) {
        click("6")
    }
    @IBAction func number5(sender: AnyObject) {
        click("5")
    }
    @IBAction func number4(sender: AnyObject) {
        click("4")
    }
    @IBAction func number3(sender: AnyObject) {
        click("3")
    }
    @IBAction func number2(sender: AnyObject) {
        click("2")
    }
    @IBAction func number1(sender: AnyObject) {
        click("1")
    }
    @IBAction func number0(sender: AnyObject) {
        if screen.text == "0"
        {
            screen.text = screen.text! + ""
        }
        else {
            click("0")
        }
    }
    @IBAction func point(sender: AnyObject) {
        click(".")
    }
    @IBAction func plussign(sender: AnyObject) {
        if Calculator.Readthecurrentalgorithm() != .addition {//如果点击加之前是别的算法就执行这里的代码块
            evaluation()
            Calculator.Setcurrentalgorithm(.addition)
            return //用return语句让函数提前出栈
        }
        Calculator.Setcurrentalgorithm(.addition)
        evaluation()
    }
    @IBAction func minussign(sender: AnyObject) {
        if Calculator.Readthecurrentalgorithm() != .subtraction {
            evaluation()
            Calculator.Setcurrentalgorithm(.subtraction)
            return
        }
        Calculator.Setcurrentalgorithm(.subtraction)
        evaluation()
    }
    @IBAction func multiplicationsign(sender: AnyObject) {
        if Calculator.Readthecurrentalgorithm() != .multiplication {
            evaluation()
            Calculator.Setcurrentalgorithm(.multiplication)
            return
        }
        Calculator.Setcurrentalgorithm(.multiplication)
        evaluation()
    }
    @IBAction func divisionsign(sender: AnyObject) {
        if Calculator.Readthecurrentalgorithm() != .division {
            evaluation()
            Calculator.Setcurrentalgorithm(.division)
            return
        }
        Calculator.Setcurrentalgorithm(.division)
        evaluation()
    }
    @IBAction func percent(sender: AnyObject) {
        if Calculator.Readthecurrentalgorithm() != .Percent {
            evaluation()
            Calculator.Setcurrentalgorithm(.Percent)
            return
        }
        Calculator.Setcurrentalgorithm(.Percent)
        evaluation()
    }
    @IBAction func Resetcurrent(sender: AnyObject) {
        Pointcount = 0
        Displaycache = ""
        screen.text = ""
    }
    @IBAction func Resetall(sender: AnyObject) {
        Pointcount = 0 //同理，清空重置什么的，都要加上这个
        Displaycache = ""
        cache = 0.0
        cache2 = nil
        Calculator.Setcurrentalgorithm(.Nochoice)
        screen.text = ""
    }
    @IBAction func equalsign(sender: AnyObject) {
        evaluation()
    }
    
    var Pointcount = 0;
    func click(number:String) {
        if number == "." { //如果是小数点，就增加计数
            Pointcount++
        }
        if number == "." && Pointcount > 1 { //如果已经输入了一个小数点，还要输入小数点就略过后面的代码，也就不会计入缓存
            return //函数遇到return就会出栈了
        }
        Displaycache += number
        screen.text = Displaycache
    }
    
    func evaluation() {
        Pointcount = 0 //这里我们清空统计，因为你按了等于不是吗？这样就又可以输入小数点了
        if !Displaycache.isEmpty {
            let temporary = Displaycache as NSString
            cache = temporary.doubleValue
            Displaycache = ""
        }
        let temporary = cache
        var result = ""
        
        if  let Lastnumber = cache2 {
        
            result = Calculator.Resultseeking(Operationnumber: Lastnumber, Operandoperand: temporary)
            screen.text = result
            let temporary2 = result as NSString
            cache2 = temporary2.doubleValue
            
        } else {
            cache2 = cache
            cache = 0.0
        }
    }
}

