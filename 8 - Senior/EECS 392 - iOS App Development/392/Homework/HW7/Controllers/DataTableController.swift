//
//  DataTableController.swift
//  HW7
//
//  Created by Jacob Alspaw on 4/2/19.
//  Copyright © 2019 EECS 345 Group. All rights reserved.
//

import UIKit

class DataTableController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    private func setupView() {
        tableView.isUserInteractionEnabled = true
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPedigree" {
            guard let pedigreeViewController = segue.destination as? PedigreeViewController else { return }
            guard let pedigree = sender as? Pedigree else { return }
            pedigreeViewController.pedigree = pedigree
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.singleton.pedigrees.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PedigreeCell", for: indexPath) as! PedigreeCell
        let pedigree = Data.singleton.pedigrees[indexPath.item]
        cell.setupView(pedigree: pedigree)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toPedigree", sender: Data.singleton.pedigrees[indexPath.item])
    }
}

