import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(AppSettingsPlugin)
public class AppSettingsPlugin: CAPPlugin {
    
    @objc func openAppSettings(_ call: CAPPluginCall) {
        
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString)
        else {
            call.reject("Open settings url not found")
            return
        }
        DispatchQueue.main.async {
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    if success {
                        call.resolve()
                    } else {
                        call.reject("Unable to open app settings")
                    }
                })
            } else {
                call.reject("Unable to open app settings")
            }
        }
    }
}
