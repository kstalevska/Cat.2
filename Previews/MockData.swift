//
//  MockData.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

import Foundation

//Тестові об'єкти для Preview

extension Breed {
    static let mock1 = Breed(
        weight: Weight(imperial: "7 - 10", metric: "3 - 5"),
        id: "abys",
        name: "Abyssinian",
        cfaURL: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
        temperament: "активна, грайлива, соціальна",
        origin: "Єгипет",
        description: "Абіссінець простий у догляді, і його радість мати у вашому домі. Вони ласкаві коти і люблять як людей, так і інших тварин.",
        lifeSpan: "14 - 16",
        wikipediaURL: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
        referenceImageID: "0XYvRd7oD"
    )

    static let mock2 = Breed(
        weight: Weight(imperial: "8 - 12", metric: "4 - 6"),
        id: "beng",
        name: "Bengal",
        cfaURL: "https://cdn2.thecatapi.com/images/2cd.jpg",
        temperament: "енергійна, дика, красива",
        origin: "США",
        description: "Бенгальська кішка виглядає як міні-леопард, дуже активна й цікава.",
        lifeSpan: "12 - 15",
        wikipediaURL: "https://en.wikipedia.org/wiki/Bengal_cat",
        referenceImageID: "J2PmlIizw"
    )

    static let mock3 = Breed(
        weight: Weight(imperial: "6 - 9", metric: "2.7 - 4"),
        id: "siam",
        name: "Siamese",
        cfaURL: "",
        temperament: "гучна, розумна, ласкава",
        origin: "Таїланд",
        description: "Сіамська кішка відома своїм контрастним забарвленням та гучним голосом.",
        lifeSpan: "10 - 12",
        wikipediaURL: "https://en.wikipedia.org/wiki/Siamese_cat",
        referenceImageID: "ai6Jps4sx"
    )

    static let mock4 = Breed(
        weight: Weight(imperial: "9 - 13", metric: "4 - 6"),
        id: "maine",
        name: "Maine Coon",
        cfaURL: "",
        temperament: "доброзичлива, спокійна, велика, kfhdjfhdjfh",
        origin: "США",
        description: "Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.Одна з найбільших домашніх порід, з густою шерстю та м’яким характером.",
        lifeSpan: "12 - 15",
        wikipediaURL: "https://en.wikipedia.org/wiki/Maine_Coon",
        referenceImageID: "ud8G5Mtmn"
    )
}

// MARK: - Масив моків

extension [Breed] {
    static let mockList: [Breed] = [
        .mock1,
        .mock2,
        .mock3,
        .mock4
    ]
}
