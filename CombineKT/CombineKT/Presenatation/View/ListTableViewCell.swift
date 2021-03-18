//
//  ListTableViewCell.swift
//  CombineKT
//
//  Created by Chithri Atchibabu (BLR GSS) on 17/03/21.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet private weak var subjectLbl: UILabel!
    @IBOutlet private weak var scoreBtn: UIButton!
    static let cellIndetifier = "ListTableViewCell"
    var score: Int?
    var scoreCompletion: ((Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      //  scoreBtn.tag = self.tag
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func scoreClicked(_ btn: UIButton) {
        scoreCompletion?(score ?? 0)
    }
    
    func setCellDataView(_ data: SubjectModel) {
        self.subjectLbl.text = data.subjectName
        score = data.score
    }
    
}
