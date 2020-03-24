//
//  CHCardViewController.swift
//  DeckOfCards
//
//  Created by Colby Harris on 3/24/20.
//  Copyright © 2020 Colby_Harris. All rights reserved.
//

import UIKit

class CHCardViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var drawCardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawCardButton.layer.cornerRadius = drawCardButton.frame.height/2
        self.fetchCards()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        self.fetchCards()
    }
    
    
    func fetchCards() {
        CHCardController.drawNewCard(1) { (cards) in
            if let cards = cards {
                
                CHCardController.fetchCardImage(cards[0]) { (cardImage) in
                    DispatchQueue.main.async {
                        if let cardImage = cardImage {
                            self.updateViews(card: cards[0], image: cardImage)
                        }
                    }
                }
            }
        }
    }
    
    func updateViews(card: CHCard, image: UIImage) {
        self.cardImageView.image = image
        self.suitLabel.text = card.suit
        
        switch card.suit {
        case "DIAMONDS":
            self.drawCardButton.backgroundColor = .systemRed
            self.suitLabel.textColor = .systemRed
        case "HEARTS":
            self.drawCardButton.backgroundColor = .systemRed
            self.suitLabel.textColor = .systemRed
        case "SPADES":
            self.drawCardButton.backgroundColor = .black
            self.suitLabel.textColor = .black
        case "CLUBS":
            self.drawCardButton.backgroundColor = .black
            self.suitLabel.textColor = .black
        default:
            break
        }
    }
}
