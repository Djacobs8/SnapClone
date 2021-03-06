//
//  PicViewController.swift
//  SnapCline
//
//  Created by Derek Jacobs on 2017-04-05.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit
import Firebase

class PicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage // pass the image as a UIImage
        
        imageView.image = image // can now throw this to server
        
        imageView.backgroundColor = UIColor.clear // make back ground edges clear
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        // turn off next when you go to upload
        nextButton.isEnabled = false
        // looking for Firebase storage and subsequently the child folder (images) that we made
        let imagesFolder = FIRStorage.storage().reference().child("images")
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        
        //NSUUID is a unique number every time
        
        imagesFolder.child("\(NSUUID().uuidString).jpeg").put(imageData, metadata: nil, completion: {(metadata, error) in
            print ("We tried to upload")
            if error != nil {
                print ("We have an error:\(error)") // if error is not equal to zero, aka there is one show this msg
            } else {
                // otherwise print the meta data leading to DL
                print(metadata?.downloadURL())
                
                self.performSegue(withIdentifier: "selectUserSegue", sender: nil) //send to the next
                
            }
        })
        
        
        
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary //specify it is coming from cam
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
