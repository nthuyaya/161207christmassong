//
//  EditViewController.swift
//  christmassong
//
//  Created by yaya on 2016/11/26.
//  Copyright © 2016年 yaya. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var songLabel: UITextField!
    @IBOutlet weak var singerLabel: UITextField!
    @IBOutlet weak var lyricTextView: UITextView!
    
    var song : Song = Song()
    
    
    @IBAction func finished(_ sender: Any) {
        let notificationName = Notification.Name("songUpdated")
        
        //取畫面上的值
        song.name = songLabel.text!
        song.singer = singerLabel.text!
        song.lyrics = lyricTextView.text!

        //發送通知
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["song":self.song])
        
        //回到前一頁
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songLabel.text = song.name
        singerLabel.text = song.singer
        lyricTextView.text = song.lyrics
       

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
