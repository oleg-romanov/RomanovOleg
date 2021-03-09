//
//  CouncilListViewController.swift
//  Jedi Council
//
//  Created by Teacher on 08.03.2021.
//

import UIKit

protocol CouncilListViewLogic: AnyObject {
    func displayData(_ data: [CouncilMember])
}

class CouncilListViewController: UIViewController, CouncilListViewLogic {
    // MARK: - Properties
    
    lazy var presenter: CouncilListPresentationLogic = CouncilListPresenter(delegate: self)
    lazy var customView: CouncilListView = view as! CouncilListView
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadData()
    }
    
    // MARK: - CouncilListViewLogic
    
    func displayData(_ data: [CouncilMember]) {
        customView.displayData(data)
    }
}
