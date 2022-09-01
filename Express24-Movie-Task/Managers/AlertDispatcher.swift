//
//  AlertDispatcher.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation
import UIKit

final class AlertDispatcher {
    
    private var lastError: AlertMessage?
    
    func dispatch(error: AlertMessage) {
        guard self.lastError != error else { return }
        self.lastError = error
        
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            self.showAlert(on: viewController, error: error)
        }
    }
    
    private func showAlert(on viewController: UIViewController, error: AlertMessage) {
        
        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        
        for button in error.buttons {
            let alertAction = UIAlertAction(title: button, style: .default) { _ in
                ProgressDialog.alert.dismiss(animated: true, completion: nil)
                error.actions[button]?()
                self.lastError = nil
            }
            
            alert.addAction(alertAction)
        }
        DispatchQueue.main.async {
            viewController.presentOnTop(alert, animated: true)
        }
    }
}

struct AlertMessage: Equatable {
    static func == (lhs: AlertMessage, rhs: AlertMessage) -> Bool {
        return lhs.title == rhs.title && lhs.message == rhs.message
    }
    
    let title: String
    let message: String
    let buttons: [String]
    let actions: [String:() -> Void]
}

struct ProgressDialog {
    static var alert = UIAlertController()
    static var progressView = UIProgressView()
    
    static var progressPoint: Float = 0 {
        didSet {
            if progressPoint == 1 {
                ProgressDialog.alert.dismiss(animated: true, completion: nil)
            }
        }
    }
}
