//
//  Shape.swift
//  DynamicMenu
//
//  Created by Marcy Vernon on 10/25/20.
//

import UIKit

class Shape: UIButton {
    
    var segue: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func shape(_ shape: ShapeType) -> Self {
        
        if shape == .circle {
            layer.cornerRadius = frame.size.height / 2
            clipsToBounds = true
        }
        
        if shape == .roundedSquare {
            layer.cornerRadius = frame.size.height / 5
            clipsToBounds = true
        }
        
        isUserInteractionEnabled = true
        return self
    }
    
    func color(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
    
    func borderColor(_ color: UIColor, width: CGFloat) -> Self {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }
    
    func shadow(_ isOn: Bool) -> Self {
        if isOn == true {
            clipsToBounds       = false
            layer.shadowColor   = UIColor.black.cgColor
            let height          = CGFloat.random(in     : (0.0 ... 15.0))
            layer.shadowOffset  = CGSize(width : 0.0, height : height)
            layer.shadowOpacity = 0.6
        }
        return self
    }
    
    func title(_ title: String, font: String, fontSize: CGFloat, titleColor: UIColor) -> Self {
        
        titleLabel?.frame = CGRect(x     : 0,
                                   y     : self.frame.size.height / 2 - 10,
                                   width : self.frame.size.width,
                                   height: fontSize + 4)
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.textAlignment = .center
        contentVerticalAlignment = .center
        titleLabel?.font = UIFont(name: font, size: fontSize)
        return self
    }
    
    func segue(_ segue: String?) -> Self {
        self.segue = segue
        return self
    }
    
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
