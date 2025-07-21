//
//  ViewController.swift
//  Quotes App (MVVM)
//
//  Created by Marwan Mekhamer on 20/07/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = QuotesViewModel()
    private let PassV = PassingViews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        update()
        viewModel.fetch()
    }
    
    func update() {
        viewModel.didupdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }


}


// Mark: - UITableView Functions

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.NumberOfQuotes
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let quote = viewModel.quote(at: indexPath.row)
        cell.textLabel?.text = quote.quote
        cell.detailTextLabel?.text = quote.author
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let quote = viewModel.quote(at: indexPath.row)
        let details = OpenQuotesViewModel(author: quote.author, quote: quote.quote)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "open") as? OpenQuotes {
            vc.modalPresentationStyle = .fullScreen
            vc.Model = details
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
