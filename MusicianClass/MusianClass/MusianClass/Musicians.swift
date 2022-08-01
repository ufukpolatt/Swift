//
//  Musicians.swift
//  MusianClass
//
//  Created by Ufuk on 1.08.2022.
//

import Foundation

enum musicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violenist
}

class Musicians {
    //Property
    var name : String
    var age : Int
    var instruemnt : String
    var type : musicianType
    
    init (nameInit:String,ageInit:Int,instrumentInit:String,typeInit:musicianType){
        name = nameInit
        age = ageInit
        instruemnt = instrumentInit
        type = typeInit 
    }
    
    func sing(){
        print("Nothing Else Matters")
    }
}


