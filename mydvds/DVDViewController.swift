//
//  DVDViewController.swift
//  mydvds
//
//  Created by Apple on 7/18/17.
//  Copyright © 2017 Jeremy. All rights reserved.
//

import UIKit

class DVDViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  
    @IBOutlet weak var dvdImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagepicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagepicker.delegate = self
    }

    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagepicker.sourceType = .photoLibrary
        
        present(imagepicker, animated: true, completion: nil)
        
    }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        dvdImageView.image = image
        
        imagepicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let dvd = DVD(context: context)
        dvd.title = titleTextField.text!
        dvd.image = UIImagePNGRepresentation(dvdImageView.image!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
