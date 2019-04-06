
/*:
 This is the WWDC19 Scholarship application made by Sofia Rodriguez
 
 Thanks to Apple for considering me
 
 I hope you enjoy this Playground
 
 **Welcome to the Drawing War!**
 
 In this simple game your goal is to take you'r team to the victory!
 
 There are two teams:
 * Yours, composed by you and your AI robot
 * The oponent team, composed by the computer and another AI robot
 
 The rules are simple:
    When the game starts the non-robot player of the team has to start drawing in the canvas the word that appears in the top of the screen.
    The first robot that guesses the word takes the points of the round
    The winner is the team that has more points when the 5 rounds end
 
 Have fun! 😋
 
 
 * callout(Hint):
 Make the draws as simple as possible 
 
 */


import UIKit
import PlaygroundSupport
import Vision
import CoreML



// Present the view controller in the Live View window
let vc = introGameView()
//vc.view.frame.size = CGSize(width: 600, height: 600)
vc.view.frame = CGRect(x: 0, y: 500, width: 600, height: 400)
PlaygroundPage.current.liveView = vc.view

