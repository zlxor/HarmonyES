//
//  TriggerNodesViewController.swift
//  HarmonyES
//
//  Created by LingXuan Zhao on 2022/3/13.
//

import UIKit

class TriggerNodesViewController: UIViewController {

    private var models = [EnergyNode]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(EnergyNodeCell.self, forCellReuseIdentifier: EnergyNodeCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        demoDataGenerize()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func demoDataGenerize() {
        models.append(EnergyNode(id: 1002, name: "Solar Energy PV", type: .photovoltaics, parameter: 324.78, status: true, user: "Annan", target: false))
        models.append(EnergyNode(id: 1004, name: "City consumption", type: .consumption, parameter: -68.25, status: true, user: "Annan", target: false))
        models.append(EnergyNode(id: 1003, name: "Giant Wind Power", type: .wind_power, parameter: 223.14, status: false, user: "Annan", target: false))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let length = view.width * 0.8
        let startX = (view.width - length) / 2
        tableView.frame = CGRect(x: startX, y: 20, width: length, height: 700)
    }
}


extension TriggerNodesViewController: UITableViewDelegate, UITableViewDataSource, EnergyNodeCellDelegate {
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
