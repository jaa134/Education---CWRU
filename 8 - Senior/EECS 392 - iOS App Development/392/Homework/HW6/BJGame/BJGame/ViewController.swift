//
//  ViewController.swift
//  BJGame
//
//  Created by Jing Li on 2/4/19.
//  Copyright © 2019 Jing Li. All rights reserved.
//

import UIKit

class BJViewController: UIViewController {

    @IBOutlet var dealerCardView: [UIImageView]!
    @IBOutlet var playerCardView: [UIImageView]!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var nextGameButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var remainingCardsLabel: UILabel!
    @IBOutlet weak var standButton: UIButton!
    
    public var settings: Settings
    private var gameModel: BJGameModel
    
    required init?(coder aDecoder: NSCoder) {
        settings = Settings()
        settings.numDecks = 2
        settings.threshold = 10
        gameModel = BJGameModel()
        super.init(coder: aDecoder)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    func setup() {
        hitButton.isEnabled = false;
        standButton.isEnabled = false;
        nextGameButton.isEnabled = false;
        resetWinnerLabel()
        resetRemainingCardsLabel()
        restartGame()
    }

    func restartGame() {
        gameModel.resetGame(numDecks: settings.numDecks, threshold: settings.threshold)
        nextGame()
    }
    
    func nextGame(){
        gameModel.nextGame()
        
        var card = gameModel.nextDealerCard()
        card.isFaceUp = false;
        dealerCardView[0].image = card.getCardImage()
        card = gameModel.nextDealerCard()
        flip(cardView: dealerCardView[1], card: card)
        
        card = gameModel.nextPlayerCard()
        flip(cardView: playerCardView[0], card: card)
        card = gameModel.nextPlayerCard()
        flip(cardView: playerCardView[1], card: card)
        renderCards()
        
        setRemainingCardsLabel()
        resetWinnerLabel()
        
        if (gameModel.doesPlayerHaveBlackJack()) {
            hitButton.isEnabled = false
            standButton.isEnabled = false
            nextGameButton.isEnabled = gameModel.allowNextGame();
            restartButton.isEnabled = true;
            setPlayerWonLabel()
        }
        else {
            hitButton.isEnabled = true
            standButton.isEnabled = true
            nextGameButton.isEnabled = false;
            restartButton.isEnabled = true;
        }
    }

    
    @IBAction func userClickHit(_ sender: UIButton) {
        gameModel.nextPlayerCard()
        renderCards()
        hitButton.isEnabled = gameModel.numPlayerCards() < gameModel.maxPlayerCards;
        setRemainingCardsLabel();
        
        if (gameModel.didDealerWin) {
            showDealersFaceDownCard()
            setDealerWonLabel()
            hitButton.isEnabled = false;
            standButton.isEnabled = false;
            nextGameButton.isEnabled = gameModel.allowNextGame();
        }
    }
    
    @IBAction func userClickStand(_ sender: UIButton) {
        //switch to dealer
        hitButton.isEnabled = false;
        standButton.isEnabled = false;
        gameModel.gameStage = .dealerStage
        playDealerTurn()
        
    }
    
    func playDealerTurn() {
        nextGameButton.isEnabled = gameModel.allowNextGame();
        
        showDealersFaceDownCard()
        gameModel.calcualteWinner();
        if (gameModel.didDealerWin) {
            setDealerWonLabel()
            return
        }
        
        for _ in 1...(gameModel.maxPlayerCards-2) {
            gameModel.nextDealerCard()
            renderCards()
            setRemainingCardsLabel()
            gameModel.calcualteWinner()
            if (gameModel.didDealerWin) {
                setDealerWonLabel()
                return
            }
            if (gameModel.didDealerBust()) {
                break
            }
        }
        
        setPlayerWonLabel()
    }
    
    func resetRemainingCardsLabel() {
        remainingCardsLabel.text = ""
    }
    
    func setRemainingCardsLabel() {
        remainingCardsLabel.text = String(gameModel.numCards()) + " cards remaining..."
        if (!gameModel.allowNextGame()) {
            remainingCardsLabel.text = remainingCardsLabel.text! + " Below threshold..."
        }
    }
    
    func resetWinnerLabel() {
        winnerLabel.text = ""
    }
    
    func setPlayerWonLabel() {
        winnerLabel.text = "Player won the game!"
    }
    
    func setDealerWonLabel() {
        winnerLabel.text = "Dealer won the game!"
    }
    
    @IBAction func userClickedNextGame(_ sender: Any) {
        nextGame()
    }
    
    @IBAction func userClickedRestart(_ sender: Any) {
        restartGame()
    }
    
    func showDealersFaceDownCard() {
        flip(cardView: dealerCardView[0], card: gameModel.dealerCardAtIndex(i: 0)!)
        //gameModel.dealerCardAtIndex(i: 1)?.isFaceUp = true;
        //renderCards();
    }
    
    func renderCards() {
        for i in 0 ..< gameModel.maxPlayerCards{
            if let dealerCard = gameModel.dealerCardAtIndex(i: i){
                if (dealerCardView[i].isHidden) {
                    flip(cardView: dealerCardView[i], card: dealerCard)
                }
            }else{
                dealerCardView[i].isHidden = true
            }
            if let playerCard = gameModel.playerCardAtIndex(i: i){
                if (playerCardView[i].isHidden) {
                    flip(cardView: playerCardView[i], card: playerCard)
                }
            }else{
                playerCardView[i].isHidden = true
            }
        }
    }
    
    func flip(cardView: UIImageView, card: Card) {
        cardView.isHidden = false;
        card.isFaceUp = false;
        let backImage: UIImage? = card.getCardImage()
        cardView.image = backImage;
        card.isFaceUp = true;
        let faceImage: UIImage? = card.getCardImage()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(250), execute: { () -> Void in
            UIView.transition(with: cardView,
                              duration: 0.5,
                              options:  .transitionFlipFromRight,
                              animations: { cardView.image = faceImage },
                              completion: nil)
        })
    }
    
    @IBAction func SettingsTapped(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsController = segue.destination as? SettingsController {
            settingsController.settings = settings
        }
    }
    
}

