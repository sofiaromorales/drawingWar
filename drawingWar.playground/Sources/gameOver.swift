import Foundation
import PlaygroundSupport
import UIKit
import AVFoundation

public class gameOver: UIViewController {
    
    var result = UILabel()
    var mainView = mainViewController()
    let playAgainBtn = UIButton()
    var rScore = [0,0]
    var winnerAudioPlayer = AVAudioPlayer()
    let winnerAudio = Bundle.main.path(forResource: "winner", ofType: "mp3")
    var looserAudioPlayer = AVAudioPlayer()
    let looserAudio = Bundle.main.path(forResource: "fail", ofType: "mp3")
    let creditsLbl = UILabel()
    let cell = CAEmitterCell()
    let particleEmitter = CAEmitterLayer()
    
    public override func loadView() {
        
        //over view
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
        view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        
        //UI ELEMENTS
        result.frame = CGRect(x: view.frame.width / 2 - 200, y: view.frame.height / 2 - 125 , width: 400, height: 250)
        print(mainView.score)
        result.textColor = #colorLiteral(red: 0.2596056163, green: 0.8941705227, blue: 0.9306692481, alpha: 1)
        result.textAlignment = .center
        result.font = UIFont(name: "Menlo", size: 35)
        
        playAgainBtn.frame = CGRect(x: view.frame.width / 2 - 75, y: view.frame.height / 2 + 100, width: 150, height: 50)
        playAgainBtn.backgroundColor = #colorLiteral(red: 0.7539863586, green: 0.233954221, blue: 0.407979548, alpha: 1)
        playAgainBtn.layer.borderColor = #colorLiteral(red: 0.4520601034, green: 0.1782291234, blue: 0.3100190163, alpha: 1)
        playAgainBtn.layer.borderWidth = 5
        playAgainBtn.layer.cornerRadius = 5
        playAgainBtn.setTitle("Play Again", for: .normal)
        
        playAgainBtn.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        
        
        
        creditsLbl.frame = CGRect(x: view.frame.width / 2 - 150, y: 20, width: 300, height: 200)
        creditsLbl.text = """
                Playground created by Sofia Rodriguez
                Thanks for considering me
                """
        creditsLbl.numberOfLines = 2
        creditsLbl.textColor = #colorLiteral(red: 0.7327605486, green: 0.8086748719, blue: 0.9708005786, alpha: 1)
        creditsLbl.textAlignment = .center
        creditsLbl.lineBreakMode = .byWordWrapping
        creditsLbl.font = UIFont(name: "Menlo", size: 18)
        view.addSubview(creditsLbl)
        
        result.layer.addSublayer(particleEmitter)
        view.addSubview(playAgainBtn)
        view.addSubview(result)
        self.view = view
        
        //correct sound
        do {
            if let fileURL = Bundle.main.path(forResource: "winner", ofType: "mp3") {
                winnerAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
        
        //loser audio
        do {
            if let fileURL = Bundle.main.path(forResource: "fail", ofType: "mp3") {
                looserAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        print("aiP")
        print(mainView.aiPoints)
        settingResultLbl()
        createParticles()
        
        
    }
    
    @objc func playAgain(){
        var game = mainViewController()
        game.modalTransitionStyle = .coverVertical
        present(game, animated: true, completion: nil)
    }
    
    func settingResultLbl(){
        if rScore[0] > rScore[1]{
            result.text = "YOU'R TEAM LOST 😕"
            cell.color = #colorLiteral(red: 0.7275782228, green: 0.07870020717, blue: 0.7729900479, alpha: 1)
            looserAudioPlayer.play()
        }
        else if rScore[1] > rScore[0]{
            result.text = "YOU'R TEAM WON 🎉"
           winnerAudioPlayer.play()
            cell.color = #colorLiteral(red: 0.2596056163, green: 0.8941705227, blue: 0.9306692481, alpha: 1)
        }
        else{
            result.text = "🤖 TIE 🤖"
        }
    }
    
    //func for particles
    func createParticles() {
        
        
        particleEmitter.emitterPosition = CGPoint(x: view.frame.width / 2.0, y: -50)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.width, height: 1)
        particleEmitter.renderMode = .additive
        
        
        cell.birthRate = 2
        cell.lifetime = 2.5
        cell.velocity = 100
        cell.velocityRange = 50
        cell.emissionLongitude = .pi
        cell.spinRange = 5
        cell.scale = 0.5
        cell.scaleRange = 0.25
        //cell.color = #colorLiteral(red: 0.7183057666, green: 0.8089581132, blue: 0.9836329818, alpha: 1)
        cell.alphaSpeed = -0.025
        cell.contents = UIImage(named: "particle")?.cgImage
        particleEmitter.emitterCells = [cell]
        
        
    }
    
}


