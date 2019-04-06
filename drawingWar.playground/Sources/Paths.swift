import Foundation
import SpriteKit


public class Paths{
    
    
    public class func gamePaths() -> [UIBezierPath]{
        
        
        var paths : [UIBezierPath] = []
        
        
        //// moonPath Drawing
        let moonPathPath = UIBezierPath()
        moonPathPath.move(to: CGPoint(x: 134.45, y: 40.39))
        moonPathPath.addCurve(to: CGPoint(x: 106.04, y: 53.52), controlPoint1: CGPoint(x: 123.78, y: 42.86), controlPoint2: CGPoint(x: 114.11, y: 47.42))
        moonPathPath.addCurve(to: CGPoint(x: 81.77, y: 99.77), controlPoint1: CGPoint(x: 91.17, y: 64.79), controlPoint2: CGPoint(x: 81.77, y: 81.33))
        moonPathPath.addCurve(to: CGPoint(x: 152.92, y: 161.24), controlPoint1: CGPoint(x: 81.77, y: 133.72), controlPoint2: CGPoint(x: 113.63, y: 161.24))
        moonPathPath.addCurve(to: CGPoint(x: 165.5, y: 160.28), controlPoint1: CGPoint(x: 157.21, y: 161.24), controlPoint2: CGPoint(x: 161.42, y: 160.91))
        moonPathPath.addCurve(to: CGPoint(x: 123.28, y: 174.5), controlPoint1: CGPoint(x: 153.85, y: 169.19), controlPoint2: CGPoint(x: 139.19, y: 174.5))
        moonPathPath.addCurve(to: CGPoint(x: 54.5, y: 107), controlPoint1: CGPoint(x: 85.29, y: 174.5), controlPoint2: CGPoint(x: 54.5, y: 144.28))
        moonPathPath.addCurve(to: CGPoint(x: 80.96, y: 53.79), controlPoint1: CGPoint(x: 54.5, y: 85.38), controlPoint2: CGPoint(x: 64.85, y: 66.14))
        moonPathPath.addCurve(to: CGPoint(x: 123.28, y: 39.5), controlPoint1: CGPoint(x: 92.63, y: 44.83), controlPoint2: CGPoint(x: 107.32, y: 39.5))
        moonPathPath.addCurve(to: CGPoint(x: 134.45, y: 40.39), controlPoint1: CGPoint(x: 127.08, y: 39.5), controlPoint2: CGPoint(x: 130.81, y: 39.8))

        moonPathPath.close()
        moonPathPath.fill()
        UIColor.black.setStroke()
        moonPathPath.lineWidth = 1
        moonPathPath.stroke()

        
        
