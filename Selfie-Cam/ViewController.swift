//
//  ViewController.swift
//  Selfie-Cam
//
//  Created by Milos Stosic on 5/31/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegate
{
      var imagePicked = UIImage()
      var cam : Bool = false
      override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
          }
    @IBAction func cameraOpen(_ sender: Any)
    {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.cameraDevice = .front
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            self.cam = true
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController,    didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            
           imagePicked = image
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "body") as! SelectyBodyViewController
            nextViewController.img = imagePicked
            
            if self.cam
            {
                nextViewController.camera = true
            }
             self.dismiss(animated: true, completion: nil)
             self.present(nextViewController, animated:true, completion:nil)
        }
        
    }

    @IBAction func openLibery(_ sender: Any)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //    let url = thumbnailFileURLS[indexPath.item]
       // if UIApplication.sharedApplication().canOpenURL(url) {
        //    UIApplication.sharedApplication().openURL(url)
       // }
    }
    
}

