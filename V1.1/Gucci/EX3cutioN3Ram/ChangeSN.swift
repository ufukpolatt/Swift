//
//  ViewController.swift
//  MagicCFG
//
//  Created by Jan Fabel on 11.06.20.
//  Copyright © 2020 Jan Fabel. All rights reserved.
//

import Cocoa
import ORSSerial
import os


var restoreBackupPath: URL?
var port = ORSSerialPortManager.shared().availablePorts[0]

var all_log = String()
var global_output = String()

var dataStat = false

var usbDelegate = true



class ChangeSN: NSViewController, ORSSerialPortDelegate,NSTextFieldDelegate {
	func serialPortWasRemovedFromSystem(_ serialPort: ORSSerialPort) {
		print("Serial closed")
		SerialConnectBTN.title = NSLocalizedString("Connect", comment: "")
	}
	


var restoreBackupPath: URL?
var port = ORSSerialPortManager.shared().availablePorts[0]

var all_log = String()
var global_output = String()

var dataStat = false

var usbDelegate = true


	
	@IBAction func DebugNow(_ sender: Any) {
		let url = URL(fileURLWithPath: Bundle.main.resourcePath!)
		let path = url.deletingLastPathComponent().deletingLastPathComponent().path + "/Contents/MacOS/MagicCFG"
		let task = Process()
		task.launchPath = "/usr/bin/open"
		task.arguments = ["/System/Applications/Utilities/Terminal.app",path]
		task.launch()
		exit(0)
	}
	
	@IBAction func ButtonBack(_ sender: NSButton) {
		self.dismiss(self);
}
	
	@IBOutlet weak var datasup: NSTextField!
	
	@IBAction func WRITENEWREGN(_ sender: Any) {
		let command = "syscfg add Regn CH/A".data(using: .utf8)! + Data([0x0A])
		port.send(command)
		ReadSysCFGBTNFUNC(self)
	}
	
	@IBAction func WRITENEWREGNOFF(_ sender: Any) {
		let command = "syscfg add Regn LL/A".data(using: .utf8)! + Data([0x0A])
		port.send(command)
		ReadSysCFGBTNFUNC(self)
	}
	

	
	override var representedObject: Any?{
		didSet{
			//Update the view, if already loaded
		}
	}
	/// Manual Port Selection
	var ports_array = [String]()
	

	
	
	@IBOutlet weak var CameraFixBTN: NSButton!
	@IBOutlet weak var UnbindWifiBTN: NSButton!
	@IBOutlet weak var OldCameraFixBTN: NSButton!
	@IBOutlet weak var NANDSizeLabel: NSTextField!
	@IBOutlet weak var WriteSN_BTN: NSButton!
	@IBOutlet weak var WriteModeBTN: NSButton!
	@IBOutlet weak var WriteRegionBTN: NSButton!
	@IBOutlet weak var WriteColorBTN: NSButton!
	@IBOutlet weak var WriteWifiBTN: NSButton!
	@IBOutlet weak var WriteBMacBTN: NSButton!
	@IBOutlet weak var WriteEMacBTN: NSButton!
	@IBOutlet weak var WriteMLBBTN: NSButton!
	@IBOutlet weak var WriteModelBTN: NSButton!
	@IBOutlet weak var WriteNVSNBTN: NSButton!
	@IBOutlet weak var WriteLCMBTN: NSButton!
	@IBOutlet weak var WriteBatteryBTN: NSButton!
	@IBOutlet weak var WriteMtSNBTN: NSButton!
	
