//
//  CollapsedTableView.swift
//  Shamela
//
//  Created by Amr Elsayed on 7/13/20.
//  Copyright © 2020 Smartech. All rights reserved.
//

import UIKit

public class CollapsedTableView: UITableView {
    weak var collapsedTableViewDelegate: CollapsedTableViewDelegate?
    private var data: [CollapsedTableDataProtocol] = []
    private var allData: [CollapsedTableDataProtocol] = [] {
        didSet {
            refreshData()
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        initTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initTableView()
    }
    
    private func initTableView() {
        registerTableViewCell()
        setupDelegate()
    }
    
    private func registerTableViewCell() {
        let identifier = String(describing: CollapsedTableViewCell.self)
        register(UINib(nibName: identifier,
                       bundle: Bundle(for: CollapsedTableViewCell.self)),
                 forCellReuseIdentifier: identifier)
    }
    
    private func setupDelegate() {
        self.dataSource = self
        self.delegate = self
    }
    
    public func reloadData(with data: [CollapsedTableDataProtocol], collapsedTableViewDelegate: CollapsedTableViewDelegate) {
        self.collapsedTableViewDelegate = collapsedTableViewDelegate
        allData = data
        reloadData()
    }
    
    private func refreshData() {
        data = allData.filter({ $0.isParentExpanded })
    }
}

extension CollapsedTableView {
    private func didClickParent(_ parentItem: CollapsedTableDataProtocol, at indexPath: IndexPath) {
        let startIndex = indexPath.row + 1
        let childern = parentItem.indexIsExpanded
            ? Array(collapseParent(parentItem).suffix(from: 1))
            : expandParent(parentItem)
        let indexPaths = Array(
            startIndex ..< startIndex + childern.count)
            .map({ IndexPath(row: $0, section: 0) })
        parentItem.indexIsExpanded
            ? data.insert(contentsOf: childern, at: startIndex)
            : data.removeAll(where: { item in
                childern.contains(where: { $0 === item })
            })
        parentItem.indexIsExpanded
            ? insertRows(at: indexPaths, with: .top)
            : deleteRows(at: indexPaths, with: .bottom)
    }
    
    private func childern(of parentItem: CollapsedTableDataProtocol) -> [CollapsedTableDataProtocol] {
        return allData.filter({
            return $0.indexParent != nil && $0.indexParent! === parentItem
            })
    }
    
    private func collapseParent(_ parentItem: CollapsedTableDataProtocol)
        -> [CollapsedTableDataProtocol] {
        var childernList = [parentItem]
        let parentChildern = childern(of: parentItem)
        if parentItem.indexIsExpanded {
            parentChildern.forEach({
                childernList.append(contentsOf: collapseParent($0))
            })
        }
        parentItem.indexIsExpanded = false
        return childernList
    }
    
    private func expandParent(_ parentItem: CollapsedTableDataProtocol)
        -> [CollapsedTableDataProtocol] {
        parentItem.indexIsExpanded = true
        return childern(of: parentItem)
    }
}

extension CollapsedTableView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard data[indexPath.row].isParentExpanded else {
            return UITableViewCell()
        }
        let identifier = String(describing: CollapsedTableViewCell.self)
        if let cell = dequeueReusableCell(withIdentifier: identifier) as? CollapsedTableViewCell,
            let collapsedTableViewDelegate = collapsedTableViewDelegate {
            cell.configure(with: data[indexPath.row],
                           collapsedTableDelegate: collapsedTableViewDelegate)
            return cell
        }
        return UITableViewCell()
    }
}

extension CollapsedTableView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectRow(at: indexPath, animated: true)
        let currentItem = data[indexPath.row]
        if currentItem.isLastLevel {
            collapsedTableViewDelegate?.didSelectItem(at: indexPath, with: currentItem)
        } else {
            didClickParent(currentItem, at: indexPath)
        }
        let cell = tableView.cellForRow(at: indexPath) as? CollapsedTableViewCell
        cell?.rotateAccView()
    }
}
