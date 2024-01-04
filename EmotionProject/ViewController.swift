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
    
    // 유저디폴트 사용으로 필요없어졌당
//    var numberList: [Int] = [0,0,0,0,0,0,0,0,0]
    
    let userdefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "감정 다이어리"
        
        // 버튼 태그, 이미지, 제목 세팅
        for i in 0..<9 {
            settingButton(tag: i)
            settingLabel(tag: i)
        }
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        /*
         // numberList를 사용한다면 이 코드도 가능~
        numberList[sender.tag] += 1
        UserDefaults.standard.set(numberList[sender.tag], forKey: "emotionNumList\(sender.tag)")
        labelList[sender.tag].text = "\(textList[sender.tag])\(numberList[sender.tag])"
        print(UserDefaults.standard.integer(forKey: "emotionNumList\(sender.tag)"))
         */
        
        // key를 상수에 저장
        let keyString = "emotionNumList\(sender.tag)"
        var number = getUserDefaultNum(keyString: keyString)
        number += 1
        saveUserDefaultNum(keyString: keyString, valueInt: number) // 저장
        // 라벨에 다시 나오도록
        labelList[sender.tag].text = "\(textList[sender.tag])\(getUserDefaultNum(keyString: keyString))"
    }
    
    func settingButton(tag num: Int) {
        // button타입을 default로(plain으로 하면..)
        buttonList[num].tag = num
        buttonList[num].setBackgroundImage(UIImage(named: "slime\(num+1)"), for: .normal)
        buttonList[num].setTitle(nil, for: .normal)
    
//            buttonList[i].setImage(UIImage(named: "slime\(i+1)"), for: .normal)
    }
    
    func settingLabel(tag num: Int) {
        // 유저디폴트에 emotionNumList + tag 식의 key
        let emotionNumber = getUserDefaultNum(keyString: "emotionNumList\(num)")
        labelList[num].text = "\(textList[num])\(emotionNumber)"
    }
    
    /// key를 인자로 받으면 유저디폴트 값을 반환하는 함수
    func getUserDefaultNum(keyString: String) -> Int {
        return userdefault.integer(forKey: keyString)
    }
    
    /// key를 인자로 받으면 유저디폴트 값을 저장하는 함수
    func saveUserDefaultNum(keyString: String, valueInt: Int){
        userdefault.set(valueInt, forKey: keyString)
    }
}

