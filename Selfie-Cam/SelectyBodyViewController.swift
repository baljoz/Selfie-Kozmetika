//
//  SelectyBodyViewController.swift
//  Selfie-Cam
//
//  Created by Milos Stosic on 6/1/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//

import UIKit

class SelectyBodyViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!

    var img = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = img
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
