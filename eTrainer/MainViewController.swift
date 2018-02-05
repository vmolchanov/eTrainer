import UIKit

class MainViewController: UIViewController {

    var radialGradientLayer: RadialGradientLayer! {
        didSet {
            let xCenter = self.view.bounds.size.width / 2.0
            let yCenter = self.view.bounds.size.height / 2.0
            let multiplierOfDispersion: CGFloat = 2.0
            let topColor = UIColor(red: 233.0 / 255, green: 219.0 / 255, blue: 219.0 / 255, alpha: 1.0)
            let bottomColor = UIColor(red: 4.0 / 255, green: 19.0 / 255, blue: 74.0 / 255, alpha: 1.0)
            
            self.radialGradientLayer.center = CGPoint(x: xCenter, y: yCenter)
            self.radialGradientLayer.radius = max(xCenter, yCenter) * multiplierOfDispersion
            self.radialGradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
            self.radialGradientLayer.frame = self.view.bounds
        }
    }
    
    var beginTrainingButton: UIButton! {
        didSet {
            let width: CGFloat = 150.0
            let height: CGFloat = 150.0
            let x = (self.view.bounds.size.width - width) / 2.0
            let y = (self.view.bounds.size.height - height) / 2.0
            
            self.beginTrainingButton.setTitle("Начать тренировку", for: .normal)
            self.beginTrainingButton.setTitleColor(UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9), for: .normal)
            self.beginTrainingButton.titleLabel?.lineBreakMode = .byWordWrapping
            self.beginTrainingButton.titleLabel?.textAlignment = .center
            self.beginTrainingButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20.0)
            self.beginTrainingButton.frame = CGRect(x: x, y: y, width: width, height: height)
            self.beginTrainingButton.layer.cornerRadius = width / 2.0
            self.beginTrainingButton.clipsToBounds = true
            
            let gradientLayer = CAGradientLayer()
            let topColor = UIColor(red: 96.0 / 255, green: 210.0 / 255, blue: 196.0 / 255, alpha: 1.0)
            let bottomColor = UIColor(red: 0.0 / 255, green: 130.0 / 255, blue: 106.0 / 255, alpha: 1.0)
            gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.frame = self.beginTrainingButton.bounds
            self.beginTrainingButton.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.radialGradientLayer = RadialGradientLayer()
        self.view.layer.insertSublayer(radialGradientLayer, at: 0)
        self.beginTrainingButton = UIButton(type: UIButtonType.custom)
        
        self.view.addSubview(self.beginTrainingButton)
    }

}

