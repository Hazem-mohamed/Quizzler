//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Creat New instance {Object} From QuestionBank
    let allQuestion = QuestionBank()
    //This Var To Compare The User Answer 
    var pickedAnswer: Bool = false
    //This Var IS To Track Of The Question We Are On
    var questionNumber:Int = 0
    //The Score Var
    var score:Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creat The First Question
        //let firstQuestion = allQuestion.list[0]
        //questionLabel.text = firstQuestion.questionText
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }else if sender.tag == 2{
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber+1
        
        nextQuestion()
  
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12{
        questionLabel.text = allQuestion.list[questionNumber].questionText
            updateUI()
        }
        else{
            let alert = UIAlertController(title: "Awesome", message: "You Have Finished All The Question Do You Want To Start Over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            // Present The Allert To The User
            present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestion.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            //print("Correct Bravo 3alek :D")
            // Use The ProgressHUD
            ProgressHUD.showSuccess("Correct")
            score += 1
        }else{
            //print("Wrong 7awel Tany ma3lesh :D")
            // Use The ProgressHUD
            ProgressHUD.showError("Wrong")
        }
    }
    
    
    func startOver() {
        
        score = 0
        questionNumber = 0
        nextQuestion()
       
    }
    

    
}
