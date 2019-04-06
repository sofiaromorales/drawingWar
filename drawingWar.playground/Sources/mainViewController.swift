import UIKit
import PlaygroundSupport
import AVFoundation
import Vision
import CoreML


public class mainViewController: UIViewController {
    
    //ELEMENTS;
    
    var wordDraggArray = ["Moon🌜", "Star ⭐️", "Tree🌳", "House 🏠", "Heart❤️"]
    var userPoints = 0
    var aiPoints = 0
    var pathsArray = Paths.gamePaths()
    var audioPlayer = AVAudioPlayer()
    let audio = Bundle.main.path(forResource: "correct", ofType: "mp3")
    
    
    //UI ELEMENTS
    var uCanvas = userCanvas()
    var aiCanvas = UIImageView()
    var wordDraggLbl = UILabel()
    let uWordGuessLbl = UILabel()
    var aiWordGuessLbl = UILabel()
    var userPointsLbl = UILabel()
    var aiPointsLbl = UILabel()
    let eraseBtn = UIButton()
    let roundLbl = UILabel()
    
    //CELEB VIEW
    let celebView = UIImageView()
    var celebLbl = UILabel()
    var celebDissmisBtn = UIButton()
    
    //RECOGNITION
    var userRequests = [VNRequest]()
    var AIRequests = [VNRequest]()
    var model = WWDC19Classifier()
    let predictionLbl = UILabel()
    
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    
    //LOGIC
    var round = 0
    public var score = [0,0]
    var gameLogic = logic()
    var acces = 0
    
    public override func loadView() {
        
        
        
        //setting the main view
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0 , width: 600, height: 400)
        view.backgroundColor = #colorLiteral(red: 0.06498814374, green: 0.09809686989, blue: 0.1742894351, alpha: 1)
        self.view = view
        
        //setting the canvas
        uCanvas.frame = CGRect(x: view.frame.width / 2 + 30 , y: view.frame.height / 2 - 75 , width: 225, height: 225)
        uCanvas.layer.cornerRadius = 5
        uCanvas.backgroundColor = .black
        //Canvas.layer.masksToBounds = true
        uCanvas.layer.borderColor = #colorLiteral(red: 0.2596056163, green: 0.8941705227, blue: 0.9306692481, alpha: 1)
        uCanvas.layer.borderWidth = 2
        
