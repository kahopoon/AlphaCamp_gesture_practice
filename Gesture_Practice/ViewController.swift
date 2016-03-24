//
//  ViewController.swift
//  Gesture_Practice
//
//  Created by Ka Ho on 24/3/2016.
//  Copyright © 2016 Ka Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let imageArray:[String] = ["flower","girl","hill","rose","sunset","tree"]
    var currentImage:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: imageArray.first!)
    }

    @IBAction func rightSwipe(sender: AnyObject) {
        let updateShow = currentImage + 1 < imageArray.count ? currentImage + 1 : 0
        swipeAction(updateShow)
    }
    
    @IBAction func leftSwipe(sender: AnyObject) {
        let updateShow = currentImage - 1 >= 0 ? currentImage - 1 : imageArray.indexOf(imageArray.last!)
        swipeAction(updateShow!)
    }
    
    func swipeAction(index: Int) {
        imageView.image = UIImage(named: imageArray[index])
        currentImage = index
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

