//
//  CollapsedTableData.swift
//  Shamela
//
//  Created by Amr Elsayed on 7/13/20.
//  Copyright © 2020 Smartech. All rights reserved.
//

import Foundation

public protocol CollapsedTableDataProtocol: class {
    var indexReferenceId: Int { get }
    var indexTitle: String { get }
    var indexText: String { get }
    var indexParent: CollapsedTableDataProtocol? { get }
    var hasChildern: Bool { get }
//    var indexChildern: [CollapsedTableDataProtocol]? { get }
    var indexLevel: Int { get }
    var indexIsExpanded: Bool { set get }
}

public extension CollapsedTableDataProtocol {
    var isLastLevel: Bool {
        return !hasChildern
    }
    
    var isFirstLevel: Bool {
        return indexParent == nil
    }
    
    var isParentExpanded: Bool {
        return indexParent?.indexIsExpanded ?? true
    }
    
//    var indexChildern: [CollapsedTableDataProtocol]? {
//        return nil
//    }
    
//    var hasChildern: Bool {
//        return !(indexChildern == nil || indexChildern!.count == 0)
//    }
}
