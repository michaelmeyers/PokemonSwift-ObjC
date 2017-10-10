//
//  PokemonViewController.swift
//  PokemonHybrid
//
//  Created by Michael Meyers on 10/10/17.
//  Copyright © 2017 Michael Meyers. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    
    var pokemon: Pokemon? {
        didSet {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updateViews(){
        guard let pokemon = pokemon else {return}
        self.nameLabel.text = pokemon.name
        self.idLabel.text = "\(pokemon.identifier)"
        self.abilityLabel.text = "\(pokemon.abilities.joined(separator: ","))"
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}
        PokemonController.sharedInstance().fetchPokemon(forSearchTerm: searchTerm) { (pokemon) in
            self.pokemon = pokemon
        }
    }
    
    
}
