//
//  EditViewController.swift
//  testScrollView
//
//  Created by Masaki Horimoto on 2016/06/09.
//  Copyright © 2016年 Masaki Horimoto. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pictureView: UIImageView!
    
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0    // 最小拡大率
        scrollView.maximumZoomScale = 4.0    // 最大拡大率
        scrollView.zoomScale = 1.0           // 表示時の拡大率
        
        //imageに値が入っているか確認. 入っていなければreturnする.
        guard let image = image else {
            print("Cannot access PhotoLibrary.")
            return
        }
        
        pictureView.contentMode = .ScaleAspectFit   //contentModeの設定
        pictureView.image = image                   //pictureViewにimageを適応

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        print("\(NSStringFromClass(self.classForCoder)).\(#function) is called!")
        //navigationBarを表示した時に写真が少し下にずれる問題の対策.
        
        self.scrollView.contentInset = UIEdgeInsetsZero
        
    }
    
    /**
     写真の拡大縮小に対応
     */
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.pictureView
    }

    
    
}
