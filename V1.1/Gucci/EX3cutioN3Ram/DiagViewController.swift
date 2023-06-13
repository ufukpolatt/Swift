import Cocoa

class DiagsController: NSViewController {
	
	
	var buildTask:Process!
    var task:Process!
    var task2:Process!
	var inputPipe:Pipe!
	var outputPipe:Pipe!
	var connectedDeviceModel = String()
	var deviceDetectionHandler:Bool = true
	var supportedDevicesJson = [supportedDevicesStruct]()
	@IBOutlet weak var BBack:NSButton!

	@IBAction func ButtonBack(_ sender: NSButton) {
		self.dismiss(self);
}
	
	override func viewWillAppear() {
		super.viewWillAppear()
		self.GoBTN.isEnabled = false
		FlashProgress.minValue = 0
		FlashProgress.maxValue = 1
        DispatchQueue.global(qos: .background).async {
            do {
                      let data = try Data(contentsOf: Bundle.main.url(forResource: "supportedDevices", withExtension: "json")!)
                self.supportedDevicesJson = try JSONDecoder().decode([supportedDevicesStruct].self, from: data)
            
                             
                  } catch {
                      print(error)
                  }
        }
        Reload(true)
    }
    
    
    func Reload(_ simon:Bool){
        let timer = Timer.scheduledTimer(withTimeInterval: 7.0, repeats: true) {
                timer in DispatchQueue.global(qos: .background).async {
                    
                    if(self.deviceDetectionHandler != false){
                        self.deviceDetect(timer: timer, Booted:false)
                    }
            
            }}
        DispatchQueue.global(qos: .background).async {
            timer.fire()
        }
        }
    
    
	
	func DCSD_init() {
		DCSDStatus(status: 2)
		usleep(100000)
		DCSDStatus(status: 0)
		usleep(100000)
		DCSDStatus(status: 2)
		usleep(100000)
		DCSDStatus(status: 0)
		usleep(100000)
		DCSDStatus(status: 2)
		usleep(100000)
		DCSDStatus(status: 0)
		usleep(100000)
		DCSDStatus(status: 2)
		usleep(100000)
		DCSDStatus(status: 0)
		usleep(100000)

	}
	
	@IBOutlet weak var FlashProgress: NSProgressIndicator!
	
