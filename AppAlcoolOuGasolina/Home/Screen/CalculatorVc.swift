//
//  CalculatorVc.swift
//  AppAlcoolOugasolina
//
//  Created by Jaqueline Hillesheim on 27/03/23.
//

import Foundation
import UIKit

class CalculatorVc: UIViewController {
    
    var screen: CalculatorScreen?
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
}

extension CalculatorVc: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
        let gasPrice: Double = (formatter.number(from: screen?.gasPriceTextField.text ?? "0.0") as? Double) ?? 0.0
        
        if ethanolPrice / gasPrice > 0.7 {
            print("Melhor utilizar Gasolina!")
        } else {
            print("Melhor utilizar Álcool!")
        }
    }
    
    func tappedbackbutton() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
