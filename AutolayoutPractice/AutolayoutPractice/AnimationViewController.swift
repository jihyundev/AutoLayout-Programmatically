//
//  AnimationViewController.swift
//  AutolayoutPractice
//
//  Created by 정지현 on 2021/05/02.
//

import UIKit

class AnimationViewController: UIViewController {
    
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
    
    var upButton: UIButton = {
        let button = UIButton()
        button.setTitle("위로 올리기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var box: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        self.view.addSubview(exitButton)
        exitButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        exitButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        exitButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
        self.view.addSubview(upButton)
        NSLayoutConstraint.activate([
            upButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
        
        self.view.addSubview(box)
        box.widthAnchor.constraint(equalToConstant: 100).isActive = true
        box.heightAnchor.constraint(equalToConstant: 100).isActive = true
        box.topAnchor.constraint(equalTo: upButton.bottomAnchor, constant: 50).isActive = true
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    

}


#if DEBUG
import SwiftUI
struct AnimationViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    // make ui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        AnimationViewController()
    }
}

struct AnimationViewController_Previews: PreviewProvider {
    static var previews: some View {
        AnimationViewControllerRepresentable()
            .previewDisplayName("아이폰")
    }
}


#endif
