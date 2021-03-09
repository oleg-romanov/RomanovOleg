//
//  CouncilListPresenter.swift
//  Jedi Council
//
//  Created by Олег Романов on 3/9/21.
//

import Foundation

protocol CouncilListPresentationLogic: AnyObject {
    func loadData()
}

class CouncilListPresenter: CouncilListPresentationLogic {
    private let service: CouncilService = CouncilMoyaService()
    weak var delegate: CouncilListViewLogic?
    
    init(delegate: CouncilListViewLogic) {
        self.delegate = delegate
    }
    
    func loadData() {
        service.loadMembers { [self] result in
            switch result {
                case .success(let members):
                    delegate?.displayData(members)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
