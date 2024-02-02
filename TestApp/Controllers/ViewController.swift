//
//  ViewController.swift
//  TestApp
//
//  Created by Sona on 01.02.24.
//

import UIKit

class ViewController: UIViewController {

    var mantrasList:[Mantras] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    private func getData(){
        guard let path = Bundle.main.path(forResource: "Mantras", ofType: "plist") else { return }
        let url = URL(filePath: path)
        let data = try! Data(contentsOf: url)
        guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [[String:AnyObject]] else {return}
        
        mantrasList = plist.compactMap { dict in
            guard let name = dict["name"] as? String, let duration = dict["duration"] as? Int else {
                return nil
            }
            return Mantras(name: name, duration: duration)
        }
    }
    
    
    //MARK: - Action
    
    @IBAction func showMantrasList(_ sender: UIButton){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MantrasListVC") as? MantrasListVC{
            vc.mantrasList = mantrasList
            present(vc, animated: true, completion: nil)
        }
    }

}

