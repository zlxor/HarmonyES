//
//  ViewController.swift
//  HarmonyES
//
//  Created by LingXuan Zhao on 2022/3/13.
//

import UIKit

class HomeViewController: UIViewController {

    
    private let managerBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.setImage(UIImage(systemName: "person.icloud"), for: .normal)
        return button
    }()
    
    private let userBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.setImage(UIImage(systemName: "person.3.fill"), for: .normal)
        return button
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Energy2")
        view.alpha = 0.35
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        /*
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame=view.bounds
        view.addSubview(blurEffectView)
        */
        view.addSubview(managerBtn)
        view.addSubview(userBtn)
        managerBtn.addTarget(self, action: #selector(toManagerPage), for: .touchUpInside)
        userBtn.addTarget(self, action: #selector(toUserPage), for: .touchUpInside)
    }
    
    @objc func toManagerPage() {
        let vc = MangerViewController()
        vc.title = "Manager"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    @objc func toUserPage() {
        let triggerVc = TriggerNodesViewController()
        triggerVc.title = "User - Annan (Trigger)"
        let leaf = UITabBarItem()
        leaf.title = "Trigger"
        leaf.image = UIImage(systemName: "leaf.fill")
        triggerVc.tabBarItem = leaf
        
        let controlledVc = ControlledNodesViewController()
        controlledVc.title = "User - Annan (Controlled)"
        let flame = UITabBarItem()
        flame.title = "Controlled"
        flame.image = UIImage(systemName: "flame.fill")
        controlledVc.tabBarItem = flame
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [UINavigationController(rootViewController: triggerVc), UINavigationController(rootViewController: controlledVc)]
        present(tabBarController, animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
        
        var configuration1 = UIButton.Configuration.filled()
        var container1 = AttributeContainer()
        container1.font = UIFont.boldSystemFont(ofSize: 25)
        configuration1.attributedTitle = AttributedString("Manager", attributes: container1)
        configuration1.baseBackgroundColor = .blue
        configuration1.titlePadding = 10
        configuration1.imagePadding = 20
        configuration1.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 20, bottom: 2, trailing: 20)
        configuration1.imagePlacement = .top
        configuration1.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 60)
        managerBtn.configuration = configuration1
        
        var configuration2 = UIButton.Configuration.filled()
        var container2 = AttributeContainer()
        container2.font = UIFont.boldSystemFont(ofSize: 25)
        configuration2.attributedTitle = AttributedString("User", attributes: container2)
        configuration2.baseBackgroundColor = .init(red: 30/255, green: 160/255, blue: 50/255, alpha: 1)
        configuration2.titlePadding = 10
        configuration2.imagePadding = 20
        configuration2.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 2, trailing: 20)
        configuration2.imagePlacement = .top
        configuration2.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 40)
        userBtn.configuration = configuration2
        
        let length = view.height / 4
        let margin = (view.height - 2 * length - 60) / 2
        let startX = (view.width - length) / 2
        managerBtn.frame = CGRect(x: startX, y: margin, width: length, height: length)
        userBtn.frame = CGRect(x: startX, y: managerBtn.bottom + 60, width: length, height: length)
    }
}