	@IBOutlet weak var RegionField: NSTextField!
	@IBOutlet weak var SN_Field: NSTextField!
	@IBOutlet weak var ModeField: NSTextField!
	@IBOutlet weak var WifiField: NSTextField!
	@IBOutlet weak var BMacField: NSTextField!
	@IBOutlet weak var EMacField: NSTextField!
	@IBOutlet weak var MLBField: NSTextField!
	@IBOutlet weak var ModelField: NSTextField!
	@IBOutlet weak var NVSNField: NSTextField!
	@IBOutlet weak var ColorSelect: NSPopUpButton!
	@IBOutlet weak var LCMField: NSTextField!
	@IBOutlet weak var BatteryField: NSTextField!
	@IBOutlet weak var MtSNField: NSTextField!
	@IBOutlet weak var SerialConnectBTN: NSButton!
	@IBOutlet weak var OutputTextView: NSScrollView!
	@IBOutlet weak var ReadBTN: NSButton!
	@IBOutlet weak var Languages_to_select: NSPopUpButton!
	@IBOutlet weak var OutputView: NSScrollView!
	@IBOutlet var TextView_: NSTextView!
	@IBOutlet weak var RestoreBTN: NSButton!
	@IBOutlet weak var BasicFlashBTN: NSButton!
	@IBOutlet weak var BackupBTN: NSButton!
	@IBOutlet weak var DeviceSelection: NSPopUpButton!
	@IBOutlet weak var SNTick: NSButton!
	@IBOutlet weak var ModeTick: NSButton!
	@IBOutlet weak var AreaTick: NSButton!
	@IBOutlet weak var ColorTick: NSButton!
	@IBOutlet weak var WifiTick: NSButton!
	@IBOutlet weak var BMacTick: NSButton!
	@IBOutlet weak var EMacTick: NSButton!
	@IBOutlet weak var MLBTick: NSButton!
	@IBOutlet weak var ModelTick: NSButton!
	@IBOutlet weak var NVSNTick: NSButton!
	@IBOutlet weak var LCMTick: NSButton!
	@IBOutlet weak var BatteryTick: NSButton!
	@IBOutlet weak var MtSNTick: NSButton!
	@IBOutlet weak var BackupLoadingIndicator: NSProgressIndicator!
	@IBOutlet weak var DeviceAgeSet: NSButton!
	
	@IBAction func SwitchDeviceAge(_ sender: Any) {
		if DeviceAgeSet.state == .off {
			deviceAge = 1
			print("Device Age set to .normal")
		} else if DeviceAgeSet.state == .on {
			deviceAge = 2
			print("Device Age set to .legacy")
		}
	}
	
	
	@IBAction func DeselectAllBTN(_ sender: Any) {
		deselectWritingOptions()
	}
	@IBAction func WriteSelectedOptions(_ sender: Any) {
		if SNTick.state == .on {WriteSN_BTN.performClick(sender)}
	}
	func deselectWritingOptions() {
		SNTick.state = .off
	}
	func selectWritingOptions() {
		SNTick.state = .on
	}
	@IBAction func SelectAll(_ sender: Any) {
		selectWritingOptions()
	}
	var nandSize = String()
	var log = String()
	var iPhoneColorArray_values = [String]()
	var iPhoneColorArray_keys = [String]()
	var iPhoneRegionArray_values = [String]()
	var iPhoneRegionArray_keys = [String]()
	var SN = String()
	var Mode = String()
	var Area = String()
	var Color = String()
	var ColorHousing = String()
	var Wifi = String()
	var BMac = String()
	var EMac = String()
	var MLB = String()
	var NVSN = String()
	var NSrN = String()
	var LCMHash = String()
	var Battery = String()
	var BCMS = String()
	var FCMS = String()
	var MtSN = String()
	var Model = String()
	var SysCFGBackup = String()
	let ports = ORSSerialPortManager.shared().availablePorts
	
	
	@IBAction func HomepageLinker(_ sender: Any) {
		if let url = URL(string: "https://magiccfg.com") {
			NSWorkspace.shared.open(url)
		}
	}
	
