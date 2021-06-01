//
//  QuestionViewController.swift
//  Quiz 2021
//
//  Created by Evgeniy Goncharov on 18.05.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var questioLable: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    
    @IBOutlet weak var multipleSatckView: UIStackView!
    
    @IBOutlet var multiLables: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLables: [UILabel]!
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    private var ansverChoosen = [Answer](){
        didSet{
            print(#line, #function, ansverChoosen)
        }
    }
    
    private var currentAnsvers: [Answer] {
        currntQestion.answers
    }
    
    private var currntQestion: Question {
        Question.all[questionIndex]
    }
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rangeSlider.maximumValue = 0.99999
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
        func updateSingleStack() {
            singleStackView.isHidden = false
            for (index,button) in singleButtons.enumerated() {
                button.setTitle(nil, for: [])
                button.tag = index
            }
            for (button, answer) in zip(singleButtons, currentAnsvers) {
                button.setTitle(answer.text, for: [])
            }
        }
        
        func updateMultipeStack() {
            multipleSatckView.isHidden = false
            for label in multiLables {
                label.text = nil
            }
            for (label, answer) in zip(multiLables, currentAnsvers) {
                label.text = answer.text
            }
        }
        func updateRangedStack() {
            rangedLables.first?.text = currentAnsvers.first?.text
            rangedLables.last?.text = currentAnsvers.last?.text
            rangedStackView.isHidden = false
            
        }
        
        for stackView in [singleStackView, multipleSatckView, rangedStackView]{
            stackView?.isHidden = true
        }
        
    
    
        let totalProgress = Float(questionIndex) / Float(Question.all.count)
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        questioLable.text = currntQestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        

        switch currntQestion.type {
        case .single :
            updateSingleStack()
        case .multiple:
            updateMultipeStack()
        case .range:
            updateRangedStack()

        }
        
    }
    
    func nextQestino()  {
        questionIndex += 1
        if questionIndex < Question.all.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results Seque", sender: nil)
        }
        
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = Question.all[questionIndex].answers
        let index = sender.tag
        guard 0 <= index && index < answers.count else {
            return
        }
        let answer = answers[index]
        ansverChoosen.append(answer)
        nextQestino()
    }
    
    @IBAction func multiButtonPressed (){
        for (index,multiSwich) in multiSwitches.enumerated() {
            if multiSwich.isOn && index < currentAnsvers.count {
                let answer = currentAnsvers[index]
                ansverChoosen.append(answer)
            }
        }
        nextQestino()
    }
    
    @IBAction func rangedButtonPressed(){
        print(#line, #function)
        let index = Int(round(rangeSlider.value * Float(currentAnsvers.count - 1)))
        if index < currentAnsvers.count {
            let answer = currentAnsvers[index]
            ansverChoosen.append(answer)
        }
        nextQestino()
    }
    
    @IBSegueAction func resultsSegue(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, ansverChoosen )
        
    }
}
