import UIKit
import PlaygroundSupport

public class userCanvas: UIView {
    
    var lineColor: UIColor!
    var lineWidth: CGFloat!
    
    var path: UIBezierPath!
    var touchPoint: CGPoint!
    var startPoint: CGPoint!
    
    public override func layoutSubviews() {
        setupDefaultSettings()
    }
    
    // control touches
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            startPoint = touch.location(in: self)
            path = UIBezierPath()
            path.move(to: startPoint)
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            touchPoint = touch.location(in: self)
        }
        
        path.addLine(to: touchPoint)
        startPoint = touchPoint
        
        drawShapeLayer()
       
        
        
    }
    
    
    // Function to clear the drawn path
    public func clearCanvas() {
        guard let path = path else { return }
        //path.addLine(to: CGPoint(x: 5, y: 5))
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
        print("clearing")
    }
    
    // draw shape on layer
    public func drawShapeLayer() {
        guard let path = path else { return }
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        layer.addSublayer(shapeLayer)
        setNeedsDisplay()
    }
    
    public func setupDefaultSettings() {
        lineColor = #colorLiteral(red: 0.2596056163, green: 0.8941705227, blue: 0.9306692481, alpha: 1)
        lineWidth = 5
        
        clipsToBounds = true
        isMultipleTouchEnabled = false
    }
    
}