	@IBAction func RefreshSerialPort(_ sender: Any) {
		port.close()
		ports_array.removeAll()
		let ports = ORSSerialPortManager.shared().availablePorts
		for port in ports {
		ports_array.append("\(port)")
		}
		Select_Port_ITEM.removeAllItems()
		Select_Port_ITEM.addItems(withTitles: ports_array)
		Select_Port_ITEM.autoenablesItems = true
		print(ports_array)
	}
	
	
	@IBOutlet weak var Select_Port_ITEM: NSPopUpButton!
	override func viewDidAppear() {
		port = ORSSerialPortManager.shared().availablePorts[Select_Port_ITEM.indexOfSelectedItem]
		let ports = ORSSerialPortManager.shared().availablePorts
		for port in ports {
		ports_array.append("\(port)")
		}
		Select_Port_ITEM.removeAllItems()
		Select_Port_ITEM.addItems(withTitles: ports_array)
		Select_Port_ITEM.autoenablesItems = true
		print(ports_array)

	}
	
	
	// ===============ESTE MERO==============
	@IBAction func WriteSN(_ sender: Any) {
		let value = SN_Field.stringValue

			//value.removeDangerousCharsForSYSCFG()
			let command = "syscfg add SrNm \(value)".data(using: .utf8)! + Data([0x0A])
			port.send(command)
			SN_Field.window?.makeFirstResponder(nil)

		
	}
	
	
	@IBAction func WriteColor(_ sender: Any) {
		// needs hex, under development
		let selectedColor = ColorSelect.indexOfSelectedItem
		print(iPhoneColorArray_keys[selectedColor])
		print(iPhoneColorArray_values[selectedColor])
		let value = iPhoneColorArray_values[selectedColor]
		if Model == "A1586" || Model == "A1549" || Model == "A1589" || Model == "A1522" || Model == "A1524" || Model == "A1593" || Model == "A1633" || Model == "A1688" || Model == "A1691" || Model == "A1700" || Model == "A1634" || Model == "A1687" || Model == "A1690" || Model == "A1699" {
			let command = "syscfg add DClr \(value)".data(using: .utf8)! + Data([0x0A])
			port.send(command)
		}
		if Model == "A1660" || Model == "A1779" || Model == "A1780" || Model == "A1778" || Model == "A1661" || Model == "A1785" || Model == "A1786" || Model == "A1784" || Model == "A1863" || Model == "A1906" || Model == "A1907" || Model == "A1905" || Model == "A1864" || Model == "A1898" || Model == "A1899" || Model == "A1897" || Model == "A1865" || Model == "A1902" || Model == "A1901" {
			let command = "syscfg add CLHS \(value)".data(using: .utf8)! + Data([0x0A])
			print(command)
			port.send(command)
		}

		
		
	}
	
/// Write buttons end

	
	@IBAction func SerialPortSelect(_ sender: Any) {
		port.close()
		//print("Port Closed", logLevel:.INFO)
		SerialConnectBTN.title = NSLocalizedString("Connect", comment: "")
		
	}
	
 ///Manual command execution
	@IBOutlet weak var ManualCommandField: NSTextField!
	@IBAction func ManualCommanderPressedEnter(_ sender: Any) {
		let command = ManualCommandField.stringValue.data(using: .utf8)! + Data([0x0A])
		if log.count > 500 {
		log = ""
		}
		ManualCommandField.stringValue = ""
		port.send(command)
	}
	
   
	@IBOutlet weak var RebootBTN: NSButton!
	

	@IBAction func GoManualCommander(_ sender: Any) {
		let command = ManualCommandField.stringValue.data(using: .utf8)! + Data([0x0A])
		if log.count > 500 {
		log = ""
		}
		if ManualCommandField.stringValue.data(using: .utf8)! == Data([0x4D,0x61,0x67,0x69,0x63,0x43,0x46,0x47,0x50,0x72,0x6F]) {
			performSegue(withIdentifier: "pro", sender: nil)
			return
		}
		ManualCommandField.stringValue = ""
		port.send(command)
	}
	
	
	

	@IBAction func RebootiDevice(_ sender: Any) {
		let command = "reset".data(using: .utf8)! + Data([0x0A])
		port.send(command)
	}
	
	/// SYSCFG GET FUNCTIONS READ
	var deviceAge = Int()
	
