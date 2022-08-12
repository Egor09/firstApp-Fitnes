//
//  OkCanselAlert.swift
//  FirstApp04.04_Process
//
//  Created by Егор Филиппов on 10.05.2022.
//

import UIKit

extension UIViewController {
    func alertOkCancel(title: String, message: String?, copletionHandler: @escaping () -> Void) {
        
        let alertController = UIAlertController (title: title,
                                                 message: message,
                                                 preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            copletionHandler()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
}
