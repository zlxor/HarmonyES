//
//  MangerViewController.swift
//  HarmonyES
//
//  Created by LingXuan Zhao on 2022/3/13.
//

import UIKit

enum EnergyNodeType {
    case photovoltaics
    case wind_power
    case consumption
    case fossil_fuel
    case storage
}

struct EnergyNode {
    let id: Int
    let name: String
    let type: EnergyNodeType
    let parameter: CGFloat
    let status: Bool
    let user: String
    let target: Int
}

class MangerViewController: UIViewController {
    
    private var models = [EnergyNode]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(EnergyNodeCell.self, forCellReuseIdentifier: EnergyNodeCell.identifier)
        return tableView
    }()
    
    private let addBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.backgroundColor = .init(red: 0, green: 200 / 255, blue: 30 / 255, alpha: 0.8)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demoDataGenerize()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(addBtn)
    }
    
    private func demoDataGenerize() {
        models.append(EnergyNode(id: 1001, name: "Photovoltaics Tech", type: .photovoltaics, parameter: 1, status: false, user: "Junzhe", target: 0))
        models.append(EnergyNode(id: 1002, name: "Solar Energy PV", type: .photovoltaics, parameter: 1, status: true, user: "Annan", target: 0))
        models.append(EnergyNode(id: 1003, name: "Giant Wind Power", type: .wind_power, parameter: 1, status: false, user: "Annan", target: 0))
        models.append(EnergyNode(id: 1004, name: "City consumption", type: .consumption, parameter: 1, status: true, user: "Annan", target: 0))
        models.append(EnergyNode(id: 1005, name: "Strong-Wind", type: .wind_power, parameter: 1, status: false, user: "Junzhe", target: 0))
        models.append(EnergyNode(id: 1006, name: "City consumption2", type: .consumption, parameter: 1, status: false, user: "Junzhe", target: 0))
        models.append(EnergyNode(id: 2001, name: "Intelligent Storage System", type: .storage, parameter: 1, status: true, user: "Annan", target: 0))
        models.append(EnergyNode(id: 2002, name: "Clean Fuel Home", type: .fossil_fuel, parameter: 1, status: true, user: "Annan", target: 0))
        models.append(EnergyNode(id: 2003, name: "Fuel For Future", type: .fossil_fuel, parameter: 1, status: false, user: "Junzhe", target: 0))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let length = view.width * 0.8
        let startX = (view.width - length) / 2
        tableView.frame = CGRect(x: startX, y: 20, width: length, height: 700)
        addBtn.frame = CGRect(x: (view.width - 100) / 2, y: 730, width: 100, height: 40)
    }

}

extension MangerViewController: UITableViewDelegate, UITableViewDataSource, EnergyNodeCellDelegate {
    func didTapEditButton() {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: EnergyNodeCell.identifier, for: indexPath) as! EnergyNodeCell
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
}
