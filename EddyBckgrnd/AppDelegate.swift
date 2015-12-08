//
//  AppDelegate.swift
//  EddyBckgrnd
//

import UIKit
import CoreBluetooth

private func hexFromBytes(bytes: [UInt8]) -> String {
    var retval = ""
    for byte in bytes {
        var s = String(byte, radix:16, uppercase: false)
        if s.utf8.count == 1 {
            s = "0" + s
        }
        retval += s
    }
    return retval
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CBCentralManagerDelegate {

    var window: UIWindow?

    var centralManager: CBCentralManager!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        if let centralManagerIdentifiers = launchOptions?[UIApplicationLaunchOptionsBluetoothCentralsKey] {
            NSLog("UIApplicationLaunchOptionsBluetoothCentralsKey = \(centralManagerIdentifiers)")
        }

        self.centralManager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionRestoreIdentifierKey: "myCentralManagerIdentifier"])

        return true
    }

    func centralManagerDidUpdateState(central: CBCentralManager) {
        NSLog("centralManagerDidUpdateState: \(central.state.rawValue)")

        if central.state == .PoweredOn {
            self.centralManager.scanForPeripheralsWithServices([CBUUID(string: "FEAA")], options: [CBCentralManagerScanOptionAllowDuplicatesKey: true])
        }
    }

    func centralManager(central: CBCentralManager, willRestoreState dict: [String : AnyObject]) {
        NSLog("centralManager willRestoreState: \(dict)")
    }

    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        //print("centralManager didDiscoverPeripheral: \(peripheral), advertisementData: \(advertisementData), rssi: \(RSSI)")

        if let data = advertisementData[CBAdvertisementDataServiceDataKey]?[CBUUID(string: "FEAA")] as? NSData {
            var bytes = [UInt8](count: data.length, repeatedValue: 0)
            data.getBytes(&bytes, length: data.length)
            if bytes[0] == 0x00 {
                let beaconID: [UInt8] = Array(bytes[2..<18])
                NSLog("discovered Eddystone UID: " + hexFromBytes(beaconID))
            }
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}
