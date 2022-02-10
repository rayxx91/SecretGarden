//
//  TableViewCell.swift
//  ShareGarden
//
//  Created by chaleroux on 08/02/2022.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageGardenHeightConstraint: NSLayoutConstraint!
    
    let tableViewHeight: CGFloat = UIScreen.main.bounds.height
    
    //static est utilise pour definir une propriete d'une classe et non a la propriete d'une instance de classe
    static let ratio: CGFloat = 0.11
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let adaptedHeigh: CGFloat = tableViewHeight * TableViewCell.ratio
        
        imageGardenHeightConstraint.constant = adaptedHeigh
    }
}




