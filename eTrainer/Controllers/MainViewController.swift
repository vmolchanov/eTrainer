import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Свойства

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
    
    var beginTrainingButton: CircleButton! {
        didSet {
            self.beginTrainingButton.setTitle("Начать тренировку", for: .normal)
            self.beginTrainingButton.setTitleColor(UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9), for: .normal)
            self.beginTrainingButton.titleLabel?.lineBreakMode = .byWordWrapping
            self.beginTrainingButton.titleLabel?.textAlignment = .center
            self.beginTrainingButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20.0)
            
            let gradientLayer = CAGradientLayer()
            let topColor = UIColor(red: 96.0 / 255, green: 210.0 / 255, blue: 196.0 / 255, alpha: 1.0)
            let bottomColor = UIColor(red: 0.0 / 255, green: 130.0 / 255, blue: 106.0 / 255, alpha: 1.0)
            gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.frame = self.beginTrainingButton.bounds
            self.beginTrainingButton.insertSublayer(gradientLayer, at: 0)
            
            self.beginTrainingButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.beginTrainingButton.layer.shadowOpacity = 1.0
            self.beginTrainingButton.layer.shadowColor = UIColor.white.cgColor
            self.beginTrainingButton.layer.shadowRadius = 50.0
            
            let animation = CABasicAnimation(keyPath: "shadowRadius")
            animation.fromValue = 30.0
            animation.toValue = 5.0
            animation.autoreverses = true
            animation.duration = 1.0
            animation.repeatCount = .infinity
            self.beginTrainingButton.layer.add(animation, forKey: "shadowRadius")
        }
    }
    
    var beginTrainingButtonSubstrate: UIView! {
        didSet {
            self.beginTrainingButtonSubstrate.backgroundColor = UIColor.yellow
            self.beginTrainingButtonSubstrate.layer.cornerRadius = 75.0
            self.beginTrainingButtonSubstrate.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.beginTrainingButtonSubstrate.layer.shadowColor = UIColor.black.cgColor
            self.beginTrainingButtonSubstrate.layer.shadowRadius = 10.0
            self.beginTrainingButtonSubstrate.layer.shadowOpacity = 1.0
        }
    }

    var yourSuccessButton: UIButton! {
        didSet {
            let bottomOffset: CGFloat = 37.0
            let width: CGFloat = 240.0
            let height: CGFloat = 40.0
            let x = (self.view.bounds.size.width - width) / 2.0
            let y = self.view.bounds.size.height - bottomOffset - height
            
            self.yourSuccessButton.setTitle("Твои успехи", for: .normal)
            self.yourSuccessButton.setTitleColor(UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9), for: .normal)
            self.yourSuccessButton.titleLabel?.textAlignment = .center
            self.yourSuccessButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 20.0)
            self.yourSuccessButton.frame = CGRect(x: x, y: y, width: width, height: height)
            self.yourSuccessButton.layer.cornerRadius = height / 2.0
            self.yourSuccessButton.clipsToBounds = true
            
            let gradientLayer = CAGradientLayer()
            let topColor = UIColor(red: 28.0 / 255, green: 159.0 / 255, blue: 143.0 / 255, alpha: 1.0)
            let bottomColor = UIColor(red: 28.0 / 255, green: 140.0 / 255, blue: 136.0 / 255, alpha: 1.0)
            
            let gradientOffset: CGFloat = 45.0
            let startPointX = (x + width / 2 - gradientOffset) / self.view.bounds.size.width
            let startPointY = y / self.view.bounds.size.height
            let endPointX = (x + width / 2 + gradientOffset) / self.view.bounds.size.width
            let endPointY = (y + height) / self.view.bounds.size.height
            
            gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
            gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
            gradientLayer.frame = self.yourSuccessButton.bounds
            self.yourSuccessButton.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    var myTrainingsBarButtonItem: UIBarButtonItem! {
        didSet {
            self.myTrainingsBarButtonItem.tintColor = UIColor.white
            let font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
            let attributes: [NSAttributedStringKey: UIFont] = [.font: font!]
            self.myTrainingsBarButtonItem.setTitleTextAttributes(attributes, for: .normal)
        }
    }
    
    var settingBarButtonItem: UIBarButtonItem! {
        didSet {
            self.settingBarButtonItem.tintColor = UIColor.white
        }
    }
    
    // MARK: - Жизненный цикл UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        self.radialGradientLayer = RadialGradientLayer()
        
        let beginTrainingButtonSize: CGFloat = 150.0
        self.beginTrainingButton = CircleButton(x: (self.view.bounds.size.width - beginTrainingButtonSize) / 2.0,
                                                y: (self.view.bounds.size.height - beginTrainingButtonSize) / 2.0,
                                                size: beginTrainingButtonSize)
        
        self.yourSuccessButton = UIButton(type: .custom)
        
        self.myTrainingsBarButtonItem = UIBarButtonItem(title: "Мои тренировки",
                                                        style: .plain,
                                                        target: nil,
                                                        action: nil)
        
        self.settingBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "settingsIcon"),
                                                    style: .plain,
                                                    target: nil,
                                                    action: nil)
        
        self.view.addSubview(self.beginTrainingButton)
        self.view.addSubview(self.yourSuccessButton)
        self.navigationItem.rightBarButtonItem = self.myTrainingsBarButtonItem
        self.navigationItem.leftBarButtonItem = self.settingBarButtonItem
        self.view.layer.insertSublayer(radialGradientLayer, at: 0)
    }

}

