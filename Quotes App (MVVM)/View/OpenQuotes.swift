//
//  OpenQuotes.swift
//  Quotes App (MVVM)
//
//  Created by Marwan Mekhamer on 20/07/2025.
//

import UIKit

class OpenQuotes: UIViewController {
    
    @IBOutlet weak var AuthorLabel: UILabel!
    @IBOutlet weak var QuoteLabel: UILabel!
    @IBOutlet weak var ShareLabel: UIButton!
    
    var Model: OpenQuotesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AuthorLabel.text = Model.author
        QuoteLabel.text = Model.quote
    }
    
    @IBAction func ShareToBTN(_ sender: UIButton) {
        let activityVC = UIActivityViewController(activityItems: [Model.formattedQuote], applicationActivities: nil)
               activityVC.popoverPresentationController?.sourceView = sender
               present(activityVC, animated: true, completion: nil)
    }
    
}
