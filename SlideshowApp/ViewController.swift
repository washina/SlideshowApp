//
//  ViewController.swift
//  SlideshowApp
//
//  Created by YutaIwashina on 2017/04/05.
//  Copyright © 2017年 Yuta.Iwashina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 各IBOutlet使用準備
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startAndStop: UIButton!
    @IBOutlet weak var appTitle: UILabel!
    
    
    // タイマー準備
    var timer: Timer!
    // 画像番号の設定
    var imageNo = 0
    // 配列imageNameの要素数
    var maxImageNo = 5
    
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
        // Do any additional setup after loading the view, typically from a nib.
        
        // 各ボタン、タイトルの背景色設定
        backButton.backgroundColor = UIColorFromRGB(rgbValue: 0x90ee90)
        nextButton.backgroundColor = UIColorFromRGB(rgbValue: 0x90ee90)
        startAndStop.backgroundColor = UIColorFromRGB(rgbValue: 0x90ee90)
        appTitle.backgroundColor = UIColorFromRGB(rgbValue: 0x87cefa)
        
        // 再生/停止ボタンに再生を表示しておく
        startAndStop.setTitle("再生", for: .normal)
        
        // imageView（表示する画像）、各ボタンのbackground、タイトルを角丸に
        // imageView
        self.imageView.layer.cornerRadius = 30
        self.imageView.layer.masksToBounds = true
        // 戻るボタン
        self.backButton.layer.cornerRadius = 10
        self.backButton.layer.masksToBounds = true
        // 進むボタン
        self.nextButton.layer.cornerRadius = 10
        self.nextButton.layer.masksToBounds = true
        // 再生/停止ボタン
        self.startAndStop.layer.cornerRadius = 10
        self.startAndStop.layer.masksToBounds = true
        // タイトル
        self.appTitle.layer.cornerRadius = 5
        self.appTitle.layer.masksToBounds = true
        
        // 画像ファイル読み込み、表示
        dispImage()
    }
    
    // タッチされたときの処理
    @IBAction func tapEvent(_ sender: Any) {
        func segue() {
            self.performSegue(withIdentifier: "jump", sender: nil)
        }
        
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "toSecondViewController" {
//                let secondViewController = segue.destination as! SecondViewController
//                secondViewController.getImage = sender as! UIImage;
//            }
//        }
    }
    
    @IBAction func startAndStop(_ sender: Any) {
        // タイマースタート（スライドスタート）処理
        if self.timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            // 再生ボタンのテキストを停止にする
            startAndStop.setTitle("停止", for: .normal)
            //　戻る、進むボタンを隠す
            backButton.isHidden = true
            nextButton.isHidden = true
        } else {
            // テキストを再生に戻す
            startAndStop.setTitle("再生", for: .normal)
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
        if imageNo > (maxImageNo - 1) {
            imageNo = 0
        }
        // 画像表示
        dispImage()
    }
    
    // 戻るボタン処理
    @IBAction func backButton(_ sender: UIButton) {
        imageNo -= 1
        if imageNo < 0 {
            imageNo = (maxImageNo - 1)
        }
        dispImage()
    }
    // 進むボタン処理
    @IBAction func nextButton(_ sender: UIButton) {
        imageNo += 1
        if imageNo > (maxImageNo - 1) {
            imageNo = 0
        }
        dispImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        // 戻る際の処理
    }


}

