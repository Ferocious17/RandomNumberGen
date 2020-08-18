//
//  ViewController.swift
//  RandomNum
//
//  Created by Caner Kaya on 04.01.20.
//  Copyright © 2020 lll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var from: Int = 0
    
    var to: Int = 0
    
    var randomNumber: Int = 0
    
    var timer = Timer()

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var fromTextField: UITextField!
    
    @IBOutlet weak var toTextField: UITextField!
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.setGradient(FirstColor: UIColor(red: 22/255, green: 89/255, blue: 225/255, alpha: 1.0), SecondColor: UIColor(red: 4/255, green: 244/255, blue: 248/255, alpha: 1.0))
        
        buttonOutlet.setTitle("Generate", for: .normal)
        
        buttonOutlet.setTitleColor(UIColor(red: 102/255, green: 77/255, blue: 135/255, alpha: 1.0), for: .normal)
        
        label.text = nil
        
        label.textAlignment = .right
        
        label.font = label.font.withSize(33)
        
        fromTextField.placeholder = "from..."
        
        toTextField.placeholder = "to..."
        
        fromTextField.keyboardType = .numberPad
        
        toTextField.keyboardType = .numberPad
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(makeKeyboardDisappear))
        
        view.addGestureRecognizer(tap)
        
        messageLabel.text = "Cannot be infinite"
        
        messageLabel.textAlignment = .center
        
        messageLabel.numberOfLines = 2
        
        /*messageLabel.isHidden = true
        
        image.isHidden = true*/
        
        messageLabel.layer.opacity = 0
        
        image.layer.opacity = 0
    }
    
    @objc func makeKeyboardDisappear()
    {
        view.endEditing(true)
    }
    
    @objc func makeAlertDisappear()
    {
        UIView.animate(withDuration: 1.39, animations: ({
            
            self.messageLabel.layer.opacity = 0
            
            self.image.layer.opacity = 0
            
        }), completion: nil)
        
        timer.invalidate()
    }

    @IBAction func generate(_ sender: Any)
    {
        if (fromTextField.text == "" && toTextField.text == "")
        {
            let alert = UIAlertController(title: "Alert", message: "Please enter something", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                self.fromTextField.becomeFirstResponder()
            }))
            
            alert.addAction(UIAlertAction(title: "Exit", style: .destructive, handler: { (action) in
                exit(0)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        else if (fromTextField.text == "" && toTextField.text != "")
        {
            //uses default range (starts from 0 until the entered number in the to-textfield)
            
            //randomNumber = Int.random(in: 0..<to+1)
            
            to = Int(toTextField.text!)!
            
            randomNumber = Int.random(in: 0...to)
            
            label.text = "\(randomNumber)"
        }
        else if (fromTextField.text != "" && toTextField.text == "")
        {
            UIView.animate(withDuration: 1.39, animations: ({
                
                self.messageLabel.layer.opacity = 1
                
                self.image.layer.opacity = 1
                
            }), completion: nil)
                
            
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(makeAlertDisappear), userInfo: nil, repeats: false)
        }
        else
        {
            from = Int(fromTextField.text!)!
        
            to = Int(toTextField.text!)!
        
            //randomNumber = Int.random(in: from..<to+1)
        
            randomNumber = Int.random(in: from...to)
        
            label.text = "\(randomNumber)"
        }
    }
}
