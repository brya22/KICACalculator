//
//  FirstViewController.swift
//  KICA CAL V2
//
//  Created by Bryan Pacher on 2019-02-22.
//  Copyright © 2019 Bryan Pacher. All rights reserved.
//

import UIKit
import GoogleMobileAds

class FirstViewController: UIViewController, GADInterstitialDelegate {

    @IBOutlet var k1: UITextField!
    @IBOutlet var k2: UITextField!
    @IBOutlet var TI1: UITextField!
    @IBOutlet var TI2: UITextField!
    @IBOutlet var C1: UITextField!
    @IBOutlet var C2: UITextField!
    @IBOutlet var A1: UITextField!
    @IBOutlet var A2: UITextField!
    @IBOutlet var calculate: UIButton!
    var mark: String!
    @IBOutlet var markView: UIView!
    @IBOutlet var markViewMark: UILabel!
    
    
    
    //ad
    var interstitial: GADInterstitial!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        assignbackground()
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-6691936756757550/4847956014")
        interstitial.delegate = self
    }
    
    @IBAction func HitCalculate(_ sender: UIButton) {
        let request = GADRequest()
        interstitial.load(request)
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
        markView.isHidden = false
        markViewMark.text! = mark
    }
    
    @IBAction func hitMarkViewOK(_ sender: UIButton) {
        markView.isHidden = true
    }
    
    
    
    @IBAction func HitK1(_ sender: UITextField) {
        let alert = UIAlertController(title: "Knowledge", message: "Enter mark out of", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.k1.text! = textField.text!
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HitK2(_ sender: UITextField) {
        let alert = UIAlertController(title: "Knowledge", message: "Enter mark total", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.k2.text! = textField.text!
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HitTI1(_ sender: UITextField) {
        let alert = UIAlertController(title: "Thinking & Inquiry", message: "Enter mark out of", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.TI1.text! = textField.text!
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HitTI2(_ sender: UITextField) {
        let alert = UIAlertController(title: "Thinking & Inquiry", message: "Enter mark total", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.TI2.text! = textField.text!
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HitC1(_ sender: UITextField) {
        let alert = UIAlertController(title: "Communication", message: "Enter mark out of", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.C1.text! = textField.text!
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HitC2(_ sender: UITextField) {
        let alert = UIAlertController(title: "Communication", message: "Enter mark total", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.C2.text! = textField.text!
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HitA1(_ sender: UITextField) {
        let alert = UIAlertController(title: "Application", message: "Enter mark out of", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.A1.text! = textField.text!
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func HitA2(_ sender: UITextField) {
        let alert = UIAlertController(title: "Application", message: "Enter mark total", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.keyboardType = UIKeyboardType.numberPad
        }
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            self.A2.text! = textField.text!
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

