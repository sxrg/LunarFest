//
//  questionBank.swift
//  app
//
//  Created by Sherry Guo on 2019-12-20.
//

import Foundation

class QuestionBank {
    
    var list = [Question]()

    init() {
        list.append(Question(image: "rat_placeholder", questionText: "Which animal is not used as a zodiac animal for Lunar New Year?",
        choiceA: "Rat", choiceB: "Rabbit", choiceC: "Dragon", choiceD: "Lion", answer: 4))
        
        list.append(Question(image: "rat_placeholder", questionText: "Which day is the Lunar New Year day in 2020?",
        choiceA: "January 25th", choiceB: "January 24th", choiceC: "January 27th", choiceD: "January 1st", answer: 1))
        
        list.append(Question(image: "rat_placeholder", questionText: "How many years are in one cycle of the Lunar New Year?",
        choiceA: "10", choiceB: "50", choiceC: "12", choiceD: "100", answer: 3))
        
        list.append(Question(image: "rat_placeholder", questionText: "What determines the start of the Lunar New Year?",
        choiceA: "First new moon of the year", choiceB: "First day of the Gregorian calendar",
        choiceC: "20 days from the New Year", choiceD: "It's determined randomly", answer: 1))
        
        //
        
        list.append(Question(image: "rat_placeholder", questionText: "What was the zodiac animal sign for most of 2019?",
        choiceA: "Rat", choiceB: "Dog", choiceC: "Pig", choiceD: "Monkey", answer: 3))
        
        list.append(Question(image: "rat_placeholder", questionText: " What is the zodiac animal sign for most of 2020?",
        choiceA: "Dog", choiceB: "Pig", choiceC: "Monkey", choiceD: "Rat", answer: 4))
        
        list.append(Question(image: "rat_placeholder", questionText: "When is Lunar New Year in 2019?",
        choiceA: "February 6th", choiceB: "January 1st", choiceC: "January 25th", choiceD: "February 5th", answer: 4))
        
        list.append(Question(image: "telus", questionText: "Which company does this logo belong to?",
        choiceA: "Telus", choiceB: "Rogers", choiceC: "Bell", choiceD: "Virgin", answer: 1))
        
        //
        
        list.append(Question(image: "rat_placeholder", questionText: "How many zodiac animals do the Lunar New Year use?",
        choiceA: "12", choiceB: "11", choiceC: "6", choiceD: "3", answer: 1))
        
        list.append(Question(image: "rat_placeholder", questionText: " What is Lunar New Year called in Korea?",
        choiceA: "Tết", choiceB: "Seollal", choiceC: "Tsagaan Sar", choiceD: "Spring Festival", answer: 2))
        
        list.append(Question(image: "rat_placeholder", questionText: " What is Lunar New Year called in Vietnam?",
        choiceA: "Tết", choiceB: "Seollal", choiceC: "Tsagaan Sar", choiceD: "Spring Festival", answer: 1))
        
        list.append(Question(image: "rat_placeholder", questionText: " What is Lunar New Year called in Japan?",
        choiceA: "Tết", choiceB: "Seollal", choiceC: "Tsagaan Sar", choiceD: "Oshogatsu", answer: 4))
        
        //
        
        list.append(Question(image: "rat_placeholder", questionText: "What is Lunar New Year called in Mongolia?",
        choiceA: "Tết", choiceB: "Seollal", choiceC: "Tsagaan Sar", choiceD: "Spring Festival", answer: 3))
        
        list.append(Question(image: "rat_placeholder", questionText: "Which calendar does the Lunar New Year follow?",
        choiceA: "Lunar Calendar", choiceB: "Pagan Calendar", choiceC: "Gregorian Calendar", choiceD: "Mayan Calendar", answer: 1))
        
        list.append(Question(image: "rat_placeholder", questionText: " How many months are in the Lunar Calendar?",
        choiceA: "10", choiceB: "11", choiceC: "12 or 13", choiceD: "6", answer: 3))
        
        list.append(Question(image: "rat_placeholder", questionText: "Which day of the Lunar Calendar is Lunar New Year Celebrated?",
        choiceA: "Last day of the year", choiceB: "First day of the year", choiceC: "Second day of the year", choiceD: "15th day of the year", answer: 2))
        
        //
        
        list.append(Question(image: "rat_placeholder", questionText: "What is the one event you should attend to celebrate Lunar New Year in Vancouver?",
        choiceA: "LunarFest", choiceB: "I'm not sure", choiceC: "I don't know", choiceD: "Stay home", answer: 3))
        
        list.append(Question(image: "rat_placeholder", questionText: "What clothing is worn in Korean culture during the Lunar New Year?",
        choiceA: "Áo dài", choiceB: "Hanfu", choiceC: "Kimono", choiceD: "Hanbok", answer: 4))
        
        list.append(Question(image: "rat_placeholder", questionText: "Which western holiday did Lunar New Year land on in the year 2010?",
        choiceA: "Valentine's Day", choiceB: "New Years Day", choiceC: "Christmas Day", choiceD: "Family Day", answer: 1))
        
        list.append(Question(image: "rat_placeholder", questionText: " What are the dates of the Lunar New Year celebration at Vancouver Art Gallery Plaza?",
        choiceA: "January 18th ~ January 19th", choiceB: "January 25th ~ January 26th", choiceC: "January 16th ~ February 10th", choiceD: "February 17th ~ February 18th", answer: 2))
    }
    
}
