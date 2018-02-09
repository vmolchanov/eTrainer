import UIKit

class CircleButton: UIView {

    private var button: UIButton!
    var titleLabel: UILabel?
    
    override var backgroundColor: UIColor? {
        willSet(newValue) {
            self.button.backgroundColor = newValue
        }
    }
    
    init(x: CGFloat, y: CGFloat, size: CGFloat) {
        super.init(frame: CGRect(x: x, y: y, width: size, height: size))
        self.button = UIButton(type: .custom)
        self.button.frame = CGRect(x: 0, y: 0, width: size, height: size)
        self.button.clipsToBounds = true
        self.titleLabel = self.button.titleLabel
        
        self.button.layer.cornerRadius = size / 2
        self.layer.cornerRadius = size / 2
        
        self.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String?, for state: UIControlState) {
        self.button.setTitle(title, for: state)
    }
    
    func setTitleColor(_ color: UIColor?, for state: UIControlState) {
        self.button.setTitleColor(color, for: state)
    }
    
    func addSublayer(_ layer: CALayer) {
        self.button.layer.addSublayer(layer)
    }
    
    func insertSublayer(_ layer: CALayer, at idx: UInt32) {
        self.button.layer.insertSublayer(layer, at: idx)
    }
    
    func insertSublayer(_ layer: CALayer, below sibling: CALayer?) {
        self.button.layer.insertSublayer(layer, below: sibling)
    }
    
    func insertSublayer(_ layer: CALayer, above sibling: CALayer?) {
        self.button.layer.insertSublayer(layer, above: sibling)
    }

}
