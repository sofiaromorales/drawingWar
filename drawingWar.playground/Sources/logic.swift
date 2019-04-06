import Foundation
import  UIKit
import PlaygroundSupport
import Vision
import CoreML

public class logic {
    
    
    public var wordsToGuess = ["Moon", "Star", "Tree","House","Heart"]
   
    public var AIScore : Int?
    public var playerScore : Int?
    
    public func game(round: Int, AIPrediction : String, userPrediction : String, AIScore : Int, playerScore : Int) ->  Array<Int> {
        print("LOGIC")
        print(wordsToGuess[round])
        print(userPrediction)
        print(AIPrediction)
        if AIPrediction == wordsToGuess[round]{
            print("AI")
            return [AIScore  + 10, playerScore]
        }
        else if userPrediction == wordsToGuess[round]{
            print("user")
            return [AIScore, playerScore + 10]
        }
        else{
            print("ANY")
            return [AIScore, playerScore]
        }
    }
    
}
