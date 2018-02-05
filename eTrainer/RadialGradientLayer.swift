import UIKit

class RadialGradientLayer: CALayer {
    
    var center: CGPoint!
    var radius: CGFloat!
    private var colors: [CGColor]!
    var locations: [CGFloat]!
    
    init(withColors colors: [CGColor]) {
        super.init()
        
        self.colors = colors
        self.center = CGPoint(x: 0.0, y: 0.0)
        self.radius = 1
        self.locations = [0.0 as CGFloat, 1.0 as CGFloat]
        self.needsDisplayOnBoundsChange = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(layer: Any) {
        super.init(layer: layer)
    }
    
    override func draw(in context: CGContext) {
        context.saveGState()
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace, colors: self.colors as CFArray, locations: self.locations)
        context.drawRadialGradient(gradient!,
                                   startCenter: self.center,
                                   startRadius: 0.0,
                                   endCenter: self.center,
                                   endRadius: self.radius,
                                   options: CGGradientDrawingOptions(rawValue: 0))
    }
    
}
