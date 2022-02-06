//
//  Storyboarded.swift
//  Cryptocurrency
//
//  Created by Archana Vetkar on 06/02/22.
//

import UIKit

//This is extension for removing reduancy of code
//This extension will instantiate View Controller


protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {

        let fullName = NSStringFromClass(self)

        let className = fullName.components(separatedBy: ".")[1]

        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
