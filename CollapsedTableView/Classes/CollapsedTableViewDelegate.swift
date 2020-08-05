//
//  CollapsedTableViewDelegate.swift
//  Shamela
//
//  Created by Amr Elsayed on 7/13/20.
//  Copyright © 2020 Smartech. All rights reserved.
//

import UIKit

public protocol CollapsedTableViewDelegate: class {
    func imageForCollapseIcon() -> UIImage
    func firstLevelBackgroundColor() -> UIColor
    func otherLevelsBackgroundColor() -> UIColor
    func firstLevelTextFont() -> UIFont
    func otherLevelsTextFont() -> UIFont
    func firstLevelTextColor() -> UIColor
    func otherLevelsTextColor() -> UIColor
    func didSelectItem(at indexPath: IndexPath, with dataItem: CollapsedTableDataProtocol)
}

extension CollapsedTableViewDelegate {
    func otherLevelsBackgroundColor() -> UIColor {
        return firstLevelBackgroundColor()
    }
    
    func otherLevelsTextFont() -> UIFont {
        return firstLevelTextFont()
    }
    
    func otherLevelsTextColor() -> UIColor {
        return firstLevelTextColor()
    }
}
