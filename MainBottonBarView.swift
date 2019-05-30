//
//  MainButtonBarView.swift
//  Initfy
//
//  Created by Aitor Personal on 14/10/2018.
//  Copyright © 2018 Aitor. All rights reserved.
//

import UIKit
import Reusable
import SnapKit

public enum MainBarOption {
    case discover
    case build
    case profile
}

public struct BottomBarItem {
    var image: UIImage
    var onTap: (() -> Void)?
    
    public init(image: UIImage, onTap: (() -> Void)?) {
        self.image = image
        self.onTap = onTap
    }
}

public enum BottomBarAnimation {
    case jump
}

public protocol MainButtonBarViewDelegate: class {
    func optionDidChange(_ option: MainBarOption)
}

public class MainBottonBarView: UIView, NibOwnerLoadable {
    
    let impact = UIImpactFeedbackGenerator(style: .medium)
    var shouldHaptic: Bool = true
    
    @IBOutlet weak var otMainIconStackView: UIStackView!
    @IBOutlet weak var otView: UIView!
 
    weak var delegate: MainButtonBarViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNibContent()
        configureView()
    }
    
    public func setItems(_ items: [BottomBarItem]) {
        otMainIconStackView.resetAllViews()
        for item in items {
            let view = UIView()
            let button = UIButton()
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = item.image
            view.addSubview(imageView)
            view.addSubview(button)
            imageView.bindFrameToSuperviewBounds()
            button.bindFrameToSuperviewBounds()
            otMainIconStackView.addArrangedSubview(view)
            button.addAction { [weak self] in
                self?.animateWhenTouched(view)
                if self?.shouldHaptic ?? true {
                    self?.impact.impactOccurred()
                }
                item.onTap?()
                
            }
        }
    }
    
    private func animateWhenTouched(_ item: UIView) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
            item.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
                item.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
            })
        }
    }
    
    private func configureView() {
        otView.backgroundColor = .clear
        layer.masksToBounds = true
        layer.cornerRadius = frame.height/2
    }
    
    public func startAnimation() {
        self.snp.updateConstraints { maker in
            maker.width.equalToSuperview().multipliedBy(0.85)
        }
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.layoutIfNeeded()
        })
    }
}

public class ClosureSleeve {
    let closure: () -> ()
    
    public init(attachTo: AnyObject, closure: @escaping () -> ()) {
        self.closure = closure
        objc_setAssociatedObject(attachTo, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc public func invoke() {
        closure()
    }
}
