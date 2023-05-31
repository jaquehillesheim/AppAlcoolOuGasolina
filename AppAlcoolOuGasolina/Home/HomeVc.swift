//
//  HomeVc.swift
//  AppAlcoolOugasolina
//
//  Created by Jaqueline Hillesheim on 24/03/23.
//

import UIKit

class HomeVc: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
}

extension HomeVc: HomeScreenDelegate {
    func tappedStartButton() {
        navigationController?.pushViewController(CalculatorVc(), animated: true)
    }
}
