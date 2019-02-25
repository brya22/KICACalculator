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
    var mark: Int!
    @IBOutlet var showmark: UILabel!
    let request = GADRequest()
    
    //ad
    var interstitial: GADInterstitial!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //assignbackground()
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-6691936756757550/4847956014")
        interstitial.delegate = self
        request.testDevices =  [ "3bd53293d528c3523bc5640757fd34f8" ]
        interstitial.load(request)
        setTitles()
        outOfs()

    }
    
    func outOfs(){
        let out1 = "outof"
        let out1a = UIImage(named: out1)
        let out1V = UIImageView(image: out1a!)
        out1V.frame = CGRect(x: 138, y: 115, width: 93, height: 27)
        view.addSubview(out1V)
        let out2 = "outof"
        let out2a = UIImage(named: out2)
        let out2V = UIImageView(image: out2a!)
        out2V.frame = CGRect(x: 138, y: 240, width: 93, height: 27)
        view.addSubview(out2V)
        let out3 = "outof"
        let out3a = UIImage(named: out3)
        let out3V = UIImageView(image: out3a!)
        out3V.frame = CGRect(x: 138, y: 360, width: 93, height: 27)
        view.addSubview(out3V)
        let out4 = "outof"
        let out4a = UIImage(named: out4)
        let out4V = UIImageView(image: out4a!)
        out4V.frame = CGRect(x: 138, y: 470, width: 93, height: 27)
        view.addSubview(out4V)
        
        
    }
    
    func setTitles(){
        let knowT = "knownledge.png"
        let knowI = UIImage(named: knowT)
        let knowView = UIImageView(image: knowI!)
        knowView.frame = CGRect(x: 102, y: 60, width: 170, height: 32)
        view.addSubview(knowView)
        let tiT = "thinking-inquiry.png"
        let tiI = UIImage(named: tiT)
        let tiView = UIImageView(image: tiI!)
        tiView.frame = CGRect(x: 28, y: 175, width: 323, height: 35)
        view.addSubview(tiView)
        let cT = "communication.png"
        let cI = UIImage(named: cT)
        let cView = UIImageView(image: cI!)
        cView.frame = CGRect(x: 45, y: 298, width: 281, height: 35)
        view.addSubview(cView)
        let aT = "application.png"
        let aI = UIImage(named: aT)
        let aView = UIImageView(image: aI!)
        aView.frame = CGRect(x: 65, y: 415, width: 241, height: 35)
        view.addSubview(aView)
    }
    
    @IBAction func HitCalculate(sender: UIButton) {
        request.testDevices =  [ "3bd53293d528c3523bc5640757fd34f8" ]
        interstitial.load(request)
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
        let kw = UserDefaults.standard.integer(forKey: "KW")
        let tiw = UserDefaults.standard.integer(forKey: "TIW")
        let cw = UserDefaults.standard.integer(forKey: "CW")
        let aw = UserDefaults.standard.integer(forKey: "AW")
        let K1: Int? = Int(k1.text!)
        let K2: Int? = Int(k2.text!)
        let ti1: Int? = Int(TI1.text!)
        let ti2: Int? = Int(TI2.text!)
        let c1: Int? = Int(C1.text!)
        let c2: Int? = Int(C2.text!)
        let a1: Int? = Int(A1.text!)
        let a2: Int? = Int(A2.text!)
        //checks
        
        //Int(minutes.text ?? "") ?? 0
        let knowledge: Int? = (K1! / K2!) * kw
        let thinkinginq: Int? = (ti1! / ti2!) * tiw
        let comm: Int? = (c1! / c2!) * cw
        let app: Int? = (a1! / a2!) * aw
        
        let total = (knowledge!) + (thinkinginq!) + (comm!) + (app!)
        mark = total
        
        showmark.text! = "Mark: %" + String(mark)
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

