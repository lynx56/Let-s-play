import UIKit
import PlaygroundSupport

let mainview = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 450)))
mainview.backgroundColor = UIColor.green
let buttonSize = CGSize(width: 70, height: 40)
let button = UIButton(frame: CGRect(origin: CGPoint(x: mainview.center.x, y: mainview.frame.maxY - buttonSize.height), size: buttonSize))
button.layer.cornerRadius = 10
button.layer.borderWidth = 2
button.layer.borderColor = UIColor.red.cgColor
button.backgroundColor = UIColor.clear
button.setTitle("Basic", for: .normal)
button.setTitleColor(UIColor.black, for: .normal)
mainview.addSubview(button)

/*
 CABasicAnimation - simple interpolation from..to
 */

func applyBasicAnimation(){
    let basicAnimation = CABasicAnimation(keyPath: "position")
    basicAnimation.duration = 3
    basicAnimation.repeatCount = 10
    //return to begin position
    basicAnimation.autoreverses = true
    //basicAnimation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x, y: button.frame.origin.y))
    basicAnimation.toValue = NSValue(cgPoint: CGPoint(x: mainview.bounds.minX + buttonSize.width/2.0, y: mainview.bounds.minY + buttonSize.height/2.0))
 
    button.layer.add(basicAnimation, forKey: "animatePosition")
}

/*
 CAKeyframeAnimation
 */

func applyKeyframeAnimation(){
    let animation = CAKeyframeAnimation()

    let path = [NSValue(cgPoint: CGPoint(x: 10.0, y: 10.0)),
                NSValue(cgPoint: CGPoint(x: 100.0, y: 100.0)),
                NSValue(cgPoint: CGPoint(x: 10.0, y: 100.0)),
                NSValue(cgPoint: CGPoint(x: 10.0, y: 10.0))]
    
    animation.keyPath = "position"
    animation.values = path
    animation.duration = 5
    //animation.isAdditive = true

    button.layer.add(animation, forKey: "position")
}

/*
 CATransition
 */

func caTransition(){
    let firstScreen = FirstScreenViewController()
    let navigationController = UINavigationController(rootViewController: firstScreen)
    
    navigationController.view.frame = mainview.frame
    
    navigationController.view.isUserInteractionEnabled = true
    PlaygroundPage.current.liveView = navigationController
}

caTransition()

//PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true

