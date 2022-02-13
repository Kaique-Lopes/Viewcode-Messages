//
//  HomeViewController.swift
//  Viewcode-Messages
//
//  Created by Kaique Lopes de Oliveira on 10/02/22.
//

import UIKit

class HomeViewController: UIViewController {
    var screen : HomeScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        self.screen = HomeScreen()
        self.view = screen
    }

}
