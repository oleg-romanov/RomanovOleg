//
//  CouncilListView.swift
//  Jedi Council
//
//  Created by Олег Романов on 3/9/21.
//

import UIKit

class CouncilListView: UIView {
    // MARK: - Properties
    
    @IBOutlet private var collectionView: UICollectionView!
    private var members: [CouncilMember] = []
    
    private let cellId: String = "Cell"
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Internal methods
    
    func displayData(_ data: [CouncilMember]) {
        members = data
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension CouncilListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // ?
//        service.loadMemberDetails(id: members[indexPath.item].id) { [self] result in
//            switch result {
//                case .success(let memberDetails):
//                    let viewController: CouncilMemberViewController = storyboard!.instantiateViewController(identifier:  "CouncilMemberViewController")
//                    navigationController?.pushViewController(viewController, animated: true)
//                    viewController.set(member: memberDetails)
//                case .failure(let error):
//                    print(error)
//            }
//        }
    }
}

// MARK: - UICollectionViewDataSource

extension CouncilListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CouncilMemberCell else {
            fatalError("Could not dequeue cell")
        }

        cell.set(member: members[indexPath.item])
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        members.count
    }
}