	@IBAction func ReadSysCFGBTNFUNC(_ sender: Any) {
		SN_Field.stringValue = ""
		all_log = ""
	  /* let descriptor = ORSSerialPacketDescriptor(prefixString: "syscfg", suffixString: "\n[", maximumPacketLength: 150, userInfo: nil)
		let nandsizedescriptor = ORSSerialPacketDescriptor(prefixString: "NAND SIZE :", suffixString: "\n[", maximumPacketLength: 150, userInfo: nil)
		let Alt_descriptor = ORSSerialPacketDescriptor(prefixString: "syscfg", suffixString: ":-)", maximumPacketLength: 150, userInfo: nil)
		let Alt_nandsizedescriptor = ORSSerialPacketDescriptor(prefixString: "NAND SIZE :", suffixString: ":-)", maximumPacketLength: 150, userInfo: nil)

		if deviceAge == 1 {
			port.startListeningForPackets(matching: descriptor)
			port.startListeningForPackets(matching: nandsizedescriptor)
			
		}
		if deviceAge == 2 {
			port.startListeningForPackets(matching: Alt_descriptor)
			port.startListeningForPackets(matching: Alt_nandsizedescriptor)
		}
		if deviceAge == 3 {
		}*/
		self.get_SN()
			DispatchQueue.main.async {
				let Temp_back =  "\nSerial: \(self.SN_Field.stringValue)\nMode:"
				
				
				//print("[SYSCFG LOG]:\(Temp_back)", logLevel:.INFO)
			}
		   /* port.stopListeningForPackets(matching: descriptor)
			port.stopListeningForPackets(matching: nandsizedescriptor)
			port.stopListeningForPackets(matching: Alt_nandsizedescriptor)
			port.stopListeningForPackets(matching: Alt_descriptor)*/
	}
	private func documentDirectory() -> String {
		let documentDirectory = NSSearchPathForDirectoriesInDomains(.cachesDirectory,
																	.userDomainMask,
																	true)
		return documentDirectory[0]
	}
	
	@IBAction func ClearBTN(_ sender: Any) {
		cleanAll()
	}
	func cleanAll() {
		SN_Field.stringValue = ""
	}
	
	
	func get_SN() {
	let command = "syscfg print SrNm".data(using: .utf8)! + Data([0x0A])
		port.send(command)
		
	}
	
	@IBAction func iunlock(_ sender:Any){
		
	}
	func serialPort(_ serialPort: ORSSerialPort, didReceivePacket packetData: Data, matching descriptor: ORSSerialPacketDescriptor) {
		 let output = String(data: packetData, encoding: .utf8)
		global_output = output!
		if (output?.contains("list"))! {

		}
		if (output?.contains("SrNm"))! {
			SN = output!
			//SN = remove_the_fucking_chars(func_key: "SrNm", key: SN)
			SN = SN.replacingOccurrences(of: "Serial: ", with: "")
			//SN.removeDangerousCharsForSYSCFG()
			if deviceAge == 2 {
				SN.removeLast()
			}
			SN_Field.stringValue = SN
		}
	}
	
	func controlTextDidChange(_ obj: Notification) {
		let characterSet: NSCharacterSet = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789-_:").inverted as NSCharacterSet
		self.SN_Field.stringValue =  (self.SN_Field.stringValue.components(separatedBy: characterSet as CharacterSet) as NSArray).componentsJoined(by: "").uppercased()
		
	}
	

	/// Button to Connect/Disconnect from serial shell
	@IBAction func SerialConnectBTNFUNC(_ sender: Any) {
		port = ORSSerialPortManager.shared().availablePorts[Select_Port_ITEM.indexOfSelectedItem]
			port.baudRate = 115200
			print(port.baudRate)
			port.delegate = self
			print(port.path)
				if (port.isOpen) {
					port.close()
					portisClosed()
					print("Serial connection closed")
					SerialConnectBTN.title = NSLocalizedString("Connect", comment: "")
				} else {
					SerialConnectBTN.title = NSLocalizedString("Disconnect", comment: "")
					port.open()
					portisOpened()
					print("Serial connection opened")
			}
	}
	
	
	
	@IBAction func SetLanguage(_ sender: Any) {
		switch Languages_to_select.indexOfSelectedItem {
			case 0: UserDefaults.standard.set( ["en"], forKey: "AppleLanguages" )
			case 1: UserDefaults.standard.set( ["zh-HK"], forKey: "AppleLanguages" )
		default: break
		}
	
		let url = URL(fileURLWithPath: Bundle.main.resourcePath!)
		let path = url.deletingLastPathComponent().deletingLastPathComponent().absoluteString
		let task = Process()
		task.launchPath = "/usr/bin/open"
		task.arguments = [path]
		task.launch()
		exit(0)
	}
		
	
	func scrollTextViewToBottom(textView: NSTextView) {
		if textView.string.count > 0 {
			let location = textView.string.count - 1
			let bottom = NSMakeRange(location, 1)
			textView.scrollRangeToVisible(bottom)
		}
	}
   
