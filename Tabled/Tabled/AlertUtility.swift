import UIKit

extension UIAlertController {
    static func message(_ message: String) -> UIAlertController {
        let controller = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default) { _ in
            controller.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        controller.addAction(action)
        return controller
    }
}
