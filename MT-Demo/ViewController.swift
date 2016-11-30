//
//  ViewController.swift
//  MT-Demo
//
//  Created by Shinkangsan on 11/28/16.
//  Copyright © 2016 Sheldon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    let urlStr = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Square_Dorchester_01.jpg/1600px-Square_Dorchester_01.jpg"
    var url:NSURL!
    override func viewDidLoad() {
        super.viewDidLoad()
        url = NSURL(string:urlStr)
        indicator.startAnimating()
        indicator.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func downloadTapped(_ sender: Any) {
        
//        let data = NSData(contentsOf: url as URL)
//        self.imageView.image = UIImage(data: data as! Data)
//       
        indicator.isHidden = false
        
        URLSession.shared.dataTask(with: (url as URL), completionHandler: {(data, resp, error) -> Void in
            if (error == nil && data != nil) {
//                DispatchQueue.main.async(execute: { 
//                    self.imageView.image = UIImage(data: data!)
//                })
                
                OperationQueue.main.addOperation({
                    self.indicator.isHidden = true
                    self.imageView.image = UIImage(data: data!)
                })
                
            }
        }).resume()
        
        
    }

}

