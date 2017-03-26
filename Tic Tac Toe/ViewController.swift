//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Rishi Pochiraju on 2/15/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    
    var activePlayer = 1
    
    var isGameActive = true
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var state = false
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    var counter = 0
    
    @IBAction func playAgain(sender: AnyObject) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activePlayer = 1
        counter = 0
        state = false
        isGameActive = true
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(gameOverLabel.center.x, gameOverLabel.center.y + 400)
        
        var buttonToClear: UIButton
        
        for (var i = 0; i<9; i += 1){
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && isGameActive{
            gameState[sender.tag] = activePlayer
                if activePlayer == 1 {
                    sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                    activePlayer = 2
                }else{
                    sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                    activePlayer = 1
                }
            
            counter += 1
            
            for combination in winningCombinations{
                if ((gameState[combination[0]] != 0) && (gameState[combination[0]] != 0) && (gameState[combination[0]] == gameState[combination[1]]) && (gameState[combination[0]] == gameState[combination[2]])) {
                    
                    isGameActive = false
                    
                    if gameState[combination[1]] == 1 {
                        //print("Player 1 wins")
                        gameOverLabel.text = "Player 1 Wins"
                        state = true
                        
                    }else{
                        gameOverLabel.text = "Player 2 Wins"
                        state = true

                    }
                    
                    gameOverLabel.hidden = false
                    playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
                        
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x, self.playAgainButton.center.y - 400)
                    })
                    
                }
            }
        }
        
        if (counter == 9) && (state == false){
            
            gameOverLabel.hidden = false
            playAgainButton.hidden = false
            
            gameOverLabel.text = "It's a tie"
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
                
                self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x, self.playAgainButton.center.y - 400)
            })
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(gameOverLabel.center.x, gameOverLabel.center.y + 400)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

