//
//  ImagePicker.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
  
  @Environment(\.presentationMode) private var presentationMode
  @Binding var selectedImage: UIImage
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    
    let imagePicker = UIImagePickerController()
    imagePicker.allowsEditing = false
    imagePicker.sourceType = .photoLibrary
    imagePicker.delegate = context.coordinator
    
    return imagePicker
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    
  }
  
  final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_ parent: ImagePicker) {
      self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
      if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        parent.selectedImage = image
      }
      
      parent.presentationMode.wrappedValue.dismiss()
    }
  }
}
