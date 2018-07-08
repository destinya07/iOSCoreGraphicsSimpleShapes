import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    class CircleView: UIView {
        var fillColor: UIColor = UIColor.blue {
            didSet {
                setNeedsDisplay()
            }
        }
        private var isRed = false
        
        override func draw(_ rect: CGRect) {
            let path = UIBezierPath(ovalIn: rect)
            fillColor.setFill()
            path.fill()
        }
        
        func toggleColor() {
            if isRed {
                fillColor = UIColor.blue
            } else {
                fillColor = UIColor.red
            }
            
            isRed = !isRed
        }
    }
    
    class TriangleView: UIView {
        var fillColor: UIColor = UIColor.blue {
            didSet {
                setNeedsDisplay()
            }
        }
        var isRed = false
        
        override func draw(_ rect: CGRect) {
            let path = UIBezierPath()
            
            fillColor.setFill()
            
            path.move(to: CGPoint(x: bounds.midX, y: bounds.minY))
            path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
            path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
            path.close()
            
            path.fill()
        }
        
        func toggleColor() {
            if isRed {
                fillColor = UIColor.blue
            } else {
                fillColor = UIColor.red
            }
            
            isRed = !isRed
        }
    }
    
    class SquareView: UIView {
        var fillColor: UIColor = UIColor.blue
        
        override func draw(_ rect: CGRect) {
            fillColor.setFill()
            
            let path = UIBezierPath(rect: rect)
            path.fill()
        }
    }
    
    var circleView: CircleView = CircleView()
    var triangleView: TriangleView = TriangleView()
    var squareView: SquareView = SquareView()
    var rectangleView: SquareView = SquareView()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        circleView.frame = CGRect(x: 150, y: 50, width: 100, height: 100)
        circleView.backgroundColor = .white
        
        triangleView.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        triangleView.backgroundColor = .white
        
        squareView.frame = CGRect(x: 150, y: 350, width: 100, height: 100)
        squareView.backgroundColor = .white
        
        rectangleView.frame = CGRect(x: 100, y: 500, width: 200, height: 100)
        rectangleView.backgroundColor = .white
        
        view.addSubview(circleView)
        view.addSubview(triangleView)
        view.addSubview(squareView)
        view.addSubview(rectangleView)
        self.view = view
    }
    
    override func viewDidLoad() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCircle))
        circleView.addGestureRecognizer(tapGesture)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeTriangle))
        triangleView.addGestureRecognizer(swipeGesture)
    }
    
    @objc func tapCircle() {
        print("circle tapped")
        circleView.toggleColor()
    }
    
    @objc func swipeTriangle(sender: UISwipeGestureRecognizer) {
        switch sender.state {
        case .ended:
            triangleView.toggleColor()
            print("swipe ended")
            break
        default:
            break
        }
        print("triangle swiped")
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