	func portisClosed() {
	}
	func portisOpened() {
	}
	
	func serialPort(_ serialPort: ORSSerialPort, didEncounterError error: Error) {
		//print("SerialPort \(serialPort) encountered an error: \(error)", logLevel:.ERROR)
		SerialConnectBTN.title = NSLocalizedString("Connect", comment: "")
			DispatchQueue.main.async {
				self.portisClosed()
			}
		
	}
	func serialPort(_ serialPort: ORSSerialPort, didReceive packetData: Data) {
		let output = String(data: packetData, encoding: .utf8)
	   global_output = output!
	   if (output?.contains("list"))! {

	   }
	   if (output?.contains("SrNm"))! {
		   SN = output!
		   //SN = remove_the_fucking_chars(func_key: "SrNm", key: SN)
		   SN = SN.replacingOccurrences(of: "Serial: ", with: "")
		   //SN.removeDangerousCharsForSYSCFG()
		   if deviceAge == 2 {
			   SN.removeLast()
		   }
		   SN_Field.stringValue = SN
	   }
	}

	func serialPort(_ serialPort: ORSSerialPort, requestDidTimeout request: ORSSerialRequest) {
		//print("Command timed out!", logLevel:.ERROR)
	}

	
	@IBOutlet weak var MagicCFG_Version_LBL: NSTextField!
	
	@IBOutlet weak var unsupportedCable: NSButton!
	override func viewWillAppear() {
		super.viewWillAppear()
		portisClosed()
	   // DeviceSelection.addItems(withTitles: files.sorted())
		port.delegate = self
		self.SN_Field.delegate = self


	  //  ManualCommandField.delegate = self
		// Do any additional setup after loading the view.
		let ports = ORSSerialPortManager.shared().availablePorts
		for port in ports {
		ports_array.append("\(port)")
		}
		Select_Port_ITEM.removeAllItems()
		
		if ports_array.count <= 0 {return}
		Select_Port_ITEM.addItems(withTitles: ports_array)
		Select_Port_ITEM.autoenablesItems = true
		print(ports_array)
		
	}

	
	
	func setLanguage() {
		if (UserDefaults.standard.stringArray(forKey: "AppleLanguages") == ["en"]) {
			Languages_to_select.selectItem(at: 0)
		}
		if (UserDefaults.standard.stringArray(forKey: "AppleLanguages") == ["zh-HK"]) {
		   Languages_to_select.selectItem(at: 1)
			}
	}
	
	@IBOutlet weak var DetectedDevice: NSTextField!
	/*func getModelInfo(model: String) {
		let searchedModel = model
		guard let path = Bundle.main.url(forResource: "devices", withExtension: "json") else {return}
		do {
			let data = try Data(contentsOf: path)
			let decoder = JSONDecoder()
			let json = try decoder.decode([deviceModels].self, from: data)
			for device in json {
				for model in device.ANumber {
					if searchedModel == model{
						print("SUCCESS")
						print(model)
						DispatchQueue.main.async {
							self.DetectedDevice.stringValue = device.name
						}
						break
						
					}
				}
			}
			return
		} catch {
			print(error)
			return
		}
	}*/
	
	func makeHEX(input: String) -> String {
		let input = input
		var output = String()
		let parts = input.split(separator: " ")
		for hexstring in parts {
			print(hexstring)
			var fixedhexstring = hexstring.replacingOccurrences(of: "0x", with: "")
			while fixedhexstring.count != 0 {
				let hexpair = String(fixedhexstring.suffix(2))
				if !(fixedhexstring.count < 2) {
					fixedhexstring.removeLast(2)
				} else {
					break
				}
				
				output.append(hexpair)
			}
		}
		//print(output)
		return output
	}
	
	@IBAction func factReset(_ sender: Any) {
		factoryResetDevice()
	}
	func factoryResetDevice() {
	}
	
	
	}
	

