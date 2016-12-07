//
//  SongViewController.swift
//  christmassong
//
//  Created by yaya on 2016/11/26.
//  Copyright © 2016年 yaya. All rights reserved.
//

import UIKit

struct Song {
    var order = 0
    var name = ""
    var singer = ""
    var lyrics = ""
}

class SongViewController: UIViewController {

    @IBOutlet weak var song1Button: UIButton!
    @IBOutlet weak var song2Button: UIButton!
    @IBOutlet weak var song3Button: UIButton!
    @IBOutlet weak var song4Button: UIButton!
    @IBOutlet weak var song5Button: UIButton!

    @IBAction func goDetail(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goDetail", sender: sender)
    }
    
    var songData = [
        Song(order: 0, name : "Last Christmas", singer : "Wham", lyrics : "Last Christmas\nI gave you my heart\nBut the very next day\nyou gave it away\nThis year to save me from tears\nI'll give it to someone special"),
        Song(order: 1, name : "Santa Tell Me", singer : "Ariana Grande", lyrics : "Santa, tell me if you're really there?\nDon't make me fall in love again if he won't be here\nNext year\nSanta, tell me if he really cares?"),
        Song(order: 2, name : "Mistletoe", singer : "Justin Bieber", lyrics : "With you,shawty with you\nWith you,shawty with you\nWith you,under the mistletoe"),
        Song(order: 3, name : "Silent Night", singer : "Kelly Clarkson", lyrics : "Silent night, holy night!\nAll is calm, all is bright.\nRound yon Virgin,\nMother and Child.\nHoly infant so tender and mild,\nSleep in heavenly peace,\nSleep in heavenly peace"),
        Song(order: 4, name : "Joy To The World", singer : "Pentatonix", lyrics : "Joy to the World , the Lord is come!\nLet earth receive her King;\nLet every heart prepare Him room,\nAnd Heaven and nature sing,\nAnd Heaven and nature sing,\nAnd Heaven, and Heaven,\nand nature sing.")
    ]
    
    //更新頁面資訊
    func updateInfo(){
        song1Button.setTitle(songData[0].name, for: UIControlState.normal)
        song2Button.setTitle(songData[1].name, for: UIControlState.normal)
        song3Button.setTitle(songData[2].name, for: UIControlState.normal)
        song4Button.setTitle(songData[3].name, for: UIControlState.normal)
        song5Button.setTitle(songData[4].name, for: UIControlState.normal)
    }
  
    //當接受到修改通知時 要執行的方法
    func songUpdated(noti:Notification) {
        let song = noti.userInfo!["song"] as! Song
        songData[song.order] = song
        
        //比對修改的按鈕去更新
        if song.order == 0{
            song1Button.setTitle(song.name, for: UIControlState.normal)
        }else if song.order == 1{
            song2Button.setTitle(song.name, for: UIControlState.normal)
        }else if song.order == 2{
            song3Button.setTitle(song.name, for: UIControlState.normal)
        }else if song.order == 3{
            song4Button.setTitle(song.name, for: UIControlState.normal)
        }else if song.order == 4{
            song5Button.setTitle(song.name, for: UIControlState.normal)
        }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let button = sender as! UIButton
        //取得button的Restoration ID
        let idx = Int(button.restorationIdentifier!) ?? 0
        let controller = segue.destination as! DetailViewController
        //從songData裡面取出當對應的歌曲傳到下一頁
        controller.song = songData[idx]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //申請接受通知
        let notificationName = Notification.Name("songUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(songUpdated(noti:)), name: notificationName, object: nil)
        
        //更新頁面
        updateInfo()
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
