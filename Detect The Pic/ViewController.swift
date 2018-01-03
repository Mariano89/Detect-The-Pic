//
//  ViewController.swift
//  Detect The Pic
//
//  Created by Mariano Echegoyen on 1/2/18.
//  Copyright © 2018 Mariano Echegoyen. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let resnetModel = Resnet50()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    }
    
    func processPic(image: UIImage) {
        if let model = try? VNCoreMLModel(for: resnetModel.model) {
            let request = VNCoreMLRequest(model: model, completionHandler: { (request, error) in
                if let results = request.results as? [VNClassificationObservation] {
                    for result in results {
                        print("ID: \(result.identifier) Confidence: \(result.confidence)")
                    }
                }
            })
            
            if let imageData = UIImageJPEGRepresentation(image, 1.0) {
                let handler = VNImageRequestHandler(data: imageData, options: [:])
                try? handler.perform([request])
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            processPic(image: image)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
}