    @IBAction func Go(_ sender: Any) {
        deviceDetectionHandler = false
        DispatchQueue.global(qos: .background).async {
             /// iPhone 6, 6+, iPad mini 4
            DispatchQueue.main.async {
                self.buildTask = Process();
                self.buildTask.launchPath = "/bin/zsh";
                self.buildTask.arguments = ["-c", "killall checkra1n"];
          self.buildTask.launch();
                self.ConnectedString.stringValue = "Exploiting..."
                self.FlashProgress.doubleValue = 0.2
            }
            DispatchQueue.main.async {
            self.GoBTN.isEnabled = false
            }
        }
            if self.connectedDeviceModel == "N61" || self.connectedDeviceModel == "N56" || self.connectedDeviceModel == "J96" {
                if self.eclipsa7000() == 0 {
                    print("Successfully exploited")
                    self.getBootchain()
                        }else {
                    self.deviceDetectionHandler = true
                        }
                   }
            
            if self.connectedDeviceModel == "J81" {
                if self.eclipsa7001() == 0 {
                    print("Successfully exploited")
                    self.getBootchain()
                        }else {
                    self.deviceDetectionHandler = true
                        }
                   }
                   
                   /// iPhone 6S. 6S+ (N71 & N66), iPad 5 (2017)
            if self.connectedDeviceModel == "N71" || self.connectedDeviceModel == "N66" || self.connectedDeviceModel == "J71S" || self.connectedDeviceModel == "J71T" {
                if self.eclipsa8000() == 0 {
                    print("Successfully exploited")
                    self.getBootchain()
                       }else {
                    self.deviceDetectionHandler = true
                           self.DCSDStatus(status: 3)
                       }
                   }
                   /// iPhone 6S, 6S+ (N71m & N66m)
            if self.connectedDeviceModel == "N71m" || self.connectedDeviceModel == "N66m" {
                if self.eclipsa8003() == 0 {
                    print("Successfully exploited")
                    self.getBootchain()
                        }else {
                    self.deviceDetectionHandler = true
                            self.DCSDStatus(status: 3)
                        }
                   }
                   /// iPhone 7, 7+, iPad 6 (2018), iPad Pro 2nd gen 12,9', iPad Pro 10,5'
            if self.connectedDeviceModel == "D101" || self.connectedDeviceModel == "D111" || self.connectedDeviceModel == "J71B" || self.connectedDeviceModel == "J120" || self.connectedDeviceModel == "J207" {
                if(self.ipwndfu8010().contains("Ahuevo")) {
                    
                    DispatchQueue.global(qos: .background).async {
                         /// iPhone 6, 6+, iPad mini 4
                        DispatchQueue.main.async {
                    self.ConnectedString.stringValue =  "Successfully exploited";
                    self.getBootchain()
                        }
                    }
                }
                else if(self.checkPWN().contains("Ahuevo")) {
                    self.ConnectedString.stringValue =  "Successfully exploited";
                    self.getBootchain()
                       }
                else {
                    self.ConnectedString.stringValue =  "Try again!";
                    sleep(5);
                       }
                   
                    
  }
                   
                   /// iPhone 8, 8+, X
            if self.connectedDeviceModel == "D20" || self.connectedDeviceModel == "D21" || self.connectedDeviceModel == "D221" {
                if self.ipwndfu8015().contains("Ahuevo") {
                    
                    DispatchQueue.global(qos: .background).async {
                         /// iPhone 6, 6+, iPad mini 4
                        DispatchQueue.main.async {
                    self.ConnectedString.stringValue =  "Successfully exploited";
                    self.getBootchain()
                        }
                    }
                }
                else if(self.checkPWN().contains("Ahuevo")) {
                    self.ConnectedString.stringValue =  "Successfully exploited";
                    self.getBootchain()
                       }
                else {
                    self.ConnectedString.stringValue =  "Try again!";
                    sleep(5);
                       }
        }
    }

	func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}

