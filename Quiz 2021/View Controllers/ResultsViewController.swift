//
//  ResultsViewController.swift
//  Quiz 2021
//
//  Created by Evgeniy Goncharov on 18.05.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var animulLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let answers: [Answer]
    
    init?(coder: NSCoder, _ answers: [Answer]) {
        self.answers = answers
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(#line) \(#function )init(coder:) has not been implemented")
    }
    
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = answers.reduce(into: [:]) { counts, answer in
            counts[answer.type, default: 0] += 1
        }
        // Sorted answers

        let mostCommonAnswer = frequencyOfAnswers.sorted {$0.value > $1.value}.first!.key
        updateUI(with: mostCommonAnswer)
        
        //print(#line, #function, mostCommonAnswer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(with animal: AnimalType) {
        animulLabel.text = "Вы - это \(animal.rawValue) !"
        descriptionLabel.text = animal.difinition
    }

}
