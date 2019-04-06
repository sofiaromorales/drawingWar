import Foundation
import PlaygroundSupport
import UIKit

public class introGameView: UIViewController {
    
    let instrucctionsView = UIImageView()
    let closeInstBtn = UIButton()
    let particleEmitter = CAEmitterLayer()
    //var titleImage = UIImageView()
    
  public override func loadView() {
    
    //intro view
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
    view.backgroundColor = #colorLiteral(red: 0.06903042644, green: 0.1019619629, blue: 0.1823999584, alpha: 1)
    
    //createParticles()
    view.layer.addSublayer(particleEmitter)
    //UI ELEMENTS
    
    let titleImage = UIImage(named: "drAwIngwar")
    var titleImageView = UIImageView(frame: CGRect(x: view.frame.width / 2 - 150, y: 60, width: 320, height: 60))
    titleImageView.image = titleImage
    view.addSubview(titleImageView)
    
    let slogan1 = UILabel(frame: CGRect(x: view.frame.width / 2 - 150, y: 150, width: 300, height: 100))
    slogan1.font = UIFont(name: "Menlo", size: 40)
    slogan1.textAlignment = .center
    slogan1.text = "🤖  VS  🤖"
    slogan1.textColor = .white
    
    view.addSubview(slogan1)
    
    let slogan2 = UILabel(frame: CGRect(x: view.frame.width / 2 - 225, y: 200, width: 450, height: 100))
    slogan2.font = UIFont(name: "Menlo", size: 20)
    slogan2.textColor = .white
    slogan2.textAlignment = .center
    slogan2.text = "The AI vs AI drawing competition"
    
    view.addSubview(slogan2)
    
    //play btn
    let playBtn = UIButton(frame: CGRect(x: view.frame.width / 2 - 200, y: view.frame.size.height - 90, width: 150, height: 33))
    playBtn.setBackgroundImage(UIImage(named: "playBtn"), for: .normal)
    playBtn.addTarget(self, action: #selector(startGameTpd), for: .touchUpInside)
    
    view.addSubview(playBtn)
    
    //instructions btn
    let instructionsBtn = UIButton(frame: CGRect(x: view.frame.size.width / 2 + 50, y: view.frame.size.height - 90, width: 150, height: 33))
    instructionsBtn.setBackgroundImage(UIImage(named: "instr"), for: .normal)
    instructionsBtn.addTarget(self, action: #selector(showInstructionsTpd), for: .touchUpInside)
    
    view.addSubview(instructionsBtn)
    
    //instructions vw
    instrucctionsView.frame = CGRect(x: view.frame.width / 2 - 200, y: 50, width: view.frame.size.width - 200, height: view.frame.size.height - 100)
    instrucctionsView.image = UIImage(named: "inst")
    instrucctionsView.alpha = 0
    view.addSubview(instrucctionsView)
    
    closeInstBtn.frame =  CGRect(x: instrucctionsView.frame.width / 2 + 75, y: instrucctionsView.frame.height , width: 60, height: 30)
    closeInstBtn.backgroundColor = #colorLiteral(red: 0.7539863586, green: 0.233954221, blue: 0.407979548, alpha: 1)
    closeInstBtn.setTitle("got it", for: .normal)
    closeInstBtn.layer.cornerRadius = 5
    
    closeInstBtn.addTarget(self, action: #selector(closeInstructions), for: .touchUpInside)
    closeInstBtn.alpha = 0
    
   view.addSubview(closeInstBtn)
    self.view = view
    
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        createParticles()
    }
    
    @objc func showInstructionsTpd(){
        instrucctionsView.alpha = 1
        closeInstBtn.alpha = 1
    }
    
    @objc func closeInstructions() {
        instrucctionsView.alpha = 0
        closeInstBtn.alpha = 0
        print("tapped")
    }
    
    @objc func startGameTpd() {
        let gameVC = mainViewController()
        gameVC.modalTransitionStyle = .coverVertical
        present(gameVC, animated: true, completion: nil)
        
        
    }
    
    //func for particles
    func createParticles() {
        
        
        particleEmitter.emitterPosition = CGPoint(x: view.frame.width / 2.0, y: -50)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.frame.width, height: 1)
        particleEmitter.renderMode = .additive
        
        let cell = CAEmitterCell()
        cell.birthRate = 2
        cell.lifetime = 2.5
        cell.velocity = 100
        cell.velocityRange = 50
        cell.emissionLongitude = .pi
        cell.spinRange = 5
        cell.scale = 0.5
        cell.scaleRange = 0.25
        cell.color = #colorLiteral(red: 0.2596056163, green: 0.8941705227, blue: 0.9306692481, alpha: 1)
        cell.alphaSpeed = -0.025
        cell.lifetime = 1
        cell.contents = UIImage(named: "particle")?.cgImage
        
        let cell2 = CAEmitterCell()
        cell2.birthRate = 2
        cell2.lifetime = 2.5
        cell2.velocity = 100
        cell2.velocityRange = 50
        cell2.emissionLongitude = .pi
        cell2.spinRange = 5
        cell2.scale = 0.5
        cell2.scaleRange = 0.25
        cell2.color = #colorLiteral(red: 0.7539863586, green: 0.233954221, blue: 0.407979548, alpha: 1)
        cell2.alphaSpeed = -0.025
        
        cell2.contents = UIImage(named: "particle")?.cgImage
        
        particleEmitter.emitterCells = [cell, cell2]
        
        
        
        //view.layer.addSublayer(particleEmitter)
    }
    
}
