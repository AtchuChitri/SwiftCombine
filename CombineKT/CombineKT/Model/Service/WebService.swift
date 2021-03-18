//
//  WebService.swift
//  CombineKT
//
//  Created by Chithri Atchibabu (BLR GSS) on 16/03/21.
//
import Combine
import Foundation

enum WebService {
    
    static func getAllSubjects() -> Future<[SubjectModel], Never> {
        let subjects: [SubjectModel] = [.maths, .science, .history, .chemistry]
        return Future { promise in
            promise(.success(subjects))
        }
    }
}


