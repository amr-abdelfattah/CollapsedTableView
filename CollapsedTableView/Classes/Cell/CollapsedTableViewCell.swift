//
//  CollapsedTableViewCell.swift
//  Shamela
//
//  Created by Amr Elsayed on 7/13/20.
//  Copyright © 2020 Smartech. All rights reserved.
//

import UIKit

public class CollapsedTableViewCell: UITableViewCell {
    private var collapsedDataItem: CollapsedTableDataProtocol!
    private weak var collapsedTableDelegate: CollapsedTableViewDelegate!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var indexNumberLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with collapsedDataItem: CollapsedTableDataProtocol, collapsedTableDelegate: CollapsedTableViewDelegate) {
        self.collapsedDataItem = collapsedDataItem
        self.collapsedTableDelegate = collapsedTableDelegate
        setupHidden()
        setupAccessoryType()
        setupBackgroundColor()
        setupLabelStyle()
        setLabelText()
    }
    
    private func setupHidden() {
        isHidden = !(collapsedDataItem.isParentExpanded)
    }
    
    private func setupAccessoryType() {
        if collapsedDataItem.isLastLevel {
            accessoryView = nil
            accessoryType = .disclosureIndicator
        } else {
            accessoryView = createAppropriateIconImageView()
        }
    }
    
    func rotateAccView() {
        if collapsedDataItem.indexIsExpanded {
            UIView.animate(withDuration: 0.3) {
                self.accessoryView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.accessoryView?.transform = .identity
            }
        }
    }
    
    private func createAppropriateIconImageView() -> UIImageView {
        var iconImage = collapsedTableDelegate.imageForCollapseIcon()
        if collapsedDataItem.indexIsExpanded {
            iconImage = collapsedTableDelegate.imageForCollapseIcon()
                .flipDownMirrored()
        }
        let iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        iconImageView.image = iconImage
        iconImageView.contentMode = .scaleAspectFit
        return iconImageView
    }
    
    private func setLabelText() {
        let spaceText = String(repeating: "  ", count: collapsedDataItem.indexLevel - 1)
        titleLabel.text = "\(spaceText)\(collapsedDataItem.indexTitle)"
        indexNumberLabel.text = "\(collapsedDataItem.indexText)"
    }
    
    private func setupBackgroundColor() {
        if collapsedDataItem.isFirstLevel {
            backgroundColor = collapsedTableDelegate.firstLevelBackgroundColor()
        } else {
            backgroundColor = collapsedTableDelegate.otherLevelsBackgroundColor()
        }
    }
    
    private func setupLabelStyle() {
        var color = collapsedTableDelegate.otherLevelsTextColor()
        var font = collapsedTableDelegate.otherLevelsTextFont()
        if collapsedDataItem.isFirstLevel {
            color = collapsedTableDelegate.firstLevelTextColor()
            font = collapsedTableDelegate.firstLevelTextFont()
        }
        titleLabel.textColor = color
        indexNumberLabel.textColor = color
        titleLabel.font = font
        indexNumberLabel.font = font
    }
}

extension UIImage {
    func flipDownMirrored() -> UIImage {
        var image = self
        if let cgIconImage = cgImage {
            image = UIImage(
            cgImage: cgIconImage,
            scale: 1.0,
            orientation: .downMirrored)
        }
        return image
    }
}
