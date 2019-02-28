//
//  FirstViewController.swift
//  KICA CAL V2
//
//  Created by Bryan Pacher on 2019-02-22.
//  Copyright © 2019 Bryan Pacher. All rights reserved.
//

import UIKit
import GoogleMobileAds

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

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
    var mark: Double! = 0
    let request = GADRequest()
    var kw = UserDefaults.standard.string(forKey: "KW")
    var tiw = UserDefaults.standard.string(forKey: "TIW")
    var cw = UserDefaults.standard.string(forKey: "CW")
    var aw = UserDefaults.standard.string(forKey: "AW")
    let kwi = UserDefaults.standard.integer(forKey: "KWI")
    let tiwi = UserDefaults.standard.integer(forKey: "TIWI")
    let cwi = UserDefaults.standard.integer(forKey: "CWI")
    let awi = UserDefaults.standard.integer(forKey: "AWI")
    var K1: Int!
    var K2: Int!
    var ti1: Int!
    var ti2: Int!
    var c1: Int!
    var c2: Int!
    var a1: Int!
    var a2: Int!
    var k,ti,c,a: Int!
    var label: UILabel!

    
    //ad
    var interstitial: GADInterstitial!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-6691936756757550/4847956014")
        interstitial.delegate = self
        request.testDevices =  [ "3bd53293d528c3523bc5640757fd34f8" ]
        interstitial.load(request)
        setTitles()
        outOfs()
        makeMarkLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UserDefaults.standard.synchronize()
    }
    
    func makeMarkLabel(){
        label = UILabel(frame: CGRect(x: 150, y: 550, width: 200, height: 21))
        label.center = CGPoint(x: 180, y: 530)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = "Mark displayed here"
        self.view.addSubview(label)
    }
    
    func displayMark(){
        label.text = "Mark: %" + String(mark.rounded(toPlaces: 2))
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
        //Int(minutes.text ?? "") ?? 0
        K1 = Int(k1.text!)
        K2 = Int(k2.text!)
        ti1 = Int(TI1.text!)
        ti2 = Int(TI2.text!)
        c1 = Int(C1.text!)
        c2 = Int(C2.text!)
        a1 = Int(A1.text!)
        a2 = Int(A2.text!)
        //checks
        if(TI1.text! == "" || TI2.text! == "" || C1.text! == "" || C2.text! == "" || A2.text! == "" || A2.text! == ""  || TI1.text! == " " || TI2.text! == " " || C1.text! == " " || C2.text! == " " || A2.text! == " " || A2.text! == " "){
            let alert = UIAlertController(title: "Empty Values - Marks", message: "one or more values are empty! Please fill them in!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (kw == "" || tiw == "" || cw == "" || aw == ""){
            let alert = UIAlertController(title: "Empty Values - Weighting", message: "one or more values are empty! Please fill them in!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (kw != "" && tiw != "" && cw != "" && aw != "" && String(K1) != "" && String(K2) != "" && String(ti1) != "" && String(ti2) != "" && String(c1) != "" && String(c2) != "" && String(a1) != "" && String(a2) != ""){
            let knowledge = (Double(K1!) / Double(K2!)) * (Double(kwi)/100)
            let thinkinginq = (Double(ti1!) / Double(ti2!)) * (Double(tiwi)/100)
            let comm = (Double(c1!) / Double(c2!)) * (Double(cwi)/100)
            let app = (Double(a1!) / Double(a2!)) * (Double(awi)/100)
            let total = Double(knowledge + thinkinginq + comm + app) // (kwi + tiwi + cwi + awi)
            mark = (total * 100)
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
            } else {
                print("Ad wasn't ready")
            }
            displayMark()
        }
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
            self.K1 = Int(self.k1.text!)
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
            self.K2 = Int(self.k2.text!)
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
            self.ti1 = Int(textField.text!)
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
            self.ti2 = Int(textField.text!)
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
            self.c1 = Int(textField.text!)
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
            self.c2 = Int(textField.text!)
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
            self.a1 = Int(textField.text!)
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
            self.a2 = Int(textField.text!)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    

}

