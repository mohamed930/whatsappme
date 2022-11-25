//
//  NumberPhoneViewModel.swift
//  whatsme
//
//  Created by Mohamed Ali on 21/11/2022.
//

import Foundation
import RxSwift
import RxCocoa
import ProgressHUD

class NumberPhoneViewModel {
    
    // MARK: TODO: This Section for RxVariables.
    var phoneNumberBehaviour = BehaviorRelay<String>(value: "")
    
    var urlWhats = String()
    
    
    // MARK: TODO: This Method For open what'sapp with the url.
    func openWhatsAppChatOperation(code: String) {
        
        // First Initialise the url with the code + phonenumber and add default message we sent to the chat.
        initialiseSendMessageToNumber(code: code,phonenumber: phoneNumberBehaviour.value, message: "اهلا انا محمد على اللي كلمتك دلوقتى")
        
        // convert String to url with adding encoding
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = URL(string: urlString) {
                
                if UIApplication.shared.canOpenURL(whatsappURL) {
                    // open Share UIApplication with the Url
                    openApplication(AppLink: whatsappURL)
                } else {
                    // if we can't found the what's app on your phone
                    // show error message.
                    ProgressHUD.showError("Please, install What'sapp application")
                    
                    // open appstore to what's app application to download it.
                    if let url = URL(string: "itms-apps://itunes.apple.com/app/id310633997") {
                        openApplication(AppLink: url)
                    }
                    
                }
            }
        }
    }
    // -------------------------------------------
    
    
    // MARK: TODO: This Method For initialise the line we go to with what'sapp.
    private func initialiseSendMessageToNumber(code:String,phonenumber: String , message: String) {
        // &abid=12354&
        self.urlWhats = "whatsapp://send?phone=" + code + phonenumber + "&text=" + message
        
    }
    // -------------------------------------------
    
    // MARK: TODO: This Method For open Application.
    private func openApplication(AppLink: URL) {
        UIApplication.shared.open(AppLink)
    }
    // -------------------------------------------
}