        // Star
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 113, y: 34))
        starPath.addLine(to: CGPoint(x: 130.78, y: 92.35))
        starPath.addLine(to: CGPoint(x: 196.22, y: 89.97))
        starPath.addLine(to: CGPoint(x: 141.76, y: 123.65))
        starPath.addLine(to: CGPoint(x: 164.43, y: 180.53))
        starPath.addLine(to: CGPoint(x: 113, y: 142.99))
        starPath.addLine(to: CGPoint(x: 61.57, y: 180.53))
        starPath.addLine(to: CGPoint(x: 84.24, y: 123.65))
        starPath.addLine(to: CGPoint(x: 29.78, y: 89.97))
        starPath.addLine(to: CGPoint(x: 95.22, y: 92.35))
        starPath.close()
        starPath.lineWidth = 2
        starPath.stroke()

        
        
        //// Tree Drawing
        let treePath = UIBezierPath()
        treePath.move(to: CGPoint(x: 144.81, y: 31.22))
        treePath.addCurve(to: CGPoint(x: 156.5, y: 28), controlPoint1: CGPoint(x: 148.34, y: 29.16), controlPoint2: CGPoint(x: 152.3, y: 28))
        treePath.addCurve(to: CGPoint(x: 183, y: 59.5), controlPoint1: CGPoint(x: 171.14, y: 28), controlPoint2: CGPoint(x: 183, y: 42.1))
        treePath.addCurve(to: CGPoint(x: 173.37, y: 83.79), controlPoint1: CGPoint(x: 183, y: 69.28), controlPoint2: CGPoint(x: 179.25, y: 78.01))
        treePath.addCurve(to: CGPoint(x: 176, y: 96.5), controlPoint1: CGPoint(x: 175.06, y: 87.64), controlPoint2: CGPoint(x: 176, y: 91.95))
        treePath.addCurve(to: CGPoint(x: 149, y: 126), controlPoint1: CGPoint(x: 176, y: 112.79), controlPoint2: CGPoint(x: 163.91, y: 126))
        treePath.addCurve(to: CGPoint(x: 136.7, y: 122.77), controlPoint1: CGPoint(x: 144.57, y: 126), controlPoint2: CGPoint(x: 140.39, y: 124.83))
        treePath.addCurve(to: CGPoint(x: 132, y: 123.95), controlPoint1: CGPoint(x: 135.16, y: 123.23), controlPoint2: CGPoint(x: 133.59, y: 123.63))
        treePath.addCurve(to: CGPoint(x: 132, y: 200), controlPoint1: CGPoint(x: 132, y: 150.77), controlPoint2: CGPoint(x: 132, y: 200))
        treePath.addLine(to: CGPoint(x: 103, y: 200))
        treePath.addCurve(to: CGPoint(x: 103, y: 121.64), controlPoint1: CGPoint(x: 103, y: 200), controlPoint2: CGPoint(x: 103, y: 147.83))
        treePath.addCurve(to: CGPoint(x: 97.26, y: 119.06), controlPoint1: CGPoint(x: 101.02, y: 120.89), controlPoint2: CGPoint(x: 99.11, y: 120.03))
        treePath.addCurve(to: CGPoint(x: 86, y: 125), controlPoint1: CGPoint(x: 94.51, y: 122.7), controlPoint2: CGPoint(x: 90.49, y: 125))
        treePath.addCurve(to: CGPoint(x: 71, y: 107.5), controlPoint1: CGPoint(x: 77.72, y: 125), controlPoint2: CGPoint(x: 71, y: 117.16))
        treePath.addCurve(to: CGPoint(x: 71.92, y: 101.44), controlPoint1: CGPoint(x: 71, y: 105.37), controlPoint2: CGPoint(x: 71.33, y: 103.33))
        treePath.addCurve(to: CGPoint(x: 57, y: 73.5), controlPoint1: CGPoint(x: 63.24, y: 97.49), controlPoint2: CGPoint(x: 57, y: 86.47))
        treePath.addCurve(to: CGPoint(x: 66.7, y: 49.04), controlPoint1: CGPoint(x: 57, y: 63.32), controlPoint2: CGPoint(x: 60.85, y: 54.34))
        treePath.addCurve(to: CGPoint(x: 79, y: 44), controlPoint1: CGPoint(x: 70.21, y: 45.86), controlPoint2: CGPoint(x: 74.44, y: 44))
        treePath.addCurve(to: CGPoint(x: 83.1, y: 44.51), controlPoint1: CGPoint(x: 80.4, y: 44), controlPoint2: CGPoint(x: 81.77, y: 44.18))
        treePath.addCurve(to: CGPoint(x: 82, y: 38), controlPoint1: CGPoint(x: 82.38, y: 42.44), controlPoint2: CGPoint(x: 82, y: 40.25))
        treePath.addCurve(to: CGPoint(x: 88.1, y: 23.32), controlPoint1: CGPoint(x: 82, y: 32.51), controlPoint2: CGPoint(x: 84.26, y: 27.44))
        treePath.addCurve(to: CGPoint(x: 90.36, y: 21.15), controlPoint1: CGPoint(x: 88.8, y: 22.56), controlPoint2: CGPoint(x: 89.56, y: 21.84))
        treePath.addCurve(to: CGPoint(x: 114, y: 13), controlPoint1: CGPoint(x: 96.21, y: 16.14), controlPoint2: CGPoint(x: 104.64, y: 13))
        treePath.addCurve(to: CGPoint(x: 144.81, y: 31.22), controlPoint1: CGPoint(x: 128.67, y: 13), controlPoint2: CGPoint(x: 141.03, y: 20.71))
        treePath.close()
        treePath.lineWidth = 1
        treePath.stroke()
        
        //// house Drawing
        let housePath = UIBezierPath()
        housePath.move(to: CGPoint(x: 62, y: 215))
        housePath.addLine(to: CGPoint(x: 183, y: 215))
        housePath.addLine(to: CGPoint(x: 183, y: 105))
        housePath.addLine(to: CGPoint(x: 62, y: 105))
        housePath.addLine(to: CGPoint(x: 62, y: 215))
        housePath.close()
        housePath.move(to: CGPoint(x: 122.5, y: 33))
        housePath.addLine(to: CGPoint(x: 183.55, y: 101.25))
        housePath.addLine(to: CGPoint(x: 61.45, y: 101.25))
        housePath.addLine(to: CGPoint(x: 122.5, y: 33))
        housePath.close()
        housePath.fill()
        housePath.lineWidth = 3.5
        housePath.stroke()


        //// Heart Drawing
        let heartPath = UIBezierPath()
        heartPath.move(to: CGPoint(x: 159.3, y: 64.82))
        heartPath.addCurve(to: CGPoint(x: 163.33, y: 66.41), controlPoint1: CGPoint(x: 160.68, y: 65.23), controlPoint2: CGPoint(x: 162.03, y: 65.75))
        heartPath.addCurve(to: CGPoint(x: 168.78, y: 144.68), controlPoint1: CGPoint(x: 183.07, y: 76.32), controlPoint2: CGPoint(x: 185.51, y: 111.36))
        heartPath.addCurve(to: CGPoint(x: 149.57, y: 171.73), controlPoint1: CGPoint(x: 163.44, y: 155.32), controlPoint2: CGPoint(x: 156.79, y: 164.49))
        heartPath.addCurve(to: CGPoint(x: 107.8, y: 224.98), controlPoint1: CGPoint(x: 149.6, y: 171.73), controlPoint2: CGPoint(x: 107.8, y: 224.98))
        heartPath.addCurve(to: CGPoint(x: 83.6, y: 189.05), controlPoint1: CGPoint(x: 107.8, y: 224.98), controlPoint2: CGPoint(x: 94.44, y: 205.14))
        heartPath.addCurve(to: CGPoint(x: 83.27, y: 189.3), controlPoint1: CGPoint(x: 83.38, y: 189.21), controlPoint2: CGPoint(x: 83.27, y: 189.3))
        heartPath.addCurve(to: CGPoint(x: 60.73, y: 159.04), controlPoint1: CGPoint(x: 83.27, y: 189.3), controlPoint2: CGPoint(x: 69.37, y: 170.64))
        heartPath.addCurve(to: CGPoint(x: 52.96, y: 148.52), controlPoint1: CGPoint(x: 58.01, y: 155.77), controlPoint2: CGPoint(x: 55.4, y: 152.26))
        heartPath.addCurve(to: CGPoint(x: 47.82, y: 71.32), controlPoint1: CGPoint(x: 33.18, y: 118.28), controlPoint2: CGPoint(x: 31.1, y: 84.39))
        heartPath.addCurve(to: CGPoint(x: 49.47, y: 70.13), controlPoint1: CGPoint(x: 48.35, y: 70.9), controlPoint2: CGPoint(x: 48.9, y: 70.51))
        heartPath.addCurve(to: CGPoint(x: 108.84, y: 90.44), controlPoint1: CGPoint(x: 64.87, y: 60.06), controlPoint2: CGPoint(x: 89.31, y: 69.11))
        heartPath.addCurve(to: CGPoint(x: 159.3, y: 64.82), controlPoint1: CGPoint(x: 124.2, y: 70.74), controlPoint2: CGPoint(x: 143.98, y: 60.3))
        heartPath.close()
        heartPath.lineWidth = 1
        heartPath.stroke()



        paths.append(moonPathPath)
        paths.append(starPath)
        paths.append(treePath)
        paths.append(housePath)
        paths.append(heartPath)
        
        return paths
    }
}
