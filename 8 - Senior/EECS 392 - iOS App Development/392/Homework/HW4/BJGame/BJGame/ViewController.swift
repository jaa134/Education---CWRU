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
    @IBOutlet weak var numDecksInput: UITextField!
    @IBOutlet weak var thresholdInput: UITextField!
    @IBOutlet weak var numDecksLabel: UILabel!
    @IBOutlet weak var thresholdLabel: UILabel!
    
    private var gameModel: BJGameModel
    
    required init?(coder aDecoder: NSCoder) {
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
        restartButton.setTitle("Begin", for: .normal)
    }

    func restartGame(numDecks: Int, threshold: Int) {
        restartButton.setTitle("Restart", for: .normal)
        gameModel.resetGame(numDecks: numDecks, threshold: threshold)
        nextGame()
    }
    
    func nextGame(){
        gameModel.nextGame()
        
        var card = gameModel.nextDealerCard()
        card = gameModel.nextDealerCard()
        card.isFaceUp = false
        
        card = gameModel.nextPlayerCard()
        card = gameModel.nextPlayerCard()
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
        let numDecks: Int? = Int(numDecksInput.text!);
        let threshold: Int? = Int(thresholdInput.text!);
        
        let isNumDecksValid = numDecks != nil && numDecks! >= gameModel.minNumDecks;
        let isThresholdValid = threshold != nil && threshold! >= gameModel.minThreshold;
        numDecksLabel.textColor = isNumDecksValid ? UIColor.black : UIColor.red
        thresholdLabel.textColor = isThresholdValid ? UIColor.black : UIColor.red
        if (!isNumDecksValid || !isThresholdValid) {
            return
        }
        
        restartGame(numDecks: numDecks!, threshold: threshold!)
    }
    
    func showDealersFaceDownCard() {
        gameModel.dealerCardAtIndex(i: 1)?.isFaceUp = true;
        renderCards();
    }
    
    func renderCards() {
        for i in 0 ..< gameModel.maxPlayerCards{
            if let dealerCard = gameModel.dealerCardAtIndex(i: i){
                dealerCardView[i].image = dealerCard.getCardImage()
                dealerCardView[i].isHidden = false
            }else{
                dealerCardView[i].isHidden = true
            }
            if let playerCard = gameModel.playerCardAtIndex(i: i){
                playerCardView[i].image = playerCard.getCardImage()
                playerCardView[i].isHidden = false
            }else{
                playerCardView[i].isHidden = true
            }
        }
    }
    
}

