//
//  RocketViewController.swift
//  AutolayoutPractice
//
//  Created by 정지현 on 2021/05/01.
//

import UIKit

class RocketViewController: UIViewController {
    
    var exitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "exitButton"), for: .normal)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    lazy var rocket1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rocket_top_1")
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var rocket2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rocket_top_2")
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var rocket3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rocket_top_3")
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var views = [rocket1, rocket2, rocket3]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat((views.count)), height: view.frame.height)
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        }
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        self.view.addSubview(exitButton)
        exitButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        exitButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        exitButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        
        /*
        let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.isPagingEnabled = true
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat((views.count)), height: view.frame.height)
            for i in 0..<views.count {
                scrollView.addSubview(views[i])
                views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            }
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()*/
        
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
