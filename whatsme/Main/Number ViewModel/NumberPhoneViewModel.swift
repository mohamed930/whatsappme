//
//  NumberPhoneViewModel.swift
//  whatsme
//
//  Created by Mohamed Ali on 21/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

class NumberPhoneViewModel {
    
    var phoneNumberBehaviour = BehaviorRelay<String>(value: "")
    
    var urlWhats = String()
    
    private func initialiseSendMessageToNumber(code:String,phonenumber: String , message: String) {
        // &abid=12354&
        self.urlWhats = "whatsapp://send?phone=" + code + phonenumber + "&text=" + message
        
    }
    
    func openWhatsAppChatOperation(code: String) {
        
        initialiseSendMessageToNumber(code: code,phonenumber: phoneNumberBehaviour.value, message: "اهلا انا محمد على اللي كلمتك دلوقتى")
        
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL) {
                    UIApplication.shared.open(whatsappURL)
                } else {
                    print("Install Whatsapp")
                }
            }
        }
    }
}
