//
//  WebService.swift
//  CombineKT
//
//  Created by Chithri Atchibabu (BLR GSS) on 16/03/21.
//
import Foundation

enum WebService {
    
    static func getAllSubjects(_ completion: @escaping (Result<[SubjectModel], Error>) -> Void) {
        let subjects: [SubjectModel] = [.maths, .science, .history, .chemistry]
        completion(.success(subjects))
    }
}
