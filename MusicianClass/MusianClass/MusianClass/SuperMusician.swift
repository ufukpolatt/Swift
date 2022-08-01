//
//  SuperMusician.swift
//  MusianClass
//
//  Created by Ufuk on 1.08.2022.
//

import Foundation

class superMusician : Musicians {
    
    func sing2(){
        print("Enter Night")
    }
    
    override func sing() {
        super.sing()
        print("Exit Light")
    }
    
}
