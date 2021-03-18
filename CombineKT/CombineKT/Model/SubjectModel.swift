//
//  SubjectModel.swift
//  CombineKT
//
//  Created by Chithri Atchibabu (BLR GSS) on 16/03/21.
//

import Foundation

struct SubjectModel: Codable  {
    
    let subjectName: String?
    let score: Int?
}

extension SubjectModel {
    static let maths = SubjectModel(subjectName: "Mathmatics", score: 100)
    static let history = SubjectModel(subjectName: "Social", score: 80)
    static let science = SubjectModel(subjectName: "Science", score: 90)
    static let chemistry = SubjectModel(subjectName: "Chemistry", score: 70)
}
