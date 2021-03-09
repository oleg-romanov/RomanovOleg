//
//  CouncilServiceApi.swift
//  Jedi Council
//
//  Created by Олег Романов on 3/9/21.
//

import Moya

enum CouncilServiceApi {
    case councilList
    case council(id: String)
}

extension CouncilServiceApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com/AZigangaraev/ITIS_2020_2_CW_1/main/")!
    }
    
    var path: String {
        switch self {
        case .councilList:
            return "council.json"
        case let .council(id):
            return "members/\(id).json"
        }
    }
    
    var method: Method {
        .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        [:]
    }
}
