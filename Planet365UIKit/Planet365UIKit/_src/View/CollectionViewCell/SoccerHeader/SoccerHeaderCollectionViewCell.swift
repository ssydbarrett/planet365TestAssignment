//
//  SoccerHeaderCollectionViewCell.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 21.10.21..
//

import UIKit

class SoccerHeaderCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    // MARK:
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblNuevo: UILabel!
    
    // MARK: - Properties
    // MARK:
    
    var params: Dictionary<String, Any>!
    
    var title: String!
    var isCellSelected: Bool!
    
    var context: BaseViewController!
    
    // MARK: - Configuration
    // MARK:
    
    // Drawing code
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
 
    // Configure cell
    static func configureItem(_ collectionView: UICollectionView, itemAtIndexPath indexPath: IndexPath, params: Dictionary<String, Any>, context: BaseViewController) -> SoccerHeaderCollectionViewCell {
        
        // Create item
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "SoccerHeaderCollectionViewCell", for: indexPath) as! SoccerHeaderCollectionViewCell
        
        // Set context & params
        
        item.context = context
        item.params = params
        
        item.title = params["title"] as? String ?? ""
        item.isCellSelected = params["selected"] as? Bool ?? false
        
        // Configure cell
        item.backgroundColor = .clear
        item.contentView.backgroundColor = .clear
        if item.isCellSelected == false {
            item.viewContent.backgroundColor = .clear
            item.lblTitle.textColor = Color.foregroundGrey
            item.viewContent.layer.borderColor = Color.foregroundGrey.cgColor
        } else {
            item.viewContent.backgroundColor = Color.backgroundYellowSelected
            item.lblTitle.textColor = Color.foregroundBlack
            item.viewContent.layer.borderColor = Color.backgroundYellowSelected.cgColor
        }
        item.lblTitle.text = item.title
        item.viewContent.layer.borderWidth = CGFloat(2.0)
        item.viewContent.layer.cornerRadius = CGFloat(8.0)
        item.viewContent.layer.masksToBounds = true
        
        // Show nuevo tag
        if indexPath.row == 0 {
            item.lblNuevo.isHidden = false
        } else {
            item.lblNuevo.isHidden = true
        }
        
        item.lblNuevo.roundCorners(topLeft: 0.0, topRight: 8.0, bottomLeft: 2.0, bottomRight: 0.0)
//        item.lblNuevo.layer.cornerRadius = CGFloat(2.0)
//        item.lblNuevo.layer.maskedCorners = [.layerMinXMaxYCorner]
//        item.lblNuevo.layer.masksToBounds = true
        
        // Return item
        return item
    }
}
