//
//  ViewController.swift
//  midterm
//
//  Created by Fernie on 3/20/19.
//  Copyright © 2019 Poopnose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var answer : String = ""
    var piano = false
    var inch = false
    var card = false
    var red = false
    
    
    
    
    
    var board = "P I A N O * N * * * * C A R D * H * E * * * * D *"
    var boardarry : [String] = [""]
    var hints = [1 : "an instrument", 2 : "opposite of off"]
    
    var groups = [[CustomButton]]()
    
    var words = [CustomButton]()
    
    
    
    @IBOutlet weak var guess: UILabel!
    
    
    @IBOutlet weak var w1: CustomButton!
    
    @IBOutlet weak var w2: CustomButton!
    
    
    @IBOutlet weak var w3: CustomButton!
    
    @IBOutlet weak var w4: CustomButton!
    
    @IBOutlet weak var w5: CustomButton!
    
    
    @IBOutlet weak var w6: CustomButton!
    
    @IBOutlet weak var w7: CustomButton!
    
    @IBOutlet weak var w8: CustomButton!
    
    @IBOutlet weak var w9: CustomButton!
    
    
    @IBOutlet weak var w10: CustomButton!
    
    @IBOutlet weak var w11: CustomButton!
    
    @IBOutlet weak var w12: CustomButton!
    
    
    @IBOutlet weak var w13: CustomButton!
    
    
    @IBOutlet weak var a1: UIButton!
    
    @IBOutlet weak var a2: UIButton!
    
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var a4: UIButton!
    @IBOutlet weak var a5: UIButton!
    
    @IBOutlet var allbuttons: [CustomButton]!
    
    @objc func buttonClicked(sender: UIButton){
        
        print("word 1")
    }
    @objc func buttonClicked2(sender: UIButton){
        print("word 2")
    }
    @objc func buttonClicked3(sender: UIButton){
        print("word 3")
    }
    @objc func buttonClicked4(sender: UIButton){
        print("word 4")
    }
    @objc func buttonClicked5(sender: UIButton){
        print("word 5")
    }
    @objc func buttonClicked6(sender: UIButton){
        print("word 6")
    }
    

    
    
    func setvalues(){
        for temp in allbuttons{
            print(temp.currentTitle ?? "empty")
        }
    }
    
    func setvalues2(){
        groups.removeAll()
        words.removeAll()
        var i = 0
        for temp in allbuttons{
            temp.setTitle(boardarry[i], for: .normal)
            if boardarry[i] != "*"{
                temp.backgroundColor = UIColor.white
                temp.isOpaque = true
                words.append(temp)
            }
            else{
                temp.backgroundColor = UIColor.black
                temp.isEnabled = false
                temp.isOpaque = true
                temp.setTitleColor(UIColor.black, for: .normal)
                
                if(words.count != 0){
                    groups.append(words)
                    words.removeAll()
                }
                
            }
            
            i = i + 1
        }
        var hasharry = [#selector(self.buttonClicked(sender:)),#selector(self.buttonClicked2(sender:)),#selector(self.buttonClicked3(sender:)),#selector(self.buttonClicked4(sender:)),#selector(self.buttonClicked5(sender:)),#selector(self.buttonClicked6(sender:))]
        
        
        var number = 0
        for temp in groups{
            for tem in temp{
                tem.addTarget(self, action: hasharry[number%7], for: .touchUpInside)
                print(tem.currentTitle!)
                
            }
            number = number + 1
            print("\t")
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myArray : [String] = board.components(separatedBy: " ")
        boardarry = myArray
        print(boardarry)
        // Do any additional setup after loading the view, typically from a nib.
        setvalues2()
     
    }


    @IBAction func piano(_ sender: Any) {
        a1.setTitle("P", for: .normal)
        a2.setTitle("I", for: .normal)
        a3.setTitle("A", for: .normal)
        a4.setTitle("N", for: .normal)
        a5.setTitle("O", for: .normal)
        piano = true
        inch = false
        card = false
        red = false
        check()
    }
    
    @IBAction func inch(_ sender: Any) {
        a1.setTitle("I", for: .normal)
        a2.setTitle("N", for: .normal)
        a3.setTitle("C", for: .normal)
        a4.setTitle("H", for: .normal)
        a5.setTitle("", for: .normal)
        piano = false
        inch = true
        card = false
        red = false
        check()
    }
    
    @IBAction func card(_ sender: Any) {
        a1.setTitle("C", for: .normal)
        a2.setTitle("A", for: .normal)
        a3.setTitle("R", for: .normal)
        a4.setTitle("D", for: .normal)
        a5.setTitle("", for: .normal)
        piano = false
        inch = false
        card = true
        red = false
        check()
    }
    
    @IBAction func red(_ sender: Any) {
        a1.setTitle("R", for: .normal)
        a2.setTitle("E", for: .normal)
        a3.setTitle("D", for: .normal)
        a4.setTitle("", for: .normal)
        a5.setTitle("", for: .normal)
        piano = false
        inch = false
        card = false
        red = true
        check()
    }

    
    func check() {
        allw()
        if piano{
            w1.backgroundColor = UIColor.green
            w2.backgroundColor = UIColor.green
            w3.backgroundColor = UIColor.green
            w4.backgroundColor = UIColor.green
            w5.backgroundColor = UIColor.green
        }
        else if inch{
            w2.backgroundColor = UIColor.green
            w6.backgroundColor = UIColor.green
            w7.backgroundColor = UIColor.green
            w11.backgroundColor = UIColor.green
        }
        else if card{
            w7.backgroundColor = UIColor.green
            w8.backgroundColor = UIColor.green
            w9.backgroundColor = UIColor.green
            w10.backgroundColor = UIColor.green
        }
        else if red{
            w9.backgroundColor = UIColor.green
            w13.backgroundColor = UIColor.green
            w12.backgroundColor = UIColor.green
        }
    }
    func allw(){
        w1.backgroundColor = UIColor.white
        w2.backgroundColor = UIColor.white
        w3.backgroundColor = UIColor.white
        w4.backgroundColor = UIColor.white
        w5.backgroundColor = UIColor.white
        w6.backgroundColor = UIColor.white
        w7.backgroundColor = UIColor.white
        w8.backgroundColor = UIColor.white
        w9.backgroundColor = UIColor.white
        w10.backgroundColor = UIColor.white
        w11.backgroundColor = UIColor.white
        w12.backgroundColor = UIColor.white
        w13.backgroundColor = UIColor.white
    }
    
    
    @IBAction func b1(_ sender: Any) {
        answer += a1.currentTitle!
        guess.text = answer
    }
    
    @IBAction func b2(_ sender: Any) {
        answer += a2.currentTitle!
        guess.text = answer
    }
    @IBAction func b3(_ sender: Any) {
        answer += a3.currentTitle!
        guess.text = answer
    }
    @IBAction func b4(_ sender: Any) {
        answer += a4.currentTitle!
        guess.text = answer
    }
    @IBAction func b5(_ sender: Any) {
        answer += a5.currentTitle!
        guess.text = answer
    }
    
    
    @IBAction func checher2(_ sender: Any) {
        
        if piano && answer == "PIANO"{
            
            w1.backgroundColor = UIColor.yellow
            w2.backgroundColor = UIColor.yellow
            w3.backgroundColor = UIColor.yellow
            w4.backgroundColor = UIColor.yellow
            w5.backgroundColor = UIColor.yellow
            guess.text = "correct"
            answer = ""
        }
        else if inch && answer == "INCH"{
            w2.backgroundColor = UIColor.yellow
            w6.backgroundColor = UIColor.yellow
            w7.backgroundColor = UIColor.yellow
            w11.backgroundColor = UIColor.yellow
            guess.text = "correct"
            answer = ""
        }
        else if card && answer == "CARD"{
            w7.backgroundColor = UIColor.yellow
            w8.backgroundColor = UIColor.yellow
            w9.backgroundColor = UIColor.yellow
            w10.backgroundColor = UIColor.yellow
            guess.text = "correct"
            answer = ""
        }
        else if red && answer == "RED"{
            w9.backgroundColor = UIColor.yellow
            w13.backgroundColor = UIColor.yellow
            w12.backgroundColor = UIColor.yellow
            guess.text = "correct"
            answer = ""
        }
    
}
}
