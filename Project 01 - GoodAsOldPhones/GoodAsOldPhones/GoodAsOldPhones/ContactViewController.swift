//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Created by Uladzislau Volchyk on 7/2/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import Foundation
import UIKit

class ContactViewController: UIViewController, UIScrollViewDelegate {
    
    let imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "header-contact"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 45.0
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = self.contentView.bounds.size
        view.backgroundColor = .white
        
        
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.stackView)
        self.contentView.addSubview(self.imageView)
        
        fillStack()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NSLayoutConstraint.activate([
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 60.0),
            self.stackView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 50.0),
            self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -60.0),
            self.stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -50.0)
        ])
    }
    
    
    func fillStack() {
        let label1 = UILabel()
        label1.text = "About Us"
        label1.textAlignment = .center
        label1.font = .systemFont(ofSize: 24, weight: .bold)
        
        let label2 = UILabel()
        label2.text = "Good as Old Phones returns the phones of  yesteryear back to their original glory and then gets them into the hands* of those who appreciate them most:"
        label2.numberOfLines = 0
        
        let label3 = UILabel()
        label3.text = "Whether you are looking for a turn-of-the-century wall set or a Zack Morris Special, we've got you covered. Give us a ring, and we will get you connected."
        label3.numberOfLines = 0
        
        let label4 = UILabel()
        label4.text = "*Hands-free phones available"
        label4.font = UIFont(name: "Iowan Old Style", size: 17)
        
        let label5 = UILabel()
        label5.text = "Contact"
        label5.textAlignment = .center
        label5.font = .systemFont(ofSize: 24, weight: .bold)
        
        let stack1 = UIStackView()
        stack1.spacing = 10
        let stack1Label = UILabel()
        stack1Label.text = "good-as-old@example.com"
        let stack1Image = UIImageView(image: UIImage(named: "icon-about-email"))
        stack1Image.translatesAutoresizingMaskIntoConstraints = false
        stack1Image.heightAnchor.constraint(equalTo: stack1Image.widthAnchor).isActive = true
        stack1.addArrangedSubview(stack1Image)
        stack1.addArrangedSubview(stack1Label)
        
        let stack2 = UIStackView()
        stack2.spacing = 10
        let stack2Label = UILabel()
        stack2Label.text = "412-888-9028"
        let stack2Image = UIImageView(image: UIImage(named: "icon-about-phone"))
        stack2Image.translatesAutoresizingMaskIntoConstraints = false
        stack2Image.heightAnchor.constraint(equalTo: stack2Image.widthAnchor).isActive = true
        stack2.addArrangedSubview(stack2Image)
        stack2.addArrangedSubview(stack2Label)
        
        let stack3 = UIStackView()
        stack3.spacing = 10
        let stack3Label = UILabel()
        stack3Label.text = "www.example.com"
        let stack3Image = UIImageView(image: UIImage(named: "icon-about-website"))
        stack3Image.translatesAutoresizingMaskIntoConstraints = false
        stack3Image.heightAnchor.constraint(equalTo: stack3Image.widthAnchor).isActive = true
        stack3.addArrangedSubview(stack3Image)
        stack3.addArrangedSubview(stack3Label)
        
        self.stackView.addArrangedSubview(label1)
        self.stackView.addArrangedSubview(label2)
        self.stackView.addArrangedSubview(label3)
        self.stackView.addArrangedSubview(label4)
        self.stackView.addArrangedSubview(label5)
        self.stackView.addArrangedSubview(stack1)
        self.stackView.addArrangedSubview(stack2)
        self.stackView.addArrangedSubview(stack3)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.contentView
    }
    
}

