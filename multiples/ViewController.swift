//
//  ViewController.swift
//  multiples
//
//  Created by mobilestudio on 3/13/16.
//  Copyright © 2016 mobilestudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Variables
    var multiple:Int = 0
    var answer:Int = 0
    var prevAnswer:Int = 0
    let limit:Int = 100
    
    //Outlets
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var multipleEntryField: UITextField!
    @IBOutlet weak var multipleDisplay: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    //Functions
    
    func resetGame() {
        titleImage.hidden = false
        multipleEntryField.hidden = false
        playButton.hidden = false
        
        addButton.hidden = true
        multipleDisplay.hidden = true
        
        multiple = 0
        answer = 0
        prevAnswer = 0
    }
    
    @IBAction func startGame(sender:UIButton!) {
        
        if multipleEntryField.text != nil && multipleEntryField.text != "" {
            
            titleImage.hidden = true
            multipleEntryField.hidden = true
            playButton.hidden = true
            
            addButton.hidden = false
            multipleDisplay.hidden = false
            
            multiple = Int(multipleEntryField.text!)!
            updateLabel(0, 0)
        }
        else {
            multipleEntryField.placeholder = "Please enter a number"
        }
       
    }
    
    @IBAction func addMultiple(sender:UIButton!) {
        if (answer + multiple) >= limit {
            resetGame()
        }
        else {
            prevAnswer = answer
            answer = prevAnswer + multiple
            updateLabel(prevAnswer, answer)
        }
        
    }
    
    func updateLabel(oldAnswer:Int, _ newAnswer:Int) {
        multipleDisplay.text = "\(oldAnswer) + \(multiple) = \(newAnswer)"
        
    }


}