        aiCanvas.frame = CGRect(x: view.frame.width / 2 - 265, y: view.frame.height / 2 - 75 , width: 225, height: 225)
        aiCanvas.backgroundColor = .black
        aiCanvas.layer.cornerRadius = 5
        aiCanvas.layer.masksToBounds = true
        aiCanvas.layer.borderColor = #colorLiteral(red: 0.6733983159, green: 0.2165313661, blue: 0.3732438087, alpha: 1)
        aiCanvas.layer.borderWidth = 2
       
        
        //UserCanvas
        eraseBtn.frame = CGRect(x: view.frame.width / 2 + 35, y: view.frame.height / 2 - 70, width: 23, height: 23)
        eraseBtn.setBackgroundImage(UIImage(named: "bin"), for: .normal)
        
        
        eraseBtn.addTarget(self, action: #selector(cleanCanvas), for: .touchUpInside)
        
        
        
        //seting principal UI
        wordDraggLbl.frame = CGRect(x: view.frame.width / 2 - 100 , y: 50, width: 225,  height: 50)
        wordDraggLbl.text = "draw: "
        wordDraggLbl.font = UIFont(name: "Menlo", size: 25)
        wordDraggLbl.textColor = #colorLiteral(red: 0.2596056163, green: 0.8941705227, blue: 0.9306692481, alpha: 1)
        wordDraggLbl.textAlignment = .center
        
        
        roundLbl.text = "round \(round)"
        roundLbl.textColor = .white
        roundLbl.font = UIFont(name: "Menlo", size: 18)
        roundLbl.frame = CGRect(x: view.frame.width / 2 - 50, y: 20, width: 100, height: 50)
        roundLbl.textColor = #colorLiteral(red: 0.7183057666, green: 0.8089581132, blue: 0.9836329818, alpha: 1)
       
        
    
        //setting points label
        userPointsLbl.frame = CGRect(x: view.frame.width / 2 + 50, y: view.frame.height - 55, width: 200,  height: 50)
        userPointsLbl.text = "\(userPoints) points"
        userPointsLbl.textColor = #colorLiteral(red: 0.7183057666, green: 0.8089581132, blue: 0.9836329818, alpha: 1)
        userPointsLbl.textAlignment = .center
         userPointsLbl.font = UIFont(name: "Menlo", size: 15)
        
        
         aiPointsLbl.frame = CGRect(x: view.frame.width / 2 - 200, y: view.frame.height - 60, width: 100,  height: 50)
        aiPointsLbl.text = "\(aiPoints) points"
        aiPointsLbl.textColor = #colorLiteral(red: 0.7183057666, green: 0.8089581132, blue: 0.9836329818, alpha: 1)
         aiPointsLbl.font = UIFont(name: "Menlo", size: 15)
        aiPointsLbl.textAlignment = .center
        
        
        
        //UserPrediction view
        
        uWordGuessLbl.frame = CGRect(x: view.frame.width / 2 + 50, y: view.frame.height / 2 - 115, width: 200, height: 50)
        uWordGuessLbl.textAlignment = .center
        //uWordGuessLbl.text = "I dont sen anything yet..."
        uWordGuessLbl.textColor = #colorLiteral(red: 0.9685910344, green: 0.9686424136, blue: 0.9728116393, alpha: 1)
        uWordGuessLbl.font = UIFont(name: "Menlo", size: 18)
        
        
        aiWordGuessLbl.frame = CGRect(x: view.frame.width / 2 - 250, y: view.frame.height / 2 - 115, width: 200, height: 50)
        //aiWordGuessLbl.text = "I dont sen anything yet..."
        aiWordGuessLbl.textAlignment = .center
        aiWordGuessLbl.textColor = #colorLiteral(red: 0.9685910344, green: 0.9686424136, blue: 0.9728116393, alpha: 1)
        aiWordGuessLbl.font = UIFont(name: "Menlo", size: 18)
        aiWordGuessLbl.text = "mmm..."
        
        
        
        //setting the CELEB view
   
        //celebView.image = UIImage(named: "celebViewR")
        celebView.backgroundColor = #colorLiteral(red: 0.7301162481, green: 0.7494597435, blue: 0.7750173211, alpha: 1)
        celebView.layer.borderColor = #colorLiteral(red: 0.1503052413, green: 0.3741766214, blue: 0.6389389634, alpha: 1)
        celebView.frame = CGRect(x: 150, y: view.frame.width / 4 - 75, width: 325, height: 250)
        celebView.layer.cornerRadius = 5
        celebView.layer.borderWidth = 2
        celebView.isHidden = true
        
        celebLbl.frame = CGRect(x: 62, y: 28, width: 200, height: 140)
        celebLbl.lineBreakMode = .byWordWrapping
        celebLbl.numberOfLines = 4
        celebLbl.font = UIFont(name: "Menlo", size: 18)
        
        celebLbl.textAlignment = .center
        
         celebDissmisBtn.frame = CGRect(x: view.frame.width / 2 - 50, y: view.frame.height / 2 + 63, width: 100, height: 40)
        celebDissmisBtn.setTitle("Next Round", for: .normal)
        celebDissmisBtn.backgroundColor = #colorLiteral(red: 0.1644620001, green: 0.4095819592, blue: 0.6995424628, alpha: 1)
        celebDissmisBtn.isHidden = true
        celebDissmisBtn.layer.cornerRadius = 5
        
         celebDissmisBtn.addTarget(self, action: #selector(nextRound), for: .touchUpInside)
       
        
        //ADDING VIEWS
        
      
       view.addSubview(uCanvas)
        view.addSubview(aiCanvas)
        view.addSubview(wordDraggLbl)
         view.addSubview(roundLbl)
        view.addSubview(userPointsLbl)
        view.addSubview(aiPointsLbl)
        view.addSubview(uWordGuessLbl)
        view.addSubview(aiWordGuessLbl)
        view.addSubview(eraseBtn)
        celebView.addSubview(celebLbl)
        view.addSubview(celebView)
        view.addSubview(celebDissmisBtn)
 
        
       
        //PREDICTION
        
        setupUserVision()
        setupAIVision()
        
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(userRecognize), userInfo: nil, repeats: true)
        
        let timer2 = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(AIRecognize), userInfo: nil, repeats: false)
        
