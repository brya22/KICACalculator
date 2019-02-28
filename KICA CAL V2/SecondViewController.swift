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
    
    let userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (UserDefaults.standard.string(forKey: "KW") != nil){
            KW.text! = UserDefaults.standard.string(forKey: "KW")!
        }
        if (UserDefaults.standard.string(forKey: "TIW") != nil){
            TIW.text! = UserDefaults.standard.string(forKey: "TIW")!
        }
        if (UserDefaults.standard.string(forKey: "CW") != nil) {
            CW.text! = UserDefaults.standard.string(forKey: "CW")!
        }
        if (UserDefaults.standard.string(forKey: "AW") != nil){
            AW.text! = UserDefaults.standard.string(forKey: "AW")!
        }
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
    
    
    @IBAction func hitKnowledge(_ sender: UITextField) {
        let alert = UIAlertController(title: "Knowlege", message: "Enter weight", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.userDefault.set(textField.text!, forKey: "KW")
            self.userDefault.set(Int(textField.text!), forKey: "KWI")
            UserDefaults.standard.synchronize()
            self.KW.text! = textField.text!
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func hitThinking(_ sender: UITextField) {
        let alert = UIAlertController(title: "Thinking & Inquiry", message: "Enter weight", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.userDefault.set(textField.text!, forKey: "TIW")
            self.userDefault.set(Int(textField.text!), forKey: "TIWI")
            UserDefaults.standard.synchronize()
            self.TIW.text! = textField.text!
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func hitCommunication(_ sender: UITextField) {
        let alert = UIAlertController(title: "Knowlege", message: "Enter weight", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.userDefault.set(textField.text!, forKey: "CW")
            self.userDefault.set(Int(textField.text!), forKey: "CWI")
            UserDefaults.standard.synchronize()
           self.CW.text! = textField.text!
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func hitApplication(_ sender: UITextField) {
        let alert = UIAlertController(title: "Application", message: "Enter weight", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.userDefault.set(textField.text!, forKey: "AW")
            self.userDefault.set(Int(textField.text!), forKey: "AWI")
            UserDefaults.standard.synchronize()
            self.AW.text! = textField.text!
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