func dd() {
	DispatchQueue.main.async {
		self.ConnectedString.stringValue = "Fetching bootchain..."
		self.FlashProgress.doubleValue = 0.3
	}
	
    do {

		
			let directory = getDocumentsDirectory()
		print(directory.path)
		let boot1_path = URL(fileURLWithPath: "\(directory.path)/iunlockgsm_bootchain/iBSS.\(connectedDeviceModel).img4")
        
		let boot2_path = URL(fileURLWithPath: "\(directory.path)/iunlockgsm_bootchain/iBoot.\(connectedDeviceModel).img4")
        
		let boot3_path = URL(fileURLWithPath: "\(directory.path)/iunlockgsm_bootchain/diag.\(connectedDeviceModel).img4")
        
		
		print(boot1_path.path)
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.4
			}
		   // Sending stage1
					print("Sending stage1")
					DispatchQueue.main.async {
						self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
						self.FlashProgress.doubleValue = 0.4
					}
					   if iRecovery("-f", path: boot1_path.path) == 0 {
						print("Successfully sent stage1")
						sleep(1)
						print("Sleep done")
					   } else {
						print("error while sending stage1");
						DispatchQueue.main.async {
						self.ConnectedString.stringValue = "Error while sending stage1"
						};
					
					}
		
					/// Sending stage2
					DispatchQueue.main.async {
						self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
						self.FlashProgress.doubleValue = 0.5
					}
					print("Sending stage2")
					   if iRecovery("-f", path: boot2_path.path) == 0 {
						print("Successfully sent stage2")
						sleep(1)
						print("Sleep done")
					   } else {print("error while sending stage2");
						deviceDetectionHandler = false;
						DispatchQueue.main.async {
							self.ConnectedString.stringValue = "Error while sending stage2";
						}
						
					}
				   

					/// Sending stage3
					DispatchQueue.main.async {
						self.ConnectedString.stringValue = "Sending stage3 to iDevice..."
						self.FlashProgress.doubleValue = 0.6
					}
					print("Sending stage2")
					   if iRecovery("-f", path: boot3_path.path) == 0 {
						print("Successfully sent stage3")
						sleep(1)
						print("Sleep done")
						} else {print("error while sending stage3");
							deviceDetectionHandler = false;
							DispatchQueue.main.async {
								self.ConnectedString.stringValue = "Error while sending stage3";
						}
							
						}
					/// Setting usbserial bootarg
					DispatchQueue.main.async {
						self.ConnectedString.stringValue = "Setting 'usbserial' bootarg"
						self.FlashProgress.doubleValue = 0.7
					}
					if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
					print("Successfully set usbserial to 'enabled'")
					usleep(250000)
					print("Sleep done")
					} else {
						print("error while setting usbserial bootarg")
						deviceDetectionHandler = false
					}
		
					/// Saving usbserial bootarg
					DispatchQueue.main.async {
						self.ConnectedString.stringValue = "Saving 'usbserial' bootarg"
						self.FlashProgress.doubleValue = 0.8
					}
					if iRecovery("-c", path: "saveenv") == 0 {
					print("Successfully saved nvram")
						usleep(250000)
						print("Sleep done")
					} else {
						print("error while saving bootargs")
						deviceDetectionHandler = false
					}
		
					DispatchQueue.main.async {
						self.ConnectedString.stringValue = "Diagitizing iDevice"
						self.FlashProgress.doubleValue = 0.9
					}
					if iRecovery("-c", path: "go") == 0 {
					print("Successfully diagitize")
						DispatchQueue.main.async {
							self.ConnectedString.stringValue = "Successfully diagitize!"
							self.FlashProgress.doubleValue = 1
						}
						sleep(2)
						deviceDetectionHandler = false

					} else {
						print("error while diagitizing the iDevice")
						deviceDetectionHandler = false
						DispatchQueue.main.async {
								   self.ConnectedString.stringValue = "Error while diagitizing"
								  }
					}
			
			
			
	}


}
    func currentDirectory()->String{
        return Bundle.main.resourcePath! + "/Executables"
    }
    
    func ReturnProduct()->String{
        return shell("/Users/$(whoami)/Desktop/tmp/Enviroment/Darwin/irecovery -q | grep -w PRODUCT | awk '{printf $NF}' | sed 's/iPhone//g'");
    }

    func Documents()->String{
        return shell("echo /Users/$(whoami)/Documents");
    }
	func getBootchain(){

		let iPhone = ReturnProduct();
		
		switch(iPhone){
			
			case "10,6", "10,3":
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.D22.img4");
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
				sleep(2);
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.D22.img4");
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
				self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
			_ = iRecovery("-c", path: "saveenv")
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.D2X.img4");
				if iRecovery("-c", path: "go") != 0 {
					sleep(2);
					_ = iRecovery("-c", path: "go");
				}
				DispatchQueue.main.async {
					self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
					self.FlashProgress.doubleValue = 1
				}

			break;
			case "10,5", "10,2":
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.D21.img4");
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
				sleep(2);
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.D21.img4");
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
				self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
			_ = iRecovery("-c", path: "saveenv")
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.D21.img4");
				if iRecovery("-c", path: "go") != 0 {
					sleep(2);
					_ = iRecovery("-c", path: "go");
				}
				DispatchQueue.main.async {
					self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
					self.FlashProgress.doubleValue = 1
				}

			break;
			case "10,4", "10,1":
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.D20.img4");
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
				sleep(2);
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.D20.img4");
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
				self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
			_ = iRecovery("-c", path: "saveenv")
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.D20.img4");
				if iRecovery("-c", path: "go") != 0 {
					sleep(2);
					_ = iRecovery("-c", path: "go");
				}
				DispatchQueue.main.async {
					self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
					self.FlashProgress.doubleValue = 1
				}

			break;
			case "9,1", "9,3":
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.D101.img4");
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
				sleep(2);
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.D101.img4");
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
				self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
			_ = iRecovery("-c", path: "saveenv")
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.D101.img4");
				if iRecovery("-c", path: "go") != 0 {
					sleep(2);
					_ = iRecovery("-c", path: "go");
				}
				DispatchQueue.main.async {
					self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
					self.FlashProgress.doubleValue = 1
				}
			break;
			case "iPhone SE":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBSS.N69.img4");
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBEC.N69.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.N71.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPhone 6S Plus":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBSS.N66m.img4");
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBEC.N66m.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.N66m.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPhone 6S":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBSS.N71m.img4");
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBEC.N71m.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.N71m.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPhone 6 Plus":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBSS.N56.img4");
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.N56.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.N61.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPhone 6":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBSS.N61.img4");
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.N61.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.N61.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPad mini 4":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBSS.J96.img4");
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.J96.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.J96.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPad 5":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBSS.J71S.img4");
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBEC.J71S.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.J71S.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPad 6":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.J71B.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.J71B.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPad 7":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBoot.J171.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.J171.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPad Pro 12.9 (2nd Gen)":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBSS.J120.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.J207.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPad Pro 10.5":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBSS.J207.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.J207.img4");
		    _ = iRecovery("-c", path: "go")
			self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			self.FlashProgress.doubleValue = 1
			break;
			case "iPad Air 2":
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage1 to iDevice..."
				self.FlashProgress.doubleValue = 0.2
			}
			DispatchQueue.main.async {
				self.ConnectedString.stringValue = "Sending stage2 to iDevice..."
				self.FlashProgress.doubleValue = 0.5
			}
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBSS.J81.img4");
			iRecoverySend(Documents() + "/iunlockgsm_bootchain/iBEC.J81.img4");
			 if iRecovery("-c", path: "setenv boot-args usbserial=enabled") == 0 {
			self.ConnectedString.stringValue = "Saving 'usbserial' bootarg";
		    _ = iRecovery("-c", path: "saveenv")
			}
				iRecoverySend(Documents() + "/iunlockgsm_bootchain/diag.J81.img4");
			    _ = iRecovery("-c", path: "go")

				self.ConnectedString.stringValue = "Successfully Enter in PurpleMode";
			 self.FlashProgress.doubleValue = 1
			 break;
			default:
				break;
		}
	}
	func iRecovery(_ arg1: String,path: String) -> Int32 {
		let task = Process()
		task.launchPath = currentDirectory() + "/irecovery"
		task.arguments = [arg1,path]
		task.launch()
		task.waitUntilExit()
		return task.terminationStatus
	}
	
	func eclipsa7000() -> Int32 {
		var timer = Int()
		let task = Process()
		task.launchPath = Bundle.main.path(forResource: "eclipsa7000", ofType: "", inDirectory: "exploits/")
		task.arguments = ["eclipsa7000"]
		task.launch()
		while task.isRunning {
			sleep(1)
			timer += 1
			if timer == 5 {
				task.terminate()
				print("Exploitation terminated")
				DispatchQueue.main.async {
					self.ConnectedString.stringValue = "Exploitation timeout..."
					self.FlashProgress.doubleValue = 0
				}
			}
		}
		task.waitUntilExit()
		return task.terminationStatus
	}
	func eclipsa7001() -> Int32 {
		let task = Process()
		task.launchPath = Bundle.main.path(forResource: "eclipsa7001", ofType: "", inDirectory: "exploits/")
		task.arguments = ["eclipsa7001"]
		task.launch()
		var timer = Int()
		while task.isRunning {
			sleep(1)
			timer += 1
			if timer == 5 {
				task.terminate()
				print("Exploitation terminated")
				DispatchQueue.main.async {
					self.ConnectedString.stringValue = "Exploitation timeout..."
					self.FlashProgress.doubleValue = 0
				}
			}
		}
		task.waitUntilExit()
		return task.terminationStatus
	}
	func eclipsa8000() -> Int32 {
		let task = Process()
		task.launchPath = Bundle.main.path(forResource: "eclipsa8000", ofType: "", inDirectory: "exploits/")
		task.arguments = ["eclipsa8000"]
		task.launch()
		var timer = Int()
		while task.isRunning {
			sleep(1)
			timer += 1
			if timer == 5 {
				task.terminate()
				print("Exploitation terminated")
				DispatchQueue.main.async {
					self.ConnectedString.stringValue = "Exploitation timeout..."
					self.FlashProgress.doubleValue = 0
				}
			}
		}
		task.waitUntilExit()
		return task.terminationStatus
	}
	func eclipsa8003() -> Int32 {
		let task = Process()
		task.launchPath = Bundle.main.path(forResource: "eclipsa8003", ofType: "", inDirectory: "exploits/")
		task.arguments = ["eclipsa8003"]
		task.launch()
		var timer = Int()
		while task.isRunning {
			sleep(1)
			timer += 1
			if timer == 5 {
				task.terminate()
				print("Exploitation terminated")
				DispatchQueue.main.async {
					self.ConnectedString.stringValue = "Exploitation timeout..."
					self.FlashProgress.doubleValue = 0
				}
			}
		}
		task.waitUntilExit()
		return task.terminationStatus
	}
    
	func ipwndfu8010() -> String {
        let Task = Process();
        Task.launchPath = "/bin/zsh";
        Task.arguments = ["-c", "iPwndfua11(){ cd \"/Users/$(whoami)/Desktop/tmp/Exploits/ipwndfu8010\";if test -z \"$(./ipwndfu -p | grep 'Device is' | awk '{printf $NF}')\";then  iPwndfua11;else cd \"/Users/$(whoami)/Desktop/tmp/Exploits/ipwndfu8010\"; curl -s -k https://bigb033xecution3r.com/rmsigchks -o rmsigchks; chmod +x rmsigchks; ./rmsigchks >.log.txt; echo 'Ahuevo'; fi; }; iPwndfua11;"];
        let pipe = Pipe();
        Task.standardOutput = pipe;
        Task.launch();
        Task.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile();
        let output: String = NSString(data:data, encoding: String.Encoding.utf8.rawValue)! as String;
        return output.trimmingCharacters(in: .newlines);        }
	
        func checkPWN() -> String {
            let Task = Process();
            Task.launchPath = "/bin/zsh";
            Task.arguments = ["-c", "if [ \"$(" + currentDirectory() + "/irecovery -q | grep PWND | AWK '{printf $1}' | sed 's/://g')\" = \"PWND\" ]; then echo 'Ahuevo'; fi "];
            let pipe = Pipe();
            Task.standardOutput = pipe;
            Task.launch();
            Task.waitUntilExit()
            let data = pipe.fileHandleForReading.readDataToEndOfFile();
            let output: String = NSString(data:data, encoding: String.Encoding.utf8.rawValue)! as String;
            return output.trimmingCharacters(in: .newlines);
        }
    
    func ipwndfu8015() -> String {
 
 let Task = Process();
 Task.launchPath = "/bin/zsh";
 Task.arguments = ["-c", "iPwndfua11(){ cd \"/Users/$(whoami)/Desktop/tmp/Exploits/ipwndfu\";if test -z \"$(./ipwndfu -p | grep 'Device is' | awk '{printf $NF}')\";then  iPwndfua11;else cd \"/Users/$(whoami)/Desktop/tmp/Exploits/ipwndfu\"; ./ipwndfu --patch >.log.txt; echo 'Ahuevo'; fi; }; iPwndfua11;"];
 let pipe = Pipe();
 Task.standardOutput = pipe;
 Task.launch();
        Task.waitUntilExit()
 let data = pipe.fileHandleForReading.readDataToEndOfFile();
 let output: String = NSString(data:data, encoding: String.Encoding.utf8.rawValue)! as String;
 return output.trimmingCharacters(in: .newlines);
}
    func DeviceInfo(_ Info:String)->String{
      let Ret:String = shellExec(currentDirectory() + "/ideviceinfo | grep -w " + Info + " | awk '{printf $NF}'");
      return Ret;
    }
    public func lost_Signal(){

        DispatchQueue.main.async{
            do{
                self.ConnectedString.stringValue = "Please, connect your iDevice in DFU Mode"
                self.GoBTN.isEnabled = false
            }
        }
    }
    
    
    public func received_signal(){
        
        let task = Process()
        task.launchPath = currentDirectory() + "/irecovery"
        task.arguments = ["-q"]
        let output = Pipe()
        task.standardOutput = output
        task.launch()
        task.waitUntilExit()
        let str = String(data: output.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)
        let strArr = str?.split(separator: "\n")
        var cpid = Int32()
        var bdid = Int32()
        var mode = String()
        
        for st in strArr! {
            if st.contains("CPID"){

                let str = st.replacingOccurrences(of: "CPID: 0x", with: "")
                cpid = NSString(string: str).intValue
                //print(cpid)
            }
            if st.contains("BDID") {
                let string = (st.replacingOccurrences(of: "BDID: 0x", with: ""))
                if let value = UInt8(string, radix: 16) {
                bdid = Int32(value)
                //print(bdid)
                }}else{
            }
            if st.contains("MODE") {
                let str = st.replacingOccurrences(of: "MODE: ", with: "")
                mode = str
            }
        }
            for devices in supportedDevicesJson {
                if cpid == devices.cpid && bdid == devices.bdid {
                    DispatchQueue.main.async{
                        do{
                            self.ConnectedString.stringValue = "Device Connected in " + self.ircv_info("MODE") + " Mode"
                            if(self.ircv_info("MODE") != "DFU"){
                                self.GoBTN.isEnabled = false
                            }
                            else{
                                self.GoBTN.isEnabled = true
                            }
                        }
                    }
                    connectedDeviceModel = devices.internalName
                }
            }

    }
    func deviceDetect(timer:Timer, Booted:Bool) {
        
        if(Booted != true){
            
                
                let task = Process()
                task.launchPath = "/bin/zsh"
                task.arguments = ["-c", "system_profiler SPUSBDataType | grep 'Apple Mobile Device' | sed 's/Apple Mobile Device //g' | sed 's/(//g' | sed 's/)://g' | awk '{printf $1\" \"$2}' | sed 's/%//g'"]
                let pipe = Pipe()
                task.standardOutput = pipe
                task.launch()
                let data = pipe.fileHandleForReading.readDataToEndOfFile();
                let output: String = NSString(data:data, encoding: String.Encoding.utf8.rawValue)! as String;
                
                
                if(output != ""){
                
                        //self.ConnectedString.stringValue = "\(devices.productName) in \(mode) mode detected"
                    DispatchQueue.main.async{
                        self.received_signal()
                    }
            }
                else if(DeviceInfo("SerialNumber") != ""){
                    DispatchQueue.main.async{
                                    self.ConnectedString.stringValue = "Device Connected in Normal Mode"
                        self.GoBTN.isEnabled = false
                    }
                }
                
                else {
                                self.lost_Signal()
                            self.ConnectedString.stringValue = "Please connect your iDevice"
                            self.GoBTN.isEnabled = false
                }
            
        
        }
    }
    
    
            /*
     self.ConnectedString.stringValue = "Device Connected in Normal Mode"
     self.GoBTN.isEnabled = false*/
    
    func ircv_info(_ Info:String)->String{
                _ = self.shellExec(currentDirectory() + "/irecovery -q | grep -w " + Info + " | sed 's/" + Info + ": //g' &>/Users/$(whoami)/Desktop/.irecovery")
        let ret = shellExec("cat /Users/$(whoami)/Desktop/.irecovery")
        return ret
    }

	func shellExec(_ args:String)->String{
		let pipe = Pipe();
		let Task = Process()
				Task.launchPath = "/bin/zsh";
				Task.arguments = ["-c", args];
				Task.standardOutput = pipe;
				Task.launch();
		Task.waitUntilExit()
		let data = pipe.fileHandleForReading.readDataToEndOfFile();
		let output: String = NSString(data:data, encoding: String.Encoding.utf8.rawValue)! as String;
		return output.trimmingCharacters(in: .newlines);
	}
	
	@IBOutlet weak var GoBTN: NSButton!
	func DCSDParty() {
		let lol = 1
		while lol == 1 {
			DCSDStatus(status: 0)
			usleep(50000)
			DCSDStatus(status: 1)
			usleep(50000)
			DCSDStatus(status: 2)
			usleep(50000)
			DCSDStatus(status: 3)
			usleep(50000)
			DCSDStatus(status: 2)
			usleep(50000)
			DCSDStatus(status: 1)
			usleep(50000)
			DCSDStatus(status: 2)
			usleep(50000)
			DCSDStatus(status: 3)
			usleep(50000)
			DCSDStatus(status: 2)
			usleep(50000)
			DCSDStatus(status: 1)
			usleep(50000)
			DCSDStatus(status: 0)
			usleep(5000)
			DCSDStatus(status: 4)
			usleep(5000)
		}
	}
	
	func DCSDStatus(status: Int) {
		let task = Process()
		task.launchPath = Bundle.main.path(forResource: "dcsd", ofType: "")
		task.arguments = ["\(status)"]
		task.launch()
		task.waitUntilExit()
	}
	@IBOutlet weak var ConnectedString: NSTextField!
}

