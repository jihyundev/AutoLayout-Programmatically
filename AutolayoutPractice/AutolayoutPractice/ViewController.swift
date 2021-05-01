//
//  ViewController.swift
//  AutolayoutPractice
//
//  Created by 정지현 on 2021/05/01.
//

import UIKit

class ViewController: UIViewController {
    
    // make view with closure
    var myView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "app_icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var myLabel: UILabel = {
        let label = UILabel()
        label.text = "Go Get Rocket"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go Get Rocket", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(gotoNextVC), for: .touchUpInside)
        return button
    }()
    
    @objc func gotoNextVC() {
        let vc = RocketViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myView)
        
        // position of x, y, width, height
        myView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        myView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        //myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        //myView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.view.addSubview(myImageView)
        myImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        myImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 10).isActive = true
        myImageView.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 20).isActive = true
        
        self.view.addSubview(myLabel)
        NSLayoutConstraint.activate([
            myLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 20),
            myLabel.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 20)
        ])
        
        self.view.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 20),
            myButton.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 10)
        ])
    }


}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    // make ui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .previewDisplayName("아이폰")
    }
}


#endif
