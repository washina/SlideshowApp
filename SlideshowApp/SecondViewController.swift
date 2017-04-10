//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by YutaIwashina on 2017/04/06.
//  Copyright © 2017年 Yuta.Iwashina. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // 各IBOutlet使用準備
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var secondBackButton: UIButton!
    @IBOutlet weak var secondAppTitle: UILabel!
    
    // 画像の受取プロパティ
    var getImage = UIImage()
    
    // rgb変換関数
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 各ボタン、タイトルの背景色設定
        secondBackButton.backgroundColor = UIColorFromRGB(rgbValue: 0x90ee90)
        secondAppTitle.backgroundColor = UIColorFromRGB(rgbValue: 0x87cefa)
        
        // 各ボタンのbackground、タイトルを角丸に
        // 戻るボタン
        self.secondBackButton.layer.cornerRadius = 10
        self.secondBackButton.layer.masksToBounds = true
        // タイトル
        self.secondAppTitle.layer.cornerRadius = 5
        self.secondAppTitle.layer.masksToBounds = true

        // 画像の表示
        imageView.image = getImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
