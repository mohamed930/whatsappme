//
//  ViewController.swift
//  whatsme
//
//  Created by Mohamed Ali on 19/11/2022.
//

import UIKit
import FlagKits
import RxSwift
import RxCocoa

class NumberViewController: UIViewController {
    
    @IBOutlet weak var holder: FKFlagHolderView!
    
    @IBOutlet weak var number1Button: UIButton!
    @IBOutlet weak var number2Button: UIButton!
    @IBOutlet weak var number3Button: UIButton!
    @IBOutlet weak var number4Button: UIButton!
    @IBOutlet weak var number5Button: UIButton!
    @IBOutlet weak var number6Button: UIButton!
    @IBOutlet weak var number7Button: UIButton!
    @IBOutlet weak var number8Button: UIButton!
    @IBOutlet weak var number9Button: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var number0Button: UIButton!
    
    
    var buttons = Array<UIButton>()
    
    let disposebag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialiseFlagColor()
        SubscribeViewSelected()
        
        buttons = [number1Button,number2Button,number3Button,number4Button,number5Button,number6Button,number7Button,number8Button,number9Button,clearButton,number0Button]
        SetButtonCircle()
        
        holder.textFieldPhone.becomeFirstResponder()
        
    }
    
    func initialiseFlagColor() {
        holder.backgroundPickerColor = .white
        holder.layer.borderColor = UIColor().hexStringToUIColor(hex: "#BFBBC1").cgColor
        holder.layer.borderWidth = 1
        holder.layer.cornerRadius = 5
    }
    
    func SubscribeViewSelected() {
        holder.textFieldPhone.rx.controlEvent(UIControl.Event.editingDidBegin).subscribe(onNext: { _ in
            self.holder.layer.borderColor = UIColor.purple.cgColor
            self.holder.layer.borderWidth = 1.5
            self.holder.textFieldPhone.inputView = UIView()
            self.holder.textFieldPhone.inputAccessoryView = UIView()
        }).disposed(by: disposebag)
        
        holder.textFieldPhone.rx.controlEvent([UIControl.Event.editingDidEndOnExit,UIControl.Event.editingDidEnd]).subscribe(onNext: { _ in
            self.holder.layer.borderColor = UIColor().hexStringToUIColor(hex: "#BFBBC1").cgColor
            self.holder.layer.borderWidth = 1
        }).disposed(by: disposebag)
    }
    
    func SetButtonCircle() {
        buttons.forEach { button in
            if self.view.frame.height > 667 {
                button.layer.cornerRadius = 0.59 * button.bounds.size.width
            }
            else if self.view.frame.height <= 667 {
                button.layer.cornerRadius =  button.frame.height * 0.5
            }
            
            button.clipsToBounds = true
            button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor // UIColor().hexStringToUIColor(hex: "#E8E6E7").cgColor
            button.layer.shadowOpacity = 1
            button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            button.layer.masksToBounds = false
            // print(self.view.frame.height)
        }
    }
    
    @IBAction func ButtonAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            holder.textFieldPhone.text! += "1"
            break
        case 2:
            holder.textFieldPhone.text! += "2"
            break
        case 3:
            holder.textFieldPhone.text! += "3"
            break
        case 4:
            holder.textFieldPhone.text! += "4"
            break
        case 5:
            holder.textFieldPhone.text! += "5"
            break
        case 6:
            holder.textFieldPhone.text! += "6"
            break
        case 7:
            holder.textFieldPhone.text! += "7"
            break
        case 8:
            holder.textFieldPhone.text! += "8"
            break
        case 9:
            holder.textFieldPhone.text! += "9"
            break
        case 10:
//            let str = holder.textFieldPhone.text
            guard let text = holder.textFieldPhone.text else { return }
            holder.textFieldPhone.text = String(text.dropLast())
            break
        case 11:
            holder.textFieldPhone.text! += "0"
            break
        default:
            print("Error")
        }
    }
    


}

