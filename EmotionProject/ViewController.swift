//
//  ViewController.swift
//  EmotionProject
//
//  Created by 남현정 on 2024/01/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonList: [UIButton]!
    
    @IBOutlet var labelList: [UILabel]!
    let textList = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "잠와", "심심해", "우울해", "분해"]
    
    var numberList: [Int] = [0,0,0,0,0,0,0,0,0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "감정 다이어리"
        
        for i in 0..<9 {
            // button타입을 default로(plain으로 하면..)
            buttonList[i].tag = i
            buttonList[i].setBackgroundImage(UIImage(named: "slime\(i+1)"), for: .normal)
            buttonList[i].setTitle(nil, for: .normal)
            numberList[i] = UserDefaults.standard.integer(forKey: "emotionNumList\(i)")
            print(UserDefaults.standard.integer(forKey: "emotionNumList\(i)"))
            labelList[i].text = "\(textList[i])\(numberList[i])"
        
//            buttonList[i].setImage(UIImage(named: "slime\(i+1)"), for: .normal)

        }
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        /*
         // 오 이건 왜 안되지?ㅋㅎ -> 아니다 되는듯 집가서 ㅏ다시^^
        numberList[sender.tag] += 1
        UserDefaults.standard.set(numberList[sender.tag], forKey: "emotionNumList\(sender.tag)")
        labelList[sender.tag].text = "\(textList[sender.tag])\(numberList[sender.tag])"
        print(UserDefaults.standard.integer(forKey: "emotionNumList\(sender.tag)"))
         */
        
        var number = UserDefaults.standard.integer(forKey: "emotionNumList\(sender.tag)")
        number += 1
        UserDefaults.standard.set(number, forKey: "emotionNumList\(sender.tag)")
        labelList[sender.tag].text = "\(textList[sender.tag])\(UserDefaults.standard.integer(forKey: "emotionNumList\(sender.tag)"))"
    }
}

