//
//  DetailViewController.swift
//  christmassong
//
//  Created by yaya on 2016/11/26.
//  Copyright © 2016年 yaya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var lyricTextView: UITextView!
    
    var song : Song = Song()

       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! EditViewController
        controller.song = song
    }
    
     //更新頁面資訊
    func updateInfo(){
        songLabel.text = song.name
        singerLabel.text = song.singer
        lyricTextView.text = song.lyrics
    }
    
    //當接受到修改通知時 要執行的方法
    func songUpdated(noti:Notification) {
        song = noti.userInfo!["song"] as! Song
        updateInfo()
    }

    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //讓畫面顯示第一頁傳來的資訊
        songLabel.text = song.name
        singerLabel.text = song.singer
        lyricTextView.text = song.lyrics
        
        //申請接受通知
        let notificationName = Notification.Name("songUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(songUpdated(noti:)), name: notificationName, object: nil)
        updateInfo()
        
        // Do any additional setup after loading the view.
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
