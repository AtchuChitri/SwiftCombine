//
//  ViewController.swift
//  CombineKT
//
//  Created by Chithri Atchibabu (BLR GSS) on 16/03/21.
//
import Combine
import UIKit

class ViewController: UIViewController {

    var allSubjects = [SubjectModel]()
    @IBOutlet private weak var subjectTbl: UITableView!
    private var bag = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let listCellNib = UINib(nibName: String(describing: ListTableViewCell.self),
                                    bundle: Bundle(for: ListTableViewCell.self))
        subjectTbl.register(listCellNib, forCellReuseIdentifier: ListTableViewCell.cellIndetifier)
        getAllSubjects()
        
        
    }
    
    func getAllSubjects() {
        WebService.getAllSubjects().subscribe(on: DispatchQueue.main).sink { [weak self] result in
            guard let self = self else { return }
            self.allSubjects = result
            self.subjectTbl.reloadData()
        }.store(in: &bag)
    }
}

//MARK: - TableviewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSubjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    ListTableViewCell.cellIndetifier)!
        
                
        if let selectionCell = cell as? ListTableViewCell {
            let data = allSubjects[indexPath.row]
            selectionCell.setCellDataView(data)
            selectionCell.scoreCompletion.sink { [weak self] value in
                guard let self = self else { return }
                let alertVC = UIAlertController(title: data.subjectName, message: "\(value)", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertVC.addAction(alertAction)
                self.present(alertVC, animated: false) {
                    //done
                }
            }.store(in: &bag)

        }
        return cell
        
    }
    
    
}
