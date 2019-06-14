//
//  CardContentView.swift
//  AppStoreHomeInteractiveTransition
//
//  Created by Wirawit Rueopas on 3/4/2561 BE.
//  Copyright © 2561 Wirawit Rueopas. All rights reserved.
//

import UIKit

@IBDesignable final class CardContentView: UIView, NibLoadable {

    var viewModel: CardContentViewModel? {
        didSet {
            primaryLabel.text = viewModel?.primary
            secondaryLabel.text = viewModel?.secondary
            detailLabel.text = viewModel?.description
            imageView.image = viewModel?.image
        }
    }

    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!

    @IBOutlet weak var imageToTopAnchor: NSLayoutConstraint!
    @IBOutlet weak var imageToLeadingAnchor: NSLayoutConstraint!
    @IBOutlet weak var imageToTrailingAnchor: NSLayoutConstraint!
    @IBOutlet weak var imageToBottomAnchor: NSLayoutConstraint!
    @IBOutlet weak var secondaryLabelToTopAnchor: NSLayoutConstraint!
    
    @IBInspectable var backgroundImage: UIImage? {
        get {
            return self.imageView.image
        }

        set(image) {
            self.imageView.image = image
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fromNib()
        commonSetup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        fromNib()
        commonSetup()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        commonSetup()
    }

    private func commonSetup() {
        // *Make the background image stays still at the center while we animationg,
        // else the image will get resized during animation.
        imageView.contentMode = .center
        setFontState(isHighlighted: false)
        setTopAnchor()
    }

    // This "connects" highlighted (pressedDown) font's sizes with the destination card's font sizes
    func setFontState(isHighlighted: Bool) {
        if isHighlighted {
            primaryLabel.font = UIFont.systemFont(ofSize: 36 * GlobalConstants.cardHighlightedFactor, weight: .bold)
            secondaryLabel.font = UIFont.systemFont(ofSize: 18 * GlobalConstants.cardHighlightedFactor, weight: .semibold)
        } else {
            primaryLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
            secondaryLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        }
    }
    
    func setTopAnchor() {
        switch UIDevice().type {
        case .iPhone5, .iPhone5C, .iPhone5S, .iPhoneSE, .iPhone6, .iPhone6S:
            secondaryLabelToTopAnchor.constant = 20
        case .iPhone6plus, .iPhone6Splus, .iPhone7, .iPhone7plus, .iPhone8, .iPhone8plus:
            secondaryLabelToTopAnchor.constant = 24
        case .iPhoneX, .iPhoneXS, .iPhoneXR, .iPhoneXSMax:
            secondaryLabelToTopAnchor.constant = 36
        default:
            secondaryLabelToTopAnchor.constant = 24
        }
    }
}
