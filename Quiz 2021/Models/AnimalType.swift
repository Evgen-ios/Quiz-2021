//
//  AnimalType.swift
//  Quiz 2021
//
//  Created by Evgeniy Goncharov on 18.05.2021.
//

enum AnimalType: Character {
    case dog = "🐶",
         cat = "😻",
         rabbit = "🐰",
         turtle = "🐢"
    
    var difinition: String {
        switch self {
        case .dog:
            return "Вы черезвычайно активно. Вы окружаете себя теми, кого любите и наслаждаетесь взаимодействием с друзьями."
        case .cat:
            return "Вы бесшабашный, но кроткий. Предпочитаете гулять сами по себе."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Вы умнее ваших лет, фокусируетесь на цели. Вы знаете, что медленные, но упорные и всегда выигрываете. "
        }
    }
}
