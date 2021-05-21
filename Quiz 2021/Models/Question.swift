//
//  Question.swift
//  Quiz 2021
//
//  Created by Evgeniy Goncharov on 18.05.2021.
//

import Foundation

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
    
    static let all: [Question] = [
        Question(text: "Какую еду вы предпочитаете ?", type: .single, answers: [
            Answer(text: "Стейк", type: .dog),
            Answer(text: "Рыбу", type: .cat),
            Answer(text: "Морковку", type: .rabbit),
            Answer(text: "Кукурузу", type: .turtle),
        ]),
        Question(text: "Что вы любите делать? ", type: .multiply, answers: [
            Answer(text: "Плавать", type: .cat),
            Answer(text: "Спать", type: .dog),
            Answer(text: "Обниматься", type: .rabbit),
            Answer(text: "Есть", type: .turtle),
        ]),
        Question(text: "Люите ли вы поездки на машине ?", type: .range, answers: [
            Answer(text: "Ненавижу", type: .cat),
            Answer(text: "Нервничает", type: .rabbit),
            Answer(text: "Не замечает", type: .turtle),
            Answer(text: "Обожаю", type: .dog),
        ]),
    ]
}
