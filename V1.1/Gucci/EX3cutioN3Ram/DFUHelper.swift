//
//  DFUHelper.swift
//  @LynildUnlock
//
//  https://www.instagram.com/p/CfwIJhwrW60
//

import Foundation
import Cocoa

public class DFUHelper:NSViewController{
    
    @IBOutlet weak var cuentaRegresiva:NSTextField!
    
    var buildTask = Process();
    var connectedDeviceModel = String()
    var deviceDetectionHandler:Bool = false
    var supportedDevicesJson = [supportedDevicesStruct]()
    
    
    @IBAction func ButtonBack(_ sender: NSButton) {
        self.dismiss(self);
}
    
    @IBOutlet weak var Downlabel:NSTextField!
    @IBOutlet weak var Homelabel:NSTextField!
    @IBOutlet weak var Powerlabel:NSTextField!
    @IBOutlet weak var Downlabelsec:NSTextField!
    @IBOutlet weak var Homelabelsec:NSTextField!
    @IBOutlet weak var Powerlabelsec:NSTextField!
    
    
    
   public override func viewDidAppear() {
        super.viewDidAppear()
        Reload(true)
    }
    
    
    public func lost_Signal(){
        
        DispatchQueue.main.async{
                
                
            
        }
    }
    
    
    
    public func received_signal(){
        DispatchQueue.main.async{
            
                _ = self.photoshow()
            }
        
        
    }
    
