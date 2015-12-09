# eddystone-ios-background-poc

Detect Eddystone beacons in the background, and relaunch an app if killed, on iOS

## How to test?

1. Open the device console:
    - Xcode menu → Window → Devices
    - pick your device from the left sidebar
    - at the very bottom of the right pane, click the little arrow pointing up

2. Run the app on your device.

3. Switch to another memory-intensive game, so that iOS terminates the EddyBckgrnd app due to memory pressure.

   **Important!** If you kill the app with the app switcher, iOS takes this as a signal that you explicitly don't want the app running, and won't relaunch it.
   
4. In the device console, observe that the app gets relaunched, and keeps discovering your Eddystone beacons:

```
Dec  9 09:14:50 Piotrs-iPhone EddyBckgrnd[32072] <Warning>: Received memory warning.
Dec  9 09:15:01 Piotrs-iPhone SpringBoard[61] <Warning>: Application 'UIKitApplication:io.heypiotr.EddyBckgrnd[0xc435]' was killed by jetsam.
Dec  9 09:15:04 Piotrs-iPhone EddyBckgrnd[32131] <Warning>: UIApplicationLaunchOptionsBluetoothCentralsKey = (
            myCentralManagerIdentifier
        )
Dec  9 09:15:04 Piotrs-iPhone EddyBckgrnd[32131] <Warning>: centralManager willRestoreState: ["kCBRestoredScanOptions": {
            kCBScanOptionAllowDuplicates = 1;
        }, "kCBRestoredScanServices": (
            FEAA
        )]
Dec  9 09:15:04 Piotrs-iPhone EddyBckgrnd[32131] <Warning>: centralManagerDidUpdateState: 5
Dec  9 09:15:04 Piotrs-iPhone EddyBckgrnd[32131] <Error>: [CoreBluetooth] WARNING: <CBCentralManager: 0x14ed52ce0> is disabling duplicate filtering, but is using the default queue (main thread) for delegate events
Dec  9 09:15:04 Piotrs-iPhone EddyBckgrnd[32131] <Warning>: discovered Eddystone UID: edd1ebeac04e5defa017d121ef2c6590
```
