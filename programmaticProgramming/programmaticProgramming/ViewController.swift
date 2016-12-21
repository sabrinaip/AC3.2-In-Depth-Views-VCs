//
//  ViewController.swift
//  programmaticProgramming
//
//  Created by Sabrina Ip on 12/20/16.
//  Copyright © 2016 Sabrina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segueButton: UIButton = UIButton(type: UIButtonType.system)
    lazy var randomLazyView: LazyView = LazyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\n\n\n>>>>>VIEW DID LOAD\n\n\n")
        self.view.backgroundColor = .yellow
        print("Button frame, viewDidLoad, preConstriaints: \(segueButton.frame)")
        self.view.addSubview(segueButton)
        self.view.addSubview(randomLazyView)
        self.segueButton.translatesAutoresizingMaskIntoConstraints = false
        self.segueButton.setTitle("Press Me", for: .normal)
        
        //print("Button frame, viewDidLoad, post adding constriaints: \(segueButton.frame)")
        
        let _ = [
            segueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            segueButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ].map { $0.isActive = true }
        self.segueButton.addTarget(self, action: #selector(didPressSegueButton(sender:)), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("Button frame, didLayoutSubviews, constriaints: \(segueButton.frame)")
    }
    
    func didPressSegueButton(sender: UIButton) {
        print("Did press button")
        
        // 1. create our destination view controller
        let randomViewController = ViewController()
        randomViewController.view.backgroundColor = self.randomColor()
        
        // 2. move to the destination view controller
        
        // this will repsent a new ViewController modally!
        //self.present(randomViewController, animated: true, completion: nil)
        // but we want the navVC to manage our view controllers!
        
        if let navVC = self.navigationController {
            print("navVC found")
            navVC.pushViewController(randomViewController, animated: true)
        }
    }
    
    func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(254))
        let g = CGFloat(arc4random_uniform(254))
        let b = CGFloat(arc4random_uniform(254))
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
                print("\n\n\n>>>>>VIEW DID APPEAR\n\n\n")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
                print("\n\n\n>>>>>VIEW WILL APPEAR\n\n\n")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
                print("\n\n\n>>>>>VIEW WILL DISAPPEAR\n\n\n")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
                print("\n\n\n>>>>>VIEW DID DISSAPPEAR\n\n\n")
    }

}

