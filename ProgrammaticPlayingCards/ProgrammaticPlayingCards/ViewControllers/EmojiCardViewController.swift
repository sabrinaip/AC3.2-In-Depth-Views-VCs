//
//  EmojiCardViewController.swift
//  ProgrammaticPlayingCards
//
//  Created by Sabrina Ip on 12/20/16.
//  Copyright © 2016 Sabrina. All rights reserved.
//

import UIKit

class EmojiCardViewController: UIViewController {
    
    var cardStack = EmojiDeck()

//    var currentCard = EmojiCard(suit: .smiley, cardNum: 8)
    var drawCardButton: UIButton = UIButton(type: UIButtonType.system)
    var showStackButton: UIButton = UIButton(type: UIButtonType.system)
    var removeRandomButton: UIButton = UIButton(type: UIButtonType.system)
    var removeAllButton: UIButton = UIButton(type: UIButtonType.system)
    
    var currentCardView = CardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setUpButtons()
        setUpCardView()
    }
    
    func setUpCardView() {
        self.view.addSubview(currentCardView)
        self.currentCardView.translatesAutoresizingMaskIntoConstraints = false
        
        let _ = [
            currentCardView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8),
            currentCardView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8),
            currentCardView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8),
            currentCardView.bottomAnchor.constraint(equalTo: drawCardButton.topAnchor, constant: -8),
            ].map { $0.isActive = true }
    }
    
    func setUpButtons() {
        let allButtons = [drawCardButton, showStackButton, removeRandomButton, removeAllButton]
        
        for button in allButtons {
            self.view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
//            button.addTarget(self, action: #selector(didPressButton(sender:)), for: .touchUpInside)
//            switch button {
//            case drawCardButton:
//                button.setTitle("Draw Card", for: .normal)
//            case showStackButton:
//                button.setTitle("Show Stack", for: .normal)
//            case removeRandomButton:
//                button.setTitle("Remove Random", for: .normal)
//            case removeAllButton:
//                button.setTitle("Remove All", for: .normal)
//            default:
//                print("Another Button drawn")
//            }
        }
        
        self.drawCardButton.setTitle("Draw Card", for: .normal)
        self.showStackButton.setTitle("Show Stack", for: .normal)
        self.removeRandomButton.setTitle("Remove Random", for: .normal)
        self.removeAllButton.setTitle("Remove All", for: .normal)
        
        let removeRandomConstraints: [NSLayoutConstraint] = [
            removeRandomButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            removeRandomButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8)
        ]
        let drawCardConstraints: [NSLayoutConstraint] = [
            drawCardButton.bottomAnchor.constraint(equalTo: removeRandomButton.topAnchor),
            drawCardButton.leftAnchor.constraint(equalTo: removeRandomButton.leftAnchor)
        ]
        let removeAllContsraints: [NSLayoutConstraint] = [
            removeAllButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            removeAllButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8)
        ]
        let showStackConstraints: [NSLayoutConstraint] = [
            showStackButton.rightAnchor.constraint(equalTo: removeAllButton.rightAnchor),
            showStackButton.bottomAnchor.constraint(equalTo: removeAllButton.topAnchor)
        ]
        let allButtonConstraints = [drawCardConstraints, showStackConstraints, removeRandomConstraints, removeAllContsraints]
        let _ = allButtonConstraints.map { $0.map { $0.isActive = true } }
        
        
        self.drawCardButton.addTarget(self, action: #selector(didPressDrawCardButton(sender:)), for: .touchUpInside)
        self.showStackButton.addTarget(self, action: #selector(didPressShowStackButton(sender:)), for: .touchUpInside)
    }
    
    func didPressShowStackButton(sender: UIButton) {
        cardStack.showStack()
    }
    
    func didPressDrawCardButton(sender: UIButton) {
        print("Did press button")
        let newViewController = EmojiCardViewController()
        newViewController.view.backgroundColor = self.randomColor()
        
        if let navVC = self.navigationController {
            navVC.pushViewController(newViewController, animated: true)
        }        
        cardStack.drawCard()

    
//
//        // 1. create our destination view controller
//        let randomLovelyViewController = MyLovelyViewController()
//        randomLovelyViewController.view.backgroundColor = self.randomColor()
//        
//        // 2. move to the destination view controller
//        
//        // this will present a new ViewController modally!
//        //    self.present(greenViewController, animated: true, completion: nil)
//        
//        // but we want the navVC to manage our view controllers!
//        if let navVC = self.navigationController {
//            print("NavVC found")
//            
//            // this will present the view controller modally, but using the navVC as the source view controller as opposed to the greenViewController
//            
//            //      navVC.present(greenViewController, animated: true, completion: nil)
//            
//            // pushViewController will add the view controller to the navigation stack
//            navVC.pushViewController(randomLovelyViewController, animated: true)
//        }
        
    }
    
    func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(254))
        let g = CGFloat(arc4random_uniform(254))
        let b = CGFloat(arc4random_uniform(254))
        
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