        //correct sound
        do {
            if let fileURL = Bundle.main.path(forResource: "correct", ofType: "mp3") {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        aiDrawPaths()
        wordDraggLbl.text = "draw: \(wordDraggArray[round])"
        score = [0,0]
        round = 0
        
    }
    
    @objc func nextRound(){
        wordDraggLbl.text = "draw: \(wordDraggArray[round])"
        celebView.isHidden = true
        celebDissmisBtn.isHidden = true
        aiPoints = score[0]
        userPoints = score [1]
        uCanvas.clearCanvas()
        userPointsLbl.text = "\(userPoints) points"
        aiPointsLbl.text = "\(aiPoints) points"
        roundLbl.text = "round \(round)"
        aiWordGuessLbl.text = "mmm..."
        acces = 0
        let timer2 = Timer.scheduledTimer(timeInterval: 25, target: self, selector: #selector(AIRecognize), userInfo: nil, repeats: false)
       /* if gameLogic.wordsToGuess[round] == "Heart"{
            let timer3 = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(heartFunc), userInfo: nil, repeats: false)
        }*/
        aiDrawPaths()
        
    }
    
    //func that clean the canvas
    @objc func cleanCanvas(){
        uCanvas.clearCanvas()
    }
   
    //function that is called every second to recognize path and score
    @objc func  userRecognize()
    {
        
        
        if (uCanvas.layer.sublayers != nil){
            makeUserPrediction(imageV: uCanvas.asImage())
        }
        if (aiCanvas.layer.sublayers != nil  && acces == 1) {
            makeAIPrediction(imageV: aiCanvas.asImage())
        }
        
        comparingScoring()
        
        
        
    }
    
    //funcs that are called in some draws thar are difficult to guess
    
    @objc func  AIRecognize()
    {
        acces = 1
        if (round == 0){
            aiWordGuessLbl.text = "Moon"
        }
        else if (round == 4){
             aiWordGuessLbl.text = "Heart"
        }
        
        
        comparingScoring()
        
    }
    
    @objc func  heartFunc()
    {
       aiWordGuessLbl.text = "Heart"
        
    }
    
    
    //function that compares scores and see if any team guesssed the word to past next round
    func comparingScoring()  {
        
       
        score = gameLogic.game(round: round, AIPrediction: aiWordGuessLbl.text ?? "", userPrediction: uWordGuessLbl.text ?? "", AIScore: aiPoints, playerScore: userPoints)
        print("score: \(score)")
        //means that a tem guessed the word
        if (score[0] != aiPoints) {
            aiPoints = score[0]
            print("AI")
            if round == wordDraggArray.count - 1 {
                endGame()
            }else {
                celebLbl.text = textCeleb(round: round, AIScore: score[0], userScore: score[1], winner: "AI")
                round += 1
                audioPlayer.play()
                aiCanvas.layer.sublayers = nil
                celebView.isHidden = false
                uWordGuessLbl.text = ""
                aiWordGuessLbl.text = ""
                celebDissmisBtn.isHidden = false
                
            }
        }else if (score[1] != userPoints) {
            userPoints = score[1]
            print("USERS")
            if round == wordDraggArray.count - 1 {
                endGame()
            }else {
                celebLbl.text =  textCeleb(round: round, AIScore: score[0], userScore: score[1], winner: "user")
                print(celebLbl.text)
                round += 1
                aiCanvas.layer.sublayers = nil
                audioPlayer.play()
                celebView.isHidden = false
                uWordGuessLbl.text = ""
                aiWordGuessLbl.text = ""
                celebDissmisBtn.isHidden = false
                
                
            }
        }
    }
    
    //function that sets the text of the CELEB
    
    func textCeleb(round : Int, AIScore: Int, userScore : Int, winner: String) -> String {
        
        var celebText = ""
        
        if (winner == "AI"){
            if (AIScore > userScore){
                print(AIScore - userScore)
                celebText = """
                You lost this round
                you are loosing by \(AIScore - userScore) points
                """
                print(celebText)
            }
            else if (userScore > AIScore){
                celebText = """
                You lost, but don worry
                you have \(userScore - AIScore) points of adventage
                """
            }
            else {
                celebText = """
                You lost
                this is a tie
                """
            }
        }
        else{
            if (AIScore > userScore){
                celebText = """
                You won this round
                but you are loosing by \(AIScore - userScore) points
                """
            }
            else if (userScore > AIScore){
                celebText = """
                You won
                you are ahead by \(userScore - AIScore) points
                """
            }
            else {
                celebText = """
                You won
                this is a tie
                """
            }
        }
        
        return celebText
    }
    
    
    
    //its called when the came is over, hidding all the UI elements
    
    
    
    
    func endGame() {
        wordDraggLbl.alpha = 0
        uCanvas.isHidden = true
        aiCanvas.isHidden = true
        aiPointsLbl.alpha = 0
        userPointsLbl.alpha = 0
        uWordGuessLbl.alpha = 0
        aiWordGuessLbl.alpha = 0
        roundLbl.alpha = 0 
        eraseBtn.isHidden = true
        var gameOverV = gameOver()
        gameOverV.rScore = score
        gameOverV.modalTransitionStyle = .coverVertical
        present(gameOverV, animated: true, completion: nil)
    }
    
    
    
    
    
    // draws the ai path
    func aiDrawPaths(){
        //AI draw
        
        // Create shape layer and add the path to it
        let layer = CAShapeLayer()
        layer.path = pathsArray[round].cgPath

        // Set up the appearance of the shape layer
        layer.strokeEnd = 1
        layer.lineWidth = 5
        layer.strokeColor = #colorLiteral(red: 0.7539863586, green: 0.233954221, blue: 0.407979548, alpha: 1)
        layer.fillColor = UIColor.clear.cgColor
        layer.frame = aiCanvas.bounds
        // Create view and set its appearance
        aiCanvas.layer.addSublayer(layer)
    
        // Create the animation for the shape view
        
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 25 // seconds
      
        
        
        // And finally add the linear animation to the shape
        layer.add(animation, forKey: "line")
    }
    
    
    
    ///////////////RECOGNITION
    
    // scales any UIImage to a desired target size
    func scaleImage (image:UIImage, toSize size:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    ///////USER RECOGNITION
    
    func setupUserVision() {
        // loadmodel for the use with the Vision framework
        guard let visionModel = try? VNCoreMLModel(for: WWDC19Classifier().model) else {fatalError("can not load Vision ML model")}
        
        // create a classification request and tell it to call handleClassification once its done
        let classificationRequest = VNCoreMLRequest(model: visionModel, completionHandler: self.handleUserClassification)
        
        self.userRequests = [classificationRequest] // assigns the classificationRequest to the global requests array
        
    }
    
    func handleUserClassification (request:VNRequest, error:Error?) {
        guard let observations = request.results else {print("no results"); return}
        
        // process the ovservations
        let classifications = observations
            .flatMap({$0 as? VNClassificationObservation}) // cast all elements to VNClassificationObservation objects
            .filter({$0.confidence > 0.95}) // only choose observations with a confidence of more than 80%
            .map({$0.identifier}) // only choose the identifier string to be placed into the classifications array
        
        DispatchQueue.main.async {
            //print(classifications.first)
            if classifications.first == nil {
                self.uWordGuessLbl.text = "mmm..."
            }
            else {
                print(classifications.first)
                self.uWordGuessLbl.text = classifications.first
            }
            // update the UI with the classification
        }
        
    }
    
    public func makeUserPrediction(imageV : UIImage){
        let image = imageV // get UIImage from CanvasView
        let scaledImage = scaleImage(image: image, toSize: CGSize(width: 28, height: 28)) // scale the image to the required size of 28x28 for better recognition results
        
        let imageRequestHandler = VNImageRequestHandler(cgImage: scaledImage.cgImage!, options: [:]) // create a handler that should perform the vision request
        
        do {
            try imageRequestHandler.perform(userRequests)
        }catch{
            print(error)
        }
    }
    
    ///////AI RECOGNITION
    
    func setupAIVision() {
        // loadmodel for the use with the Vision framework
        guard let visionModel = try? VNCoreMLModel(for: WWDC19Classifier().model) else {fatalError("can not load Vision ML model")}
        
        // create a classification request and tell it to call handleClassification once its done
        let classificationRequest = VNCoreMLRequest(model: visionModel, completionHandler: self.handleAIClassification)
        
        self.AIRequests = [classificationRequest] // assigns the classificationRequest to the global requests array
        
    }
    
    func handleAIClassification (request:VNRequest, error:Error?) {
        guard let observations = request.results else {print("no results"); return}
        
        // process the ovservations
        let classifications = observations
            .flatMap({$0 as? VNClassificationObservation}) // cast all elements to VNClassificationObservation objects
            .filter({$0.confidence > 0.4}) // only choose observations with a confidence of more than 80%
            .map({$0.identifier}) // only choose the identifier string to be placed into the classifications array
        
        DispatchQueue.main.async {
            print(classifications.first)
            if classifications.first == nil {
                self.aiWordGuessLbl.text = "mmm..."
            }
            self.aiWordGuessLbl.text = classifications.first // update the UI with the classification
        }
        
    }
    
    public func makeAIPrediction(imageV : UIImage){
        let image = imageV // get UIImage from CanvasView
        let scaledImage = scaleImage(image: image, toSize: CGSize(width: 28, height: 28)) // scale the image to the required size of 28x28 for better recognition results
        
        let imageRequestHandler = VNImageRequestHandler(cgImage: scaledImage.cgImage!, options: [:]) // create a handler that should perform the vision request
        
        do {
            try imageRequestHandler.perform(AIRequests)
        }catch{
            print(error)
        }
    }
    
    
    
}

extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}


