//
//  EnergyNodeCell.swift
//  HarmonyES
//
//  Created by LingXuan Zhao on 2022/3/13.
//

import UIKit

protocol EnergyNodeCellDelegate: AnyObject {
    func didTapEditButton()
}

class EnergyNodeCell: UITableViewCell {
    static let identifier = "EnergyNodeCell"
    
    weak var delegate: EnergyNodeCellDelegate?
    
    private var model: EnergyNode?
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private let userLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let statusBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.titleLabel?.textAlignment = .right
        return button
    }()
    
    private let editBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(idLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userLabel)
        contentView.addSubview(statusBtn)
        contentView.addSubview(editBtn)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getString(type: EnergyNodeType) -> String {
        switch type {
        case .photovoltaics:
            return "photovoltaics"
        case .wind_power:
            return "wind_power"
        case .consumption:
            return "consumption"
        case .storage:
            return "storage"
        case .fossil_fuel:
            return "fossil_fuel"
        }
    }
    
    public func configure(with model: EnergyNode) {
        self.model = model
        idLabel.text = "ID: " + String(model.id)
        typeLabel.text = "type: " + getString(type: model.type)
        nameLabel.text = "name: " + model.name
        userLabel.text = model.user
        if model.target == true {
            editBtn.backgroundColor = .init(red: 0, green: 30 / 255, blue: 200 / 255, alpha: 0.8)
            editBtn.setTitle("Edit", for: .normal)
            if model.status == true {
                statusBtn.setTitle("running", for: .normal)
                statusBtn.setTitleColor(.init(red: 0, green: 160/255, blue: 40/255, alpha: 1), for: .normal)
            } else {
                statusBtn.setTitle("closed", for: .normal)
                statusBtn.setTitleColor(.red, for: .normal)
            }
        } else {
            statusBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            if model.status == true {
                editBtn.setTitle("para: \(model.parameter)", for: .normal)
                editBtn.setTitleColor(.init(red: 0, green: 160/255, blue: 40/255, alpha: 1), for: .normal)
                editBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
                editBtn.titleLabel?.textAlignment = .right
                statusBtn.setTitle("close", for: .normal)
                statusBtn.backgroundColor = .red
            } else {
                editBtn.setTitle("         stop", for: .normal)
                editBtn.setTitleColor(.red, for: .normal)
                editBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .thin)
                statusBtn.setTitle("open", for: .normal)
                statusBtn.backgroundColor = .init(red: 0, green: 160/255, blue: 40/255, alpha: 1)
            }
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let length = contentView.width
        idLabel.frame = CGRect(x: 5, y: 10, width: 100, height: 25)
        typeLabel.frame = CGRect(x: 5, y: idLabel.bottom + 17, width: 150, height: 20)
        nameLabel.frame = CGRect(x: 5, y: typeLabel.bottom, width: 200, height: 20)
        userLabel.frame = CGRect(x: length - 65, y: idLabel.bottom + 15, width: 60, height: 20)
        if model?.target == true {
            statusBtn.frame = CGRect(x: length - 80, y: userLabel.bottom + 3, width: 80, height: 20)
            editBtn.frame = CGRect(x: length - 70, y: 10, width: 60, height: 30)
        } else {
            statusBtn.frame = CGRect(x: length - 65, y: userLabel.bottom + 3, width: 50, height: 20)
            editBtn.frame = CGRect(x: length - 120, y: 10, width: 120, height: 30)
        }
    }
}
