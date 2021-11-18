//
//  BJModel.swift
//  BJGame
//
//  Created by Jing Li on 2/4/19.
//  Copyright © 2019 Jing Li. All rights reserved.
//

import Foundation

enum Suit : Int {
    case club, spade, diamond, heart
    func simpeDescription() -> String{
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
    
    static let allValues = [club, spade, diamond, heart];
}

class Card {
    var suit : Suit = .club
    var digit = 1
    
    
    static func generateAPackOfCard() -> [Card] {
        var deckOfCard = [Card]();
        for s in Suit.allValues {
            for d in 1...13 {
                let c: Card = Card();
                c.suit = s;
                c.digit = d;
                deckOfCard.append(c);
            }
        }
        return deckOfCard;
    }
    
    static func generateMDecks(m: Int) -> [Card] {
        var deck = [Card]();
        for _ in 1...m {
            deck += generateAPackOfCard();
        }
        return deck;
    }
    
    static func shuffledCards(cards: inout [Card]) {
        cards.shuffle();
    }
    
    static func printDeck(cards: [Card]) {
        if (cards.isEmpty) {
            print("EMPTY DECK!!!");
        }
        else {
            for i in 0..<cards.count {
                print(cards[i].suit.simpeDescription() + "\t\t" + String(cards[i].digit));
            }
        }
    }
    
}
