//
//  SecondViewController.swift
//  KICA CAL V2
//
//  Created by Bryan Pacher on 2019-02-22.
//  Copyright © 2019 Bryan Pacher. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SecondViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet var KW: UITextField!
    @IBOutlet var TIW: UITextField!
    @IBOutlet var CW: UITextField!
    @IBOutlet var AW: UITextField!
    
    var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //assignbackground()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let request = GADRequest()
        request.testDevices =  [ "3bd53293d528c3523bc5640757fd34f8" ]
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-6691936756757550/6296645347"
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.load(request)
        addBannerViewToView(bannerView)
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("Banner loaded successfully")
    }
    

    @IBAction func HitKnowledge(_ sender: UITextField) {
        let alert = UIAlertController(title: "Knowlege", message: "Enter weight", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.KW.text! = textField.text!
            UserDefaults.standard.set(Int(textField.text!), forKey: "KW")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HitThinkingInquiry(_ sender: UITextField) {
        let alert = UIAlertController(title: "Thinking & Inquiry", message: "Enter weight", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.TIW.text! = textField.text!
            UserDefaults.standard.set(Int(textField.text!), forKey: "TIW")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HitCommunication(_ sender: UITextField) {
        let alert = UIAlertController(title: "Communication", message: "Enter weight", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.CW.text! = textField.text!
            UserDefaults.standard.set(Int(textField.text!), forKey: "CW")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HitApplication(_ sender: UITextField) {
        let alert = UIAlertController(title: "Application", message: "Enter weight", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.AW.text! = textField.text!
            UserDefaults.standard.set(Int(textField.text!), forKey: "AW")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func assignbackground(){
        let background = UIImage(named: "background.png")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }



}

