//
//  CouncilMoyaService.swift
//  Jedi Council
//
//  Created by Олег Романов on 3/9/21.
//

import Moya

class CouncilMoyaService: CouncilService {
    let dataProvider = MoyaProvider<CouncilServiceApi>()
    
    func loadMembers(completion: @escaping (Result<[CouncilMember], Error>) -> Void) {
        dataProvider.request(.councilList) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let response = try moyaResponse.map([CouncilMember].self)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func loadMemberDetails(id: String, completion: @escaping (Result<CouncilMemberDetails, Error>) -> Void) {
        
    }
}