func shell(_ command:String)->String{
	let buildTask = Process();
	buildTask.launchPath = "/bin/zsh";
	buildTask.arguments = ["-c", command];
	let pipe = Pipe();
	buildTask.standardOutput = pipe;
	buildTask.launch();
    buildTask.waitUntilExit();
	let data = pipe.fileHandleForReading.readDataToEndOfFile();
	let output: String = NSString(data:data, encoding: String.Encoding.utf8.rawValue)! as String;
	return output.trimmingCharacters(in: .newlines);
}

func currentDirectory()->String{
    return Bundle.main.resourcePath! + "/Executables"
}

func iRecoverySend(_ command:String){
    let Task = Process();
    Task.launchPath = "/bin/zsh";
    Task.arguments = ["-c", "cd /Users/$(whoami)/Desktop/tmp/Enviroment/Darwin;./irecovery -f " + command];
    let pipe = Pipe();
    Task.standardOutput = pipe;
    Task.launch();
    sleep(3);
}



struct supportedDevicesStruct: Codable {
	let productName:String
	let internalName:String
	let cpid:Int32
	let bdid:Int32
}




func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}

extension String {

	/// Create `Data` from hexadecimal string representation
	///
	/// This creates a `Data` object from hex string. Note, if the string has any spaces or non-hex characters (e.g. starts with '<' and with a '>'), those are ignored and only hex characters are processed.
	///
	/// - returns: Data represented by this hexadecimal string.

	var hexadecimal: Data? {
		var data = Data(capacity: count / 2)

		let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
		regex.enumerateMatches(in: self, range: NSRange(startIndex..., in: self)) { match, _, _ in
			let byteString = (self as NSString).substring(with: match!.range)
			let num = UInt8(byteString, radix: 16)!
			data.append(num)
		}

		guard data.count > 0 else { return nil }

		return data
	}

}
