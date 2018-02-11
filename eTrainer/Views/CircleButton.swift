import UIKit

class CircleButton: UIView {

    private var button: UIButton!
    
    var titleLabel: UILabel?
    
    override var backgroundColor: UIColor? {
        willSet(newValue) {
            self.button.backgroundColor = newValue
        }
    }
    
    /// Конструктор, принимающий координаты и размер круглой кнопки.
    /// - parameter x: Координата X.
    /// - parameter y: Координата Y.
    /// - parameter size: Размер кнопки (диаметр окружности).
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
    
    /// Устанавливает заголовок для определенного состояния.
    /// Используйте этот метод, чтобы установить заголовок для кнопки.
    /// - parameter title: Заголовок, который используется для определенного состояния.
    /// - parameter state: Состояние, которое используется для определенного заголовка. Возможный значения описаны в
    ///   UIControlState.
    func setTitle(_ title: String?, for state: UIControlState) {
        self.button.setTitle(title, for: state)
    }
    
    /// Устанавливает цвет заголовка для специального состояния.
    /// В общем, если свойству не задано определеное состояние, то по умолчанию используется значение normal. Если
    /// значение normal не установлено, то по умолчанию используется системное значение. Поэтому, как минимум, следует
    /// установить значение для нормального состояния.
    /// - parameter color: Цвет заголовка, который используется для определенного состояния.
    /// - parameter state: Состояние, которое используется с определенным цветом. Возможный значения описаны в
    ///   UIControlState.
    func setTitleColor(_ color: UIColor?, for state: UIControlState) {
        self.button.setTitleColor(color, for: state)
    }
    
    /// Вставляет слой в список подслоев.
    /// Если свойство массива подслоев nil, то метод создает массив в этом свойстве и добавляет туда определенный слой.
    func addSublayer(_ layer: CALayer) {
        self.button.layer.addSublayer(layer)
    }
    
    /// Вставить полученный слой в список подслоев по указанному индексу.
    /// - parameter layer: Подслой, который вставляется в текущий слой.
    /// - parameter idx: Индекс, по которому вставляется подслой. Это значение должно быть от 0 до конечного индекса
    ///   массива подслоев.
    func insertSublayer(_ layer: CALayer, at idx: UInt32) {
        self.button.layer.insertSublayer(layer, at: idx)
    }
    
    /// Вставляет указанный подслой под другой подслой, который уже принадлежит получателю.
    /// Если подслоя в массиве подслоев нет, то этот метод вызывает исключение.
    /// - parameter layer: Подслой, который вставляется в текущий слой.
    /// - parameter sibling: Существующий подслой в текущем слое. Слой вставляется в массив подслоев перед текущим
    ///   слоем и таким образом появляется позади него визуально.
    func insertSublayer(_ layer: CALayer, below sibling: CALayer?) {
        self.button.layer.insertSublayer(layer, below: sibling)
    }
    
    /// Вставляет указанный подслой над другим слоем, который уже принадлежит получателю.
    /// - parameter layer: Подслой, который вставляется в текущий слой.
    /// - parameter sibling: Существующий подслой в текущем слое. Слой вставляется в массив подслоев после текущего
    ///   слоя и таким образом появляется перед ним визуально.
    func insertSublayer(_ layer: CALayer, above sibling: CALayer?) {
        self.button.layer.insertSublayer(layer, above: sibling)
    }

}
