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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        self.view.addSubview(exitButton)
        exitButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        exitButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        exitButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
