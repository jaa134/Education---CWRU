//
//  PedigreeViewController.swift
//  HW7
//
//  Created by Jacob Alspaw on 4/3/19.
//  Copyright © 2019 EECS 345 Group. All rights reserved.
//

import Foundation
import UIKit

class PedigreeViewController: UITableViewController {
    
    public var pedigree: Pedigree!
    
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
    
    @IBAction func addIndividual(_ sender: Any) {
        let id = pedigree.individuals.count == 0 ? 0 : pedigree.individuals.max(by: { i1, i2 in i1.id < i2.id })!.id + 1
        let individual = Individual(id: id)
        performSegue(withIdentifier: "toIndividual", sender: individual)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toIndividual" {
            guard let individualViewController = segue.destination as? IndividualViewController else { return }
            guard let individual = sender as? Individual else { return }
            individualViewController.individual = individual
            individualViewController.pedigree = pedigree
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MemberCell.height
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pedigree == nil ? 0 : pedigree.individuals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pedigree = pedigree else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberCell
        let individual = pedigree.individuals[indexPath.item]
        cell.setupView(individual: individual)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toIndividual", sender: pedigree.individuals[indexPath.item])
    }
}

