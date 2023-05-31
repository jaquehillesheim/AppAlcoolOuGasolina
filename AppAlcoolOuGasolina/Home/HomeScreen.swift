//
//  HomeScreen.swift
//  AppAlcoolOugasolina
//
//  Created by Jaqueline Hillesheim on 24/03/23.
//

import UIKit
import SnapKit
import SDWebImage

protocol HomeScreenDelegate: AnyObject {
    func tappedStartButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenDelegate?
    
    public func delegate(delegate: HomeScreenDelegate?) {
        self.delegate = delegate
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG HOME")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
   lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1)
       button.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
       
       return button
    }()
    
    @objc func tappedStartButton() {
        delegate?.tappedStartButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImageView)
        addSubview(logoAppImageView)
        addSubview(startButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        logoAppImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(104)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-125)
            make.leading.trailing.equalToSuperview().inset(60)
            make.height.equalTo(44)
            
        }
    }
}
