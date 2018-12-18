//
//  ViewController.swift
//  Concentrate
//
//  Created by apple on 2018/11/22.
//  Copyright © 2018年 huuuuu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //big green arrow,send any message i want to game
    //for Concentration is a class,as long as all of its var has initialized,concenration got a free init.
    lazy var game = Concentrate(numberOfPairsOfCards: (cardButtons.count + 1) / 2)  //The number of CARDS is lazy and is initialized only when lazy is used
    //record the counts of the flip
    var  flipCount = 0 {
        didSet{ //property observe:to keep the UI in sync with the instance variables of our class
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }//We haven't initialized init yet
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    //set array of button
    @IBOutlet var cardButtons: [UIButton]!
    //Click the card
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        //the type of index is optional,when uwrapping,if the returning value is nil,the code will crash,So we let
        if let cardNumber = cardButtons.index(of: sender) {
//            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("chosen card was not in cardButtons")
        }
       // print("cardNumber = \(cardNumber)")
        
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    
    }
    //the content of every button
    var emojiChoices = ["👻","🎃","👿","🦇","🍭","🎭","😱"]
    
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0 { //表情用完后不能再移除
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count))) // UInt32->才能索引数组
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex) //移除数组的元素并返回 避免重复使用图案
            }
        }
//        if emoji[card.identifier] != nil{
//            return emoji[card.identifier]!
//        }else {
//            return "?"
//        }
        return emoji[card.identifier] ?? "?"
        
    }
    
//    func flipCard(withEmoji emoji: String, on button: UIButton) {
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
//        }else {
//            button.setTitle(emoji, for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

