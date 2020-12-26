//
//  ViewController.swift
//  Swift6Camera
//
//  Created by Takuya Ando on 2020/12/26.
//

import UIKit
import Photos

class ViewController: UIViewController,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate
{
  var checkPermission = CheckPermisson()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    checkPermission.checkCamera()
  }

  // アルバム
  @IBAction func album(_ sender: Any) {
  }
  
  // カメラ
  @IBAction func camera(_ sender: Any) {
  }
  
  // シェアボタン
  @IBAction func share(_ sender: Any) {
  }
  
}

