//
//  MantrasListVC.swift
//  TestApp
//
//  Created by Sona on 01.02.24.
//

import UIKit

class MantrasListVC: UIViewController {
    
    @IBOutlet weak var mantrasTableView: UITableView!
    @IBOutlet weak var moveView: UIView!
    
    var mantrasList:[Mantras] = []
    
    var tableViewHeaderText = ""
    
    /// an enum of type TableAnimation - determines the animation to be applied to the tableViewCells
    var currentTableAnimation: TableAnimation = .moveUpBounce(rowHeight: 65, duration: 0.85, delay: 0.03)
    
    var animationDuration: TimeInterval = 0.85
    var delay: TimeInterval = 0.05

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI(){
        moveView.layer.borderColor = UIColor.white.withAlphaComponent(0.07).cgColor
        moveView.layer.borderWidth = 1.5
        
        mantrasTableView.separatorStyle = .none
    }
    
    //MARK: - Action
    @IBAction func moveList(_ sender: UIButton){
        currentTableAnimation = TableAnimation.moveUpBounce(rowHeight: 65, duration: animationDuration, delay: delay)
        
        let randomIndex1 = Int.random(in: 0..<mantrasList.count)
        let randomIndex2 = Int.random(in: 0..<mantrasList.count)

        if randomIndex1 != randomIndex2 {
            mantrasList.swapAt(randomIndex1, randomIndex2)
        }
        
        mantrasTableView.reloadData()
    }
    

}

extension MantrasListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mantrasList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MantrasListCellTableViewCell") as? MantrasListCellTableViewCell else { return UITableViewCell()}
        cell.configUI(mntr: mantrasList[indexPath.row])
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           let animation = currentTableAnimation.getAnimation()
           let animator = TableViewAnimator(animation: animation)
           animator.animate(cell: cell, at: indexPath, in: tableView)
       }
    
}
