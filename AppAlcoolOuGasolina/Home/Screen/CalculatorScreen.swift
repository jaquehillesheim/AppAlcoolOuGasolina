//
//  CalculatorScreen.swift
//  AppAlcoolOugasolina
//
//  Created by Jaqueline Hillesheim on 27/03/23.
//

import UIKit
import SnapKit
import SDWebImage

protocol CalculatorScreenDelegate: AnyObject {
    func tappedCalculateButton()
    func tappedbackbutton()
}

class CalculatorScreen: UIView {
    
    private weak var delegate: CalculatorScreenDelegate?
    
    public func delegate(delegate: CalculatorScreenDelegate?) {
        self.delegate = delegate
    }
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image .translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR DARK")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO menor")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
   lazy var ethanolPriceTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "Preço do Alcool"
        textField.textColor = .darkGray
        
        return textField
    }()
    
    lazy var gasPriceTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "Preço do Gasolina"
        textField.textColor = .darkGray
        
        return textField
    }()
    
    private lazy var calculatebutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedCalculateButton() {
        delegate?.tappedCalculateButton()
    }
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedBackButton() {
        delegate?.tappedbackbutton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImage)
        addSubview(logoAppImageView)
        addSubview(ethanolPriceTextField)
        addSubview(gasPriceTextField)
        addSubview(calculatebutton)
        addSubview(backButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(20)
        }
        
        logoAppImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(150)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        ethanolPriceTextField.snp.makeConstraints { make in
            make.top.equalTo(logoAppImageView.snp.bottom).offset(134)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
        
        gasPriceTextField.snp.makeConstraints { make in
            make.top.equalTo(ethanolPriceTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
        
        calculatebutton.snp.makeConstraints { make in
            make.top.equalTo(gasPriceTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
        
    }
}
