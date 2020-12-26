//
//  CheckPermission.swift
//  Swift6Camera
//
//  Created by Takuya Ando on 2020/12/26.
//

import Foundation
import Photos

class CheckPermisson {
  
  func checkCamera() {
    PHPhotoLibrary.requestAuthorization { (status) in
      switch(status) {
      case.authorized:
        print("許可")
      case .notDetermined:
        print("不許可")
      case .restricted:
        print("制限付き")
        
      case .denied:
        print("否認")
        
      case .limited:
        print("限定")
        
      @unknown default:
        break
        
      }
    }
  }
}
