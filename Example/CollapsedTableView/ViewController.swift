//
//  ViewController.swift
//  CollapsedTableView
//
//  Created by amr-abdelfattah on 07/21/2020.
//  Copyright (c) 2020 amr-abdelfattah. All rights reserved.
//

import UIKit
import CollapsedTableView

class ViewController: UIViewController {
    @IBOutlet weak var collapsedTableView: CollapsedTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }
    
    private func reloadData() {
        collapsedTableView.reloadData(with: DataStore.all, collapsedTableViewDelegate: self)
    }
}

extension ViewController: CollapsedTableViewDelegate {
    func imageForCollapseIcon() -> UIImage {
        UIImage(named: "ic_collapse")!
    }
    
    func firstLevelBackgroundColor() -> UIColor {
        .white
    }
    
    func otherLevelsBackgroundColor() -> UIColor {
        .lightGray
    }
    
    func firstLevelTextFont() -> UIFont {
        .systemFont(ofSize: 16.0, weight: .bold)
    }
    
    func otherLevelsTextFont() -> UIFont {
        .systemFont(ofSize: 14.0)
    }
    
    func firstLevelTextColor() -> UIColor {
        .black
    }
    
    func otherLevelsTextColor() -> UIColor {
        .darkGray
    }
    
    func didSelectItem(at indexPath: IndexPath,
                       with dataItem: CollapsedTableDataProtocol) {
        let alertView = UIAlertController(title: "Selected Item", message: dataItem.indexTitle, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertView, animated: true, completion: nil)
    }
}
