//
//  QRCodeRedeem.swift
//  app
//
//  Created by Gina Kim on 2019-12-26.
//
import AVFoundation
import UIKit

class QRCodeRedeem: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var previousUIView: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.upce,
                                                  AVMetadataObject.ObjectType.code39,
                                                  AVMetadataObject.ObjectType.code39Mod43,
                                                  AVMetadataObject.ObjectType.code93,
                                                  AVMetadataObject.ObjectType.code128,
                                                  AVMetadataObject.ObjectType.ean8,
                                                  AVMetadataObject.ObjectType.ean13,
                                                  AVMetadataObject.ObjectType.aztec,
                                                  AVMetadataObject.ObjectType.pdf417,
                                                  AVMetadataObject.ObjectType.qr
            ]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            //bbAudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
        
        //dismiss(animated: true)
    }
    
    func found(code: String) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let VanFunStopProgram = storyBoard.instantiateViewController(withIdentifier: "FunStopInfoViewController") as! FunStopInfoViewController;
        
          let redeemQRCode = storyBoard.instantiateViewController(withIdentifier: "PointsViewController") as! PointsViewController;
        redeemQRCode.qrValue = code
//        redeemQRCode.modalPresentationStyle = .fullScreen
        self.present(redeemQRCode, animated: true, completion: nil)
        
//
//        print(code)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
