//
//  ViewController.swift
//  IOSProject
//
//  Created by Lucas on 25/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

struct liste {
    static var listeFilms: [Film] = []
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
        
    @IBOutlet weak var Search: UIButton!
    @IBOutlet weak var Test: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "A la recherche d'un film ?"
    }
    
    @IBAction func submitSearch(_ sender: UIButton) {
        
        liste.listeFilms = []
        
        let search = textField.text?.replacingOccurrences(of: " ", with: "%20")
        
        let url = "https://api.themoviedb.org/3/search/movie?api_key=efd2f34019a0d9de842117a55466ec9c&language=FR&query=\(search ?? "")"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                    if let data = json as? Dictionary<String, AnyObject> {
                        if let item = data["results"] as? [Dictionary<String, AnyObject>] {
                            for (index, _) in item.enumerated() {
                                let film = Film(titre: item[index]["title"] as! String, dateSortie: item[index]["release_date"] as! String, id: item[index]["id"] as! Int)
                                liste.listeFilms.append(film)
                            }
                        }
                    }
                }
            }
        }.resume()
    }
    
    @IBAction func submitTest(_ sender: UIButton) {
        for value in liste.listeFilms {
            print(value.titre)
            print(value.description)
        }
    }
}

