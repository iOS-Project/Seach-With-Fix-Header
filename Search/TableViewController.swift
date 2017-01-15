//
//  TableViewController.swift
//  Search
//
//  Created by Lun Sovathana on 1/12/17.
//  Copyright © 2017 Lun Sovathana. All rights reserved.
//

import UIKit

let searchCell = "SearchCell"
let optionCell = "OptionCell"
let segmentCell = "SegmentCell"
let itemCell = "ItemCell"

class TableViewController: UITableViewController {
    
    var searchButton : UIBarButtonItem?
    var vHeader : UIView? = nil
    var searchBar : UISearchController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: searchCell, bundle: nil), forCellReuseIdentifier: searchCell)
        
        tableView.register(UINib(nibName: optionCell, bundle: nil), forCellReuseIdentifier: optionCell)
        
        tableView.register(UINib(nibName: segmentCell, bundle: nil), forCellReuseIdentifier: segmentCell)
        
        tableView.register(UINib(nibName: itemCell, bundle: nil), forCellReuseIdentifier: itemCell)
        
        tableView.bounces = false
        
        addSearchButton()
        addSegment()
    }
    
    func addSegment(){
        vHeader = HeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 50))
    }
    
    func addSearchButton(){
        searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonClick(_:)))
        
        searchBar = UISearchController(searchResultsController: nil)
        searchBar?.searchBar.sizeToFit()
        searchBar?.hidesNavigationBarDuringPresentation = false
    }
    
    func toggleSearchButton(_ show:Bool){
        if show{
            navigationItem.rightBarButtonItem = searchButton
        }else{
            navigationItem.rightBarButtonItem = nil
        }
        
        navigationItem.titleView = nil
    }
    
    func searchButtonClick(_ sender:UIBarButtonItem){
        
        self.navigationItem.titleView = searchBar?.searchBar
        navigationItem.rightBarButtonItem = nil
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let rect = tableView.rectForRow(at: IndexPath(row: 0, section: 0))
        if scrollView.contentOffset.y > rect.origin.y{
            toggleSearchButton(true)
        }else{
            toggleSearchButton(false)
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 2
        case 1:
            return 50
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: optionCell, for: indexPath) as! OptionCell
            cell.sizeToFit()
            return cell
        }else if indexPath.section == 0 && indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: searchCell, for: indexPath) as! SearchCell
            cell.sizeToFit()
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: itemCell, for: indexPath) as! ItemCell
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Search"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section{
        case 1:
            return 50
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section{
        case 1:
            return vHeader
        default:
            return nil
        }
    }
    
}
