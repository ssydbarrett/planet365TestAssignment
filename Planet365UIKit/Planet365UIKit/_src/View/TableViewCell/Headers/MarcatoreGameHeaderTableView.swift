//
//  MarcatoreGameHeaderTableView.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 22.10.21..
//

import UIKit

class MarcatoreGameHeaderTableView: UIView {

    @IBOutlet weak var viewContent: UIView!

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var imgBar: UIImageView!
    @IBOutlet weak var imgArrowRight: UIImageView!
    @IBOutlet weak var imgArrow: UIImageView!
    
    var section: Int!
    var indexPath: IndexPath!
    var context: MarcatoreGameTableViewCell!
    
    var gameModel: GameModel!
    var marcatoreCount: Int!
    
    var isExpanded: Bool = false
    
    // Construct header view
    
    class func initMarcatoreGameHeaderViewWith(model: GameModel, marcatoreCount: Int, isExpanded: Bool, section: Int, indexPath: IndexPath, context: MarcatoreGameTableViewCell) -> UIView {
        
        // Init loader and load from NIB
        let marcatoreGameHeader = Bundle.main.loadNibNamed("MarcatoreGameHeaderTableView", owner: nil, options: nil)![0] as! MarcatoreGameHeaderTableView
        marcatoreGameHeader.frame = CGRect(x: 0.0, y: 0.0, width: Utils.getScreenSize().width, height: 44.0)
        
        // Add properties
        marcatoreGameHeader.section = section
        marcatoreGameHeader.indexPath = indexPath
        marcatoreGameHeader.context = context
        
        // Add models
        marcatoreGameHeader.gameModel = model
        marcatoreGameHeader.marcatoreCount = marcatoreCount
        
        // Configure Header
        
        // Backgrounds
        marcatoreGameHeader.viewContent.backgroundColor = Color.backgroundGreyDark
        
        // Configure bar image
        var templateImage = marcatoreGameHeader.imgBar.image?.withRenderingMode(.alwaysTemplate)
        marcatoreGameHeader.imgBar.image = templateImage
        marcatoreGameHeader.imgBar.tintColor = Color.foregroundGrey
        
        // Get date from string
        let datetime = context.context.formatter.date(from: model.time ?? "16-11-2021 18:00:00") ?? Date()
        let dateString = context.context.formatterStringTime.string(from: datetime).capitalized
        
        // Configure date
        marcatoreGameHeader.lblTime.text = String(format: "%@", dateString)
        marcatoreGameHeader.lblTime.textColor = Color.foregroundBlue
        
        // Configure title
        let title = String(format: "%@ - %@", model.home?.name ?? "", model.away?.name ?? "" )
        marcatoreGameHeader.lblTitle.text = title
        marcatoreGameHeader.lblTitle.textColor = Color.foregroundWhite
        
        // Configure arrow right
        templateImage = marcatoreGameHeader.imgArrowRight.image?.withRenderingMode(.alwaysTemplate)
        marcatoreGameHeader.imgArrowRight.image = templateImage
        marcatoreGameHeader.imgArrowRight.tintColor = Color.foregroundWhite
        
        // Configure count
        marcatoreGameHeader.lblCount.text = String(marcatoreGameHeader.marcatoreCount ?? 0)
        marcatoreGameHeader.lblCount.textColor = Color.foregroundYellow
        
        // Configure arrow
        templateImage = UIImage(named: String(format: "ic-arrow-%@", isExpanded == true ? "up" : "down"))?.withRenderingMode(.alwaysTemplate)
        marcatoreGameHeader.imgArrow.image = templateImage
        marcatoreGameHeader.imgArrow.tintColor = Color.foregroundGrey
        
        
        // Get header
        return marcatoreGameHeader
    }
    
    // Button action
    
    @IBAction func expandCollapse(_ sender: UIButton) {
        context.context.handleAccordionGames(section: self.section, onIndexPath: self.indexPath)
    }

    @IBAction func openGameSection(_ sender: UIButton) {
        
        // Push to game section
        context.context.pushToViewController(vc: "HomeGameViewController", storyboardName: "Home", params: nil)
    }
}
