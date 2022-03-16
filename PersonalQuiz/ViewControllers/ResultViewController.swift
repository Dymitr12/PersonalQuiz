//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соответствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResults()
        
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResults() {
        var frequencyOfAnswers: [Animal: Int] = [:]
        let responseTypes = responses.map{ $0.animal }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = {frequencyOfAnswers[response] ?? 0}() + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
                                                                {(pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
          resultAnswerLabel.text = "Вы - \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
}
