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
  
  @IBOutlet weak var backImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    checkPermission.checkCamera()
  }

  // アルバム
  @IBAction func album(_ sender: Any) {
    // createImagePickerにソースタイプ（アルバム）を渡す
    let sourceType:UIImagePickerController.SourceType = .photoLibrary
    createImagePicker(sourceType: sourceType)
  }
  
  // カメラ
  @IBAction func camera(_ sender: Any) {
    
    // createImagePickerにソースタイプ（カメラ）を渡す
    let sourceType:UIImagePickerController.SourceType = .camera
    createImagePicker(sourceType: sourceType)
  }
  
  // シェアボタン
  @IBAction func share(_ sender: Any) {
    
    // ここの文章と同時にSNSサービスなどにシェアされる
    let text = "#サービス名"
    // シェアする画像をjpeg形式で圧縮。圧縮率は任意。かけるほど画像は荒くなるが処理が早くなる
    let image = backImageView.image?.jpegData(compressionQuality: 0.5)
    // シェアするものをitemとして定義。型を訊かれるが何型でもないのでAny
    let item = [text,image as Any]
    // シェアボタンを押したときの画面遷移（下から出てくる画面）の設定
    let activitiyVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
    // 画面遷移
    self.present(activitiyVC, animated: true, completion: nil)
  }
  
  // カメラかアルバムを立ち上げるメソッド
  func createImagePicker(sourceType:UIImagePickerController.SourceType)
  {
    // インスタンスの作成
    let cameraPicker = UIImagePickerController()
    cameraPicker.sourceType = sourceType
    cameraPicker.delegate = self
    cameraPicker.allowsEditing = true
    self.present(cameraPicker, animated: true, completion: nil)
  }
  
  // カメラかアルバムがキャンセルされたとき
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    
    // 選択されたものを閉じるという処理
    picker.dismiss(animated: true, completion: nil)
  }
  
  // editしてchooseが押されたときの処理
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let pickerImage = info[.editedImage] as? UIImage {
      
      backImageView.image = pickerImage
      
      // 選択されたものを閉じるという処理
      picker.dismiss(animated: true, completion: nil)
    }
  }
}

