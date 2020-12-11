//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Kimberly Nivon on 12/10/20.
//  Copyright © 2020 Kimberly Nivon. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let label: UILabel = {
           let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
           label.textAlignment = .center
           label.font = .systemFont(ofSize: 24, weight: .bold)
           label.text = "Welcome!"
           return label
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.addSubview(label)
           label.center = view.center
           UIGraphicsBeginImageContext(self.view.frame.size)
           UIImage(named: "home")?.draw(in: self.view.bounds)
           let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
           UIGraphicsEndImageContext()
           self.view.backgroundColor = UIColor(patternImage: image)
           //view.backgroundColor =
           // Do any additional setup after loading the view.
           
           
           DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
               // show up your view controller
               //let newViewController = TestViewController()
               let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "app") as! AppViewController
               self.present(loginVC, animated: true)
               }
       }
}
