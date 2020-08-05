//
//  DataStore.swift
//  CollapsedTableView_Example
//
//  Created by Amr El-Sayed on 7/30/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import CollapsedTableView

class DataStore {
    static let all: [CollapsedTableDataProtocol] = {
       var data = [
        CollapsedTableRowData(indexReferenceId: 1, indexLevel: 1, indexTitle: "1. First Row", indexText: "1", indexParent: nil, hasChildern: true),
        CollapsedTableRowData(indexReferenceId: 2, indexLevel: 1, indexTitle: "2. Second Row", indexText: "2", indexParent: nil, hasChildern: true),
        CollapsedTableRowData(indexReferenceId: 3, indexLevel: 1, indexTitle: "3. Third Row", indexText: "3", indexParent: nil, hasChildern: false)
        ]
        data.append(CollapsedTableRowData(indexReferenceId: 11, indexLevel: 2, indexTitle: "1.1 First Row", indexText: "1", indexParent: data[0], hasChildern: true))
        
        data.append(CollapsedTableRowData(indexReferenceId: 12, indexLevel: 2, indexTitle: "1.2 First Row", indexText: "1", indexParent: data[0], hasChildern: false))
        
        data.append(CollapsedTableRowData(indexReferenceId: 13, indexLevel: 3, indexTitle: "1.1.1 First Row", indexText: "1", indexParent: data[3], hasChildern: false))
        
        data.append(CollapsedTableRowData(indexReferenceId: 21, indexLevel: 2, indexTitle: "2.1 Second Row", indexText: "1", indexParent: data[1], hasChildern: false))
        return data
    }()
}