    public override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    func deviceDetect(timer:Timer, Booted:Bool) {
        
                
        if(DeviceInfo("SerialNumber") != ""){
                        //self.ConnectedString.stringValue = "\(devices.productName) in \(mode) mode detected"
                    DispatchQueue.main.async{
                        self.received_signal()
                    }
            }
                
                
                else {
                                self.lost_Signal()
                            
                        
                    //self.ConnectedString.stringValue = "Please connect your iDevice"
                    //self.GoBTN.isEnabled = false
                }
            
        
        
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
    func currentDirectory()->String{
        return Bundle.main.resourcePath! + "/Executables"
    }
    
    func ircv_info(_ Info:String)->String{
                _ = self.shellExec(currentDirectory() + "/irecovery -q | grep -w " + Info + " | sed 's/" + Info + ": //g' &>" + Escritorio() + "/.irecovery")
        let ret = shellExec("cat " + Escritorio() + "/.irecovery")
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
    
    
    @IBOutlet weak var seisese:NSImageView!
    @IBOutlet weak var seiseseplus:NSImageView!
    @IBOutlet weak var siete:NSImageView!
    @IBOutlet weak var sieteplus:NSImageView!
    @IBOutlet weak var ocho:NSImageView!
    @IBOutlet weak var ochoplus:NSImageView!
    @IBOutlet weak var equis:NSImageView!
    public func photoshow()->String{
        switch(DeviceInfo("ProductType")){
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
            //seiseseplus.isHidden = true;
            siete.isHidden = true;
            //sieteplus.isHidden = true;
            ocho.isHidden = true;
            //ochoplus.isHidden = true;
            equis.isHidden = true;
            Downlabel.isHidden = true
            Downlabelsec.isHidden = true
            Homelabel.isHidden = false
            Homelabelsec.isHidden = false
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*71ap",    0x04, 0x8000 */ "iPhone  6s";
            

        case "iPhone8,2":
            
            seisese.isHidden = true;
            //seiseseplus.isHidden = false;
            siete.isHidden = true;
            //sieteplus.isHidden = true;
            ocho.isHidden = true;
            //ochoplus.isHidden = true;
            equis.isHidden = true;
            Downlabel.isHidden = true
            Downlabelsec.isHidden = true
            Homelabel.isHidden = false
            Homelabelsec.isHidden = false
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*66ap",    0x06, 0x8000 */ "iPhone  6s Plus";

        case "iPhone8,4":
            return /*69ap",    0x02, 0x8003 */ "iPhone  SE (1st gen)";


        case "iPhone9,1":
            
            seisese.isHidden = true;
            //seiseseplus.isHidden = true;
            siete.isHidden = false;
            //sieteplus.isHidden = true;
            ocho.isHidden = true;
            //ochoplus.isHidden = true;
            equis.isHidden = true;
            Downlabel.isHidden = false
            Downlabelsec.isHidden = false
            Homelabel.isHidden = true
            Homelabelsec.isHidden = true
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*"d10ap",    0x08, 0x8010 */ "iPhone  7 (Global)";


        case "iPhone9,2":
            
            seisese.isHidden = true;
            //seiseseplus.isHidden = true;
            siete.isHidden = true;
            //sieteplus.isHidden = false;
            ocho.isHidden = true;
            //ochoplus.isHidden = true;
            equis.isHidden = true;
            Downlabel.isHidden = false
            Downlabelsec.isHidden = false
            Homelabel.isHidden = true
            Homelabelsec.isHidden = true
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*"d11ap",    0x0a, 0x8010 */ "iPhone  7 Plus (Global)";


        case "iPhone9,3":
            
            seisese.isHidden = true;
            //seiseseplus.isHidden = true;
            siete.isHidden = false;
            //sieteplus.isHidden = true;
            ocho.isHidden = true;
            //ochoplus.isHidden = true;
            equis.isHidden = true;
            Downlabel.isHidden = false
            Downlabelsec.isHidden = false
            Homelabel.isHidden = true
            Homelabelsec.isHidden = true
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*"d101ap",   0x0c, 0x8010 */ "iPhone  7 (GSM)";


        case "iPhone9,4":
            seisese.isHidden = true;
            //seiseseplus.isHidden = true;
            siete.isHidden = true;
            //sieteplus.isHidden = false;
            ocho.isHidden = true;
            //ochoplus.isHidden = true;
            equis.isHidden = true;
            Downlabel.isHidden = false
            Downlabelsec.isHidden = false
            Homelabel.isHidden = true
            Homelabelsec.isHidden = true
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*"d111ap",   0x0e, 0x8010 */ "iPhone  7 Plus (GSM)";


        case "iPhone10,1":
            
            seisese.isHidden = true;
            //seiseseplus.isHidden = true;
            siete.isHidden = true;
            //sieteplus.isHidden = true;
            ocho.isHidden = false;
            //ochoplus.isHidden = true;
            equis.isHidden = true;
            Downlabel.isHidden = false
            Downlabelsec.isHidden = false
            Homelabel.isHidden = true
            Homelabelsec.isHidden = true
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*20ap",    0x02, 0x8015*/ "iPhone  8 (Global)";


        case "iPhone10,2":
            
            seisese.isHidden = true;
            //seiseseplus.isHidden = true;
            siete.isHidden = true;
            //sieteplus.isHidden = true;
            ocho.isHidden = true;
            //ochoplus.isHidden = false;
            equis.isHidden = true;
            Downlabel.isHidden = false
            Downlabelsec.isHidden = false
            Homelabel.isHidden = true
            Homelabelsec.isHidden = true
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*21ap",    0x04, 0x8015*/ "iPhone  8 Plus (Global)";


        case "iPhone10,3":
            
            seisese.isHidden = true;
            //seiseseplus.isHidden = true;
            siete.isHidden = true;
            //sieteplus.isHidden = true;
            ocho.isHidden = true;
            //ochoplus.isHidden = true;
            equis.isHidden = false;
            Downlabel.isHidden = false
            Downlabelsec.isHidden = false
            Homelabel.isHidden = true
            Homelabelsec.isHidden = true
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*22ap",    0x06, 0x8015*/ "iPhone  X (Global)";


        case "iPhone10,4":
            
                
                seisese.isHidden = true;
                //seiseseplus.isHidden = true;
                siete.isHidden = true;
                //sieteplus.isHidden = true;
                ocho.isHidden = false;
                //ochoplus.isHidden = true;
                equis.isHidden = true;
            Downlabel.isHidden = false
            Downlabelsec.isHidden = false
            Homelabel.isHidden = true
            Homelabelsec.isHidden = true
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*201ap",   0x0a, 0x8015*/ "iPhone  8 (GSM)";


        case "iPhone10,5":
            
            seisese.isHidden = true;
            //seiseseplus.isHidden = true;
            siete.isHidden = true;
            //sieteplus.isHidden = true;
            ocho.isHidden = true;
            //ochoplus.isHidden = false;
            equis.isHidden = true;
            Downlabel.isHidden = false
            Downlabelsec.isHidden = false
            Homelabel.isHidden = true
            Homelabelsec.isHidden = true
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*211ap",   0x0c, 0x8015*/ "iPhone  8 Plus (GSM)";


        case "iPhone10,6":
            
            seisese.isHidden = true;
            //seiseseplus.isHidden = true;
            siete.isHidden = true;
            //sieteplus.isHidden = true;
            ocho.isHidden = true;
            //ochoplus.isHidden = true;
            equis.isHidden = false;
            Downlabel.isHidden = false
            Downlabelsec.isHidden = false
            Homelabel.isHidden = true
            Homelabelsec.isHidden = true
            Powerlabel.isHidden = false
            Powerlabelsec.isHidden = false
            return /*221ap",   0x0e, 0x8015*/ "iPhone  X (GSM)";

        default:
            return ""

        }
    }
    func DeviceInfo(_ Info:String)->String{
      let Ret:String = shellExec("cd " + currentDirectory() + "; ./ideviceinfo | grep -w " + Info + " | sed 's/" + Info + ": //g'");
      return Ret;
    }
    
    func Recovery(){
        if(ircv_info("MODE") == "ERROR: Unable to connect to device"){
            Recovery()
        }
    }
    
    @IBOutlet weak var labelDebug:NSTextField!
    @IBOutlet weak var ButtonHelper:NSButton!
    
    @IBAction func DFUHelper(_ sender:Any?){
        Reload(false)
        _ = shellExec("echo &>" + currentDirectory() + "/.dfu")
        if(DeviceInfo("SerialNumber") != ""){
                _ = shellExec(currentDirectory() + "/ideviceenterrecovery " + DeviceInfo("UniqueDeviceID"))
            if(DeviceInfo("SerialNumber").contains("ERROR: Could not connect to lockdownd: SSL error (-5)")){
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
                    _ = shellExec("killall Finder")
                    sleep(3)
                    DispatchQueue.main.async{
                            self.labelDebug.stringValue = "5"
                        
                    }
                    sleep(2)
                    _ = shellExec("killall Finder")
                    DispatchQueue.main.async{
                        
                            self.labelDebug.stringValue = "4"
                        
                    }
                    sleep(2)
                    DispatchQueue.main.async{
                        
                            self.labelDebug.stringValue = "3"
                        
                    }
                    sleep(2)
                    DispatchQueue.main.async{
                        
                            self.labelDebug.stringValue = "2"
                        
                    }
                    sleep(2)
                    DispatchQueue.main.async{
                        
                            self.labelDebug.stringValue = "1"
                        
                    }
                    
                    
                    
                    }
                    _ = shellExec("killall Finder")
                    sleep(3)
                    DispatchQueue.main.async{
                            self.Powerlabelsec.stringValue = "5"
                        
                    }
                    sleep(1)
                    DispatchQueue.main.async{
                        
                            self.Powerlabelsec.stringValue = "4"
                        
                    }
                    sleep(1)
                    DispatchQueue.main.async{
                        
                            self.Powerlabelsec.stringValue = "3"
                        
                    }
                    sleep(1)
                    DispatchQueue.main.async{
                        
                            self.Powerlabelsec.stringValue = "2"
                        
                    }
                    sleep(1)
                    DispatchQueue.main.async{
                        
                            self.Powerlabelsec.stringValue = "1"
                        
                    }
            _ = shellExec(currentDirectory() + "/irecovery -n")
            DispatchQueue.main.async{
                
                    self.Powerlabelsec.stringValue = "0"
                self.Powerlabelsec.isEnabled = false
                self.Powerlabel.isEnabled = false
                
            }
            _ = shellExec("rm " + currentDirectory() + "/.dfu")
        }
    
    
    }
    
    
    
    
    
}
