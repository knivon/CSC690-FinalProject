//
//  AppViewController.swift
//  FinalProject
//
//  Created by Kimberly Nivon on 12/10/20.
//  Copyright © 2020 Kimberly Nivon. All rights reserved.
//

import UIKit
import FirebaseStorage

class AppViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    private let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.numberOfLines = 0
        label.textAlignment = .center
        imageView.contentMode = .scaleAspectFit

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage  else {
            return
            
        }
        guard let imageData = image.pngData() else {
            return
        }
        
        //let ref = storage.child("images/file.png").putdata
        
        storage.child("images/file.png").putData(imageData, metadata: nil, completion: { _,error in
            guard error == nil else{
            print("Failed")
            return
        }
            self.storage.child("images/file.png").downloadURL(completion: { url, error in
                guard let url = url, error == nil else{
                    return
                }
                let urlString = url.absoluteString
                print("Download URL: \(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            })
    })
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated:true, completion: nil)
    }
    
}
