//
//  ShowDataVC.swift
//  CoreDataConcept
//
//  Created by Rapipay Macintoshn on 09/02/23.
//

import UIKit

class ShowDataVC: UIViewController {

    @IBOutlet weak var employeesTV: UITableView!
    var employees: [Employee]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesTV.delegate = self
        employeesTV.dataSource = self
        employees = CoreDataHelper.shared.load()
    }

}

extension ShowDataVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employee", for: indexPath) as? UITableViewCell
        cell?.textLabel?.text = employees?[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if CoreDataHelper.shared.delete(index: indexPath.row) {
//            employees?.remove(at: indexPath.row)
//            employeesTV.reloadData()
//        }
//        if CoreDataHelper.shared.update(index: indexPath.row) {
//            employees?[indexPath.row].name = "Ashish"
//            employeesTV.reloadData()
//        }
        employees = CoreDataHelper.shared.update(index: indexPath.row)
        employeesTV.reloadData()
    }
}
