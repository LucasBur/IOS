//
//  classFilm.swift
//  IOSProject
//
//  Created by Lucas on 26/03/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

class Film {
    var titre: String = ""
    var dateSortie: String = ""
    var id: Int = 0
    var description: String = ""

    init(titre: String, dateSortie: String, id: Int) {
        self.titre = titre
        self.dateSortie = dateSortie
        self.id = id
    }
    
    func setDescription (description: String) {
        self.description = description
    }
}
