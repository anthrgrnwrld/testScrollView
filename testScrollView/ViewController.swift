//
//  ViewController.swift
//  testScrollView
//
//  Created by Masaki Horimoto on 2016/06/09.
//  Copyright © 2016年 Masaki Horimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressToLibrary(sender: AnyObject) {
        shiftToImagePickerController()
    }
    
    /**
     ImagePickerControllerに遷移する
     */
    func shiftToImagePickerController() {
        
        //Libraryにアクセス出来るか確認. 出来なければreturn.
        guard UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) else {
            print("Cannot access PickerControllerSourceType.")
            return
        }
        
        let pickerController = UIImagePickerController()    //ImagePickerControllerをインスタンス化
        pickerController.delegate = self                    //delegateを自身に設定
        pickerController.sourceType = .PhotoLibrary         //カメラとライブラリどちらを表示するか指定
        self.presentViewController(pickerController, animated: true, completion: nil)   //imagePickerControllerに遷移
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo: [String : AnyObject]) {
        
        //ImagePickerControllerで選択した写真にアクセス出来るか確認. 出来なければFatalError.
        guard let image = didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("originalImage is invalid.")
        }
        
        //editViewControllerをインスタンス化出来きるか確認. 出来なければFatalError.
        guard let editViewController = storyboard?.instantiateViewControllerWithIdentifier("EditViewController") as? EditViewController else {
            fatalError("EditViewController is invalid.")
        }
        
        editViewController.image = image                                //選択した写真の遷移後のviewControllerでの表示準備
        picker.pushViewController(editViewController, animated: true)   //EditViewControllerへ遷移
        
    }

}

