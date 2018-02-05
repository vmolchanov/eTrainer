import UIKit

class MainViewController: UIViewController {

    var radialGradientLayer: RadialGradientLayer! {
        didSet {
            let xCenter = self.view.bounds.size.width / 2.0
            let yCenter = self.view.bounds.size.height / 2.0
            let multiplierOfDispersion = 2.0 as CGFloat
            radialGradientLayer.center = CGPoint(x: xCenter, y: yCenter)
            radialGradientLayer.radius = max(xCenter, yCenter) * multiplierOfDispersion
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topColor = UIColor(red: 233.0 / 255, green: 219.0 / 255, blue: 219.0 / 255, alpha: 1.0)
        let bottomColor = UIColor(red: 4.0 / 255, green: 19.0 / 255, blue: 74.0 / 255, alpha: 1.0)
        
        self.radialGradientLayer = RadialGradientLayer(withColors: [topColor.cgColor, bottomColor.cgColor])
        self.radialGradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(radialGradientLayer, at: 0)
    }

}

