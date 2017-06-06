//
//  SelectyBodyViewController.swift
//  Selfie-Cam
//
//  Created by Milos Stosic on 6/1/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//
import CoreGraphics
import UIKit

class SelectyBodyViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var testdugme: UIButton!
    var bitmap : PixelExtractor!
    var img = UIImage()
    var camera : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.frame =  CGRect(x: 0, y: 0, width: (img.size.width), height:(img.size.height))
        image.center = CGPoint(x: CGFloat(self.view.center.x), y:CGFloat(self.view.center.y ))

        image.image = img
        
         bitmap=PixelExtractor(img: (image.image?.cgImage)! )
        
   
        let tapRecognizer = UITapGestureRecognizer(target: self , action: #selector(handleSingleTap))
        tapRecognizer.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapRecognizer)
    
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSingleTap(recognizer: UITapGestureRecognizer) {
      
        let g = recognizer.location(in: self.image)
        var p = Int(g.x)
        let e = Int(g.y)
               if camera
        {
            //ako je slikano s kameru
            
            if p > 0 && e > 0 && p < (image.image?.cgImage?.height)! && e < (image.image?.cgImage?.width)!
            {
                
                p = (image.image?.cgImage?.height)! - p
               
            let mm = bitmap?.colorAtSelfie(x: e, y: p)
            testdugme.backgroundColor = mm
            }
           }
        else{
            //ako nije slikano s kameru
            if p > 0 && e > 0 && p < (image.image?.cgImage?.width)! && e < (image.image?.cgImage?.height)!
            {
            let mm = self.bitmap?.colorAt(x:p, y:e)
            testdugme.backgroundColor = mm
                
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
