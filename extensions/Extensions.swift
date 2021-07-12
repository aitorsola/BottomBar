//
//  Extensions.swift
//  BottomBar
//
//  Created by Aitor Personal on 30/05/2019.
//  Copyright © 2019 AitorSola. All rights reserved.
//

import UIKit

public extension UIStackView {
  func resetAllViews() {
    let removedSubviews = self.arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
      self.removeArrangedSubview(subview)
      return allSubviews + [subview]
    }
    
    // Deactivate all constraints
    NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
    
    // Remove the views from self
    removedSubviews.forEach({ $0.removeFromSuperview() })
  }
}

public extension UIView {
  func bindFrameToSuperviewBounds() {
    guard let superview = self.superview else {
      print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
      return
    }
    
    self.translatesAutoresizingMaskIntoConstraints = false
    superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
  }
}

public extension UIControl {
  func addAction(for controlEvents: UIControl.Event = .touchUpInside, action: @escaping () -> ()) {
    let sleeve = ClosureSleeve(attachTo: self, closure: action)
    addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
  }
}
