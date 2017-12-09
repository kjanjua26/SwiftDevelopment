//
//  ViewController.swift
//  rajaKamranToe
//
//  Created by Kamran Janjua on 12/9/17.
//  Copyright © 2017 Kamran Janjua. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    var player = 1
    var state = [0,0,0,0,0,0,0,0,0]
    let win = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var status = true

    @IBOutlet weak var winLabel: UILabel!
    
    @IBAction func action(_ sender: AnyObject) {
        if(state[sender.tag-1] == 0 && status == true){
            state[sender.tag-1] = player
            if (player == 1){
                sender.setImage(UIImage(named: "kamran.png"), for: UIControlState())
                player = 2
            }
            else{
                sender.setImage(UIImage(named: "raja.png"), for: UIControlState())
                player = 1
            }
        }
        for combination in win{
            if state[combination[0]] != 0 && state[combination[0]] == state[combination[1]] && state[combination[1]] == state[combination[2]]{
                status = false
                if(state[combination[0]] == 1){
                    winLabel.text = "Janjua Jeet Gaya"
                }else{
                    winLabel.text = "Raja Jeet Gaya"
                }
                playAgainButton.isHidden = false
                winLabel.isHidden = false
            }
        }
        status = false
        for i in state{
            if i == 0{
                status = true
                break
            }
        }
        if status == false{
            winLabel.text = "Dono Jeet Gaye"
            winLabel.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject) {
        state = [0,0,0,0,0,0,0,0,0]
        status = true
        player = 1
        
        playAgainButton.isHidden = true
        winLabel.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

