//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Uladzislau Volchyk on 7/2/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    let product: Product
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cartButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "button-addtocart"), for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.imageView)
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = self.product.name
        
        self.imageView.image = UIImage(named: self.product.fullscreenImageName)
        self.view.addSubview(self.cartButton)
        
        self.cartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            self.cartButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            self.cartButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc func addToCart() {
        print("Add to cart")
    }
}
