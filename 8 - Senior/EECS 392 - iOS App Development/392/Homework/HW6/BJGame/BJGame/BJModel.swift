//
//  BJModel.swift
//  BJGame
//
//  Created by Jing Li on 2/4/19.
//  Copyright © 2019 Jing Li. All rights reserved.
//

import Foundation
import UIKit

struct Settings {
    public let minNumDecks: Int = 1;
    public let minThreshold: Int = 10;
    var numDecks: Int
    var threshold: Int
    
    init(numDecks: Int? = 2, threshold: Int? = 10) {
        self.numDecks = numDecks!
        self.threshold = threshold!
    }
}

enum Suit : Int {
    case club = 0, spade, diamond, heart
    func simpleDescription() -> String{
        switch self {
        case .club:
            return "club"
        case .spade:
            return "spade"
        case .diamond:
            return "diamond"
        case .heart:
            return "heart"
            
        }
    }
    
}

class Card{
    var suit : Suit = .club
    var digit = 1
    var isFaceUp = true
    
    init(suit: Suit, digit: Int){
        self.suit = suit
        self.digit = digit
    }

    static func generateAPackOfCard() -> [Card]{
        var deckOfCard = [Card]()
        for i in 0..<4{
            for j in 1...13{
                deckOfCard.append(Card(suit: Suit(rawValue: i)!, digit: j))
                /*let tmp = Card()
                tmp.digit = j
                tmp.suit = Suit(rawValue: i)!
                deckOfCard.append(tmp)*/
            }
        }
        return deckOfCard
    }
    
    static func generateMDecks(m: Int) -> [Card]{
        var decks = [Card]()
        for _ in 1...m {
            decks += generateAPackOfCard()
        }
        return decks
    }
    
    func getCardImage() -> UIImage? {
        if isFaceUp{
            return UIImage(named: "\(suit.simpleDescription())-\(digit).png")
        }else{
            return UIImage(named: "card-back.png")
        }
    }
    
    func isAce() -> Bool {
        return digit == 1 ? true : false
    }
    func isAFaceOrTen() -> Bool {
        return digit > 9 ? true : false
    }


    
}

enum BJGameStage: Int{
    case playerStage = 0
    case dealerStage, gameOverStage
}

class BJGameModel{
    private var threshold: Int = 10;
    private var cards = [Card]()
    private var playerCards = [Card]()
    private var dealerCards = [Card]()
    var gameStage : BJGameStage = .playerStage
    
    let maxPlayerCards = 5
    var didDealerWin = false
    
    init(){
        //resetGame()
    }
    
    func resetGame(numDecks: Int, threshold: Int) {
        cards = Card.generateMDecks(m: numDecks)
        self.threshold = threshold
    }
    
    func nextGame(){
        didDealerWin = false;
        cards.shuffle()
        playerCards = [Card]()
        dealerCards = [Card]()
        gameStage = .playerStage
    }
    
    func allowNextGame() -> Bool{
        return numCards() > threshold
    }
    
    func numCards() -> Int{
        return cards.count
    }
    func numPlayerCards() -> Int{
        return playerCards.count
    }
    func numDealerCards() -> Int{
        return dealerCards.count
    }
    
    func nextDealerCard() -> Card{
        let card = cards.removeFirst()
        dealerCards.append(card)
        return card
    }
    func nextPlayerCard() -> Card{
        let card = cards.removeFirst()
        playerCards.append(card)
        
        if (areCardsBust(playerCards)) {
            didDealerWin = true;
        }
        
        return card
    }
    
    func dealerCardAtIndex(i: Int) ->Card?{
        if i < dealerCards.count{
            return dealerCards[i]
        }else{
            return nil
        }
    }
    func playerCardAtIndex(i: Int) ->Card?{
        if (i < playerCards.count) {
            return playerCards[i]
        }else{
            return nil
        }
    }

    func areCardsBust(_ curCards: [Card]) -> Bool{
        var lowestScore = 0
        for card in curCards{
            if card.isAce(){
                lowestScore += 1
            }else if card.isAFaceOrTen(){
                lowestScore += 10
            }else {
                lowestScore += card.digit
            }
        }
        return lowestScore > 21 ? true : false
    }
    
    func doesPlayerHaveBlackJack() -> Bool{
        return calculateBestScore(playerCards) == 21
    }
    
    func didDealerBust() -> Bool {
        return areCardsBust(dealerCards)
    }
    
    func calculateBestScore(_ curCards: [Card]) -> Int {
        if areCardsBust(curCards) {
            return 0
        }
        var higestScore = 0
        for card in curCards{
            if card.isAce(){
                higestScore += 11
            }else if card.isAFaceOrTen(){
                higestScore += 10
            }else {
                higestScore += card.digit
            }
        }
        while higestScore > 21 {
            higestScore -= 10
        }
        return higestScore
    }
    
    func calcualteWinner(){
        let dealerScore = calculateBestScore(dealerCards)
        let playerScore = calculateBestScore(playerCards)
        didDealerWin = dealerScore >= playerScore
    }

    
}

