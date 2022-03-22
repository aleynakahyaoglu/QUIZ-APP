//
//  ViewController.swift
//  Quiz
//
//  Created by mac on 24.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var questionBox = QuestionBox()


    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [  Question(a: "True", q: "A slug's blood is green."),
                  Question(a: "True", q: "Approximately one quarter of human bones are in the feet."),
                  Question(a: "True", q: "The total surface area of two human lungs is approximately 70 square metres."),
                  Question(a: "True", q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat."),
                  Question(a: "False", q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place."),
                  Question(a: "True", q: "It is illegal to pee in the Ocean in Portugal."),
                  Question(a: "False", q: "You can lead a cow down stairs but not up stairs."),
                  Question(a: "True", q: "Google was originally called 'Backrub'."),
                  Question(a: "True", q: "Buzz Aldrin's mother's maiden name was 'Moon'."),
                  Question(a: "False", q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant."),
                  Question(a: "False", q: "No piece of square dry paper can be folded in half more than 7 times."),
                  Question(a: "True", q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.")
        
    ]
   
    var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle // doğru ya da yanlış
        let actualAnswer = quiz[questionNumber].answer
        
        
        // sorunun cevabıyla kullanıcının cevabı eşleşiyor mu //
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // soruları başa çevirdik //
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        }else{
            questionNumber = 0
        }
        
        //background değişiminin süresi//
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
      
    }
    // diğer soruya geçildiğinde background temizleniyor //
    @objc func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

