//
//  ViewController.swift
//  flashlight
//
//  Created by CHAMIKYO on 2021/04/09.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var switchButton: UIButton! //weak 이 버튼이 메모리와 해제되는 시점과 관련, IB: 인터페이스빌더
    @IBOutlet weak var flashImageView: UIImageView! //선언한 이름 바꿀 땐 우클릭 rename 으로 바꾸기, 아니면 연결끊고 다시 연결하기
    
    var isOn = false
    var soundPlayer: AVAudioPlayer?
   
    func preparesound(){
        let path = Bundle.main.path(forResource: "swith.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.prepareToPlay() //미리 소리 준비
        } catch {
            // couldn't load file :(
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preparesound() //뷰컨트롤러가 메모리에 로드될 때 준비하는 함수
        
        // Do any additional setup after loading the view.
    }

    //컨트롤러에서 어떤 이벤트가 났을 때 그액션을 처리하기 위한 함수라는 것으 ㄹ나타냄
    @IBAction func switchTapped(_ sender: Any) {
        isOn = !isOn
        
        soundPlayer?.play()

        
//        if isOn == true {
//            switchButton.setImage(#imageLiteral(resourceName: "onSwitch"), for: .normal)
//            flashImageView.image = #imageLiteral(resourceName: "onBG")
//        }
//
//        else {
//            switchButton.setImage(#imageLiteral(resourceName: "offSwitch"), for: .normal)
//            flashImageView.image = #imageLiteral(resourceName: "offBG")
//        }
            
        //위 if문 두 줄로 하기
            flashImageView.image = isOn ? #imageLiteral(resourceName: "onBG") : #imageLiteral(resourceName: "offBG")
        switchButton.setImage( isOn ?#imageLiteral(resourceName: "onSwitch") : #imageLiteral(resourceName: "offSwitch"), for : .normal)

    }
}

