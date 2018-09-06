import UIKit

public class FirstScreenViewController: UIViewController{
    public var button: UIButton!
    
    public override func viewDidLoad(){
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
        addButton()
    }
    
    func addButton(){
       button = UIButton()
       button.addTarget(self, action: #selector(go), for: .touchUpInside)
       self.view.addSubview(button)
        
       button.translatesAutoresizingMaskIntoConstraints = false
        let margins = self.view.safeAreaLayoutGuide
     
        button.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
       
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        button.backgroundColor = UIColor.clear
        button.setTitle("Go", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        
       
    }
    
    @objc func go(){
        let transition = CATransition()
        transition.duration = 2.4
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        
        self.navigationController!.view.layer.add(transition, forKey: nil)
        self.navigationController!.pushViewController(SecondScreenViewController(), animated: false)
    }
}

public class SecondScreenViewController: UIViewController{
    public override func viewDidLoad(){
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red
        
    }
}




