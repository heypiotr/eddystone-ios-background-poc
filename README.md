# eddystone-ios-background-poc

Detect Eddystone beacons in the background, and relaunch an app if killed, on iOS

## How to test?

1. Open the device console:
    - Xcode menu → Window → Devices
    - pick your device from the left sidebar
    - at the very bottom of the right pane, click the little arrow pointing up
2. Run the app on your device.
3. Kill the app.
4. In the device console, observe that the app gets relaunched, and keeps discovering your Eddystone beacons:

```
Dec  8 17:03:17 Piotrs-iPhone SpringBoard[61] <Warning>: Application 'UIKitApplication:io.heypiotr.EddyBckgrnd[0x3164]' exited abnormally via signal.
Dec  8 17:03:17 Piotrs-iPhone UserEventAgent[26] <Warning>: 26054701212495: id=io.heypiotr.EddyBckgrnd pid=29805, state=0
Dec  8 17:03:17 Piotrs-iPhone EddyBckgrnd[29807] <Warning>: UIApplicationLaunchOptionsBluetoothCentralsKey = (
	    myCentralManagerIdentifier
	)
Dec  8 17:03:17 Piotrs-iPhone EddyBckgrnd[29807] <Warning>: centralManager willRestoreState: ["kCBRestoredScanOptions": {
	    kCBScanOptionAllowDuplicates = 1;
	}, "kCBRestoredScanServices": (
	    FEAA
	)]
Dec  8 17:03:17 Piotrs-iPhone EddyBckgrnd[29807] <Warning>: centralManagerDidUpdateState: 5
Dec  8 17:03:17 Piotrs-iPhone EddyBckgrnd[29807] <Error>: [CoreBluetooth] WARNING: <CBCentralManager: 0x1475483d0> is disabling duplicate filtering, but is using the default queue (main thread) for delegate events
Dec  8 17:03:22 Piotrs-iPhone EddyBckgrnd[29807] <Warning>: discovered Eddystone UID: edd1ebeac04e5defa017d121ef2c6590
```
