//
//  CollapsedTableRowData.swift
//  CollapsedTableView_Example
//
//  Created by Amr El-Sayed on 7/30/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import CollapsedTableView

class CollapsedTableRowData: CollapsedTableDataProtocol {
    var indexReferenceId: Int
    
    var indexTitle: String
    
    var indexText: String
    
    var indexParent: CollapsedTableDataProtocol?
        
    var indexLevel: Int
    
    var hasChildern: Bool
    
    var indexIsExpanded: Bool = false
    
    init(indexReferenceId: Int, indexLevel: Int, indexTitle: String, indexText: String, indexParent: CollapsedTableDataProtocol?, hasChildern: Bool) {
        self.indexReferenceId = indexReferenceId
        self.indexLevel = indexLevel
        self.indexTitle = indexTitle
        self.indexText = indexText
        self.indexParent = indexParent
        self.hasChildern = hasChildern
    }
}
