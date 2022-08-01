//
//  main.swift
//  MusianClass
//
//  Created by Ufuk on 1.08.2022.
//

import Foundation

let james = Musicians(nameInit: "James", ageInit: 50, instrumentInit: "Guitar", typeInit: .Vocalist)

print(james.name,james.age,james.instruemnt,james.type)
james.sing()

let kirk = superMusician (nameInit: "Kirk", ageInit: 55, instrumentInit: "Gitar", typeInit: .LeadGuitar)
print(kirk.name,kirk.age,kirk.instruemnt,kirk.type)

kirk.sing()
//kirk.sing2()
