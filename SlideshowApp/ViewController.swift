//
//  ViewController.swift
//  SlideshowApp
//
//  Created by YutaIwashina on 2017/04/05.
//  Copyright © 2017年 Yuta.Iwashina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // タイマー準備
    var timer: Timer!
    
    // 画像番号
    var imageNo = 0
    
    // 画像呼び出し関数
    func dispImage() {
        // 画像を配列imageNameに格納
        let imageName = [ "worldHeritage01", "worldHeritage02", "worldHeritage03", "worldHeritage04", "worldHeritage05" ]
        // 画像番号imageNoで配列imageNameから画像名を取り出す
        let name = imageName[imageNo]
        // 画像の読み込み
        let image = UIImage(named: name)
        // UIImageViewに表示
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画像ファイル読み込み、表示
        let image = UIImage(named: "worldHeritage01")
        imageView.image = image
        
    }
    
    @IBAction func startAndStop(_ sender: Any) {
        // タイマースタート（スライドスタート）処理
        if self.timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            //　戻る、進むボタンを隠す
            backButton.isHidden = true
            nextButton.isHidden = true
        } else {
            // タイマー一時停止（スライド一時停止）処理
            self.timer.invalidate()
            self.timer = nil
            // 戻る、進むボタンの再表示
            backButton.isHidden = false
            nextButton.isHidden = false
        }
    }
    
    func updateTimer(timer: Timer) {
        
        // 画像切り替えのために画像番号に1を足す
        imageNo += 1
        // 最後に割り当てた画像が表示されたら、画像番号0の画像に戻る
        if imageNo > 4 {
            imageNo = 0
        }
        // 画像表示
        dispImage()
    }
    
    // 戻るボタン処理
    @IBAction func backButton(_ sender: UIButton) {
        imageNo -= 1
        if imageNo < 0 {
            imageNo = 4
        }
        dispImage()
    }
    // 進むボタン処理
    @IBAction func nextButton(_ sender: UIButton) {
        imageNo += 1
        if imageNo > 4 {
            imageNo = 0
        }
        dispImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

