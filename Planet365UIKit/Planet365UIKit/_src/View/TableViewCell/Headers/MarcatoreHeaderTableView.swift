//
//  MarcatoreHeaderTableView.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 22.10.21..
//

import UIKit

class MarcatoreHeaderTableView: UIView {
    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewBottom: UIView!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var imgArrow: UIImageView!
    @IBOutlet weak var imgDivider: UIImageView!
    
    var indexPath: IndexPath!
    var context: MarcatoreViewController!
    
    var isExpanded: Bool = false
    
    // Construct header view
    
    class func initMarcatoreHeaderViewWith(model: MoccupAPIModel, isExpanded: Bool, indexPath: IndexPath, context: MarcatoreViewController) -> UIView {
        
        // Init loader and load from NIB
        let marcatoreHeader = Bundle.main.loadNibNamed("MarcatoreHeaderTableView", owner: nil, options: nil)![0] as! MarcatoreHeaderTableView
        marcatoreHeader.frame = CGRect(x: 0.0, y: 0.0, width: Utils.getScreenSize().width, height: 60.0)
        
        // Add properties
        marcatoreHeader.indexPath = indexPath
        marcatoreHeader.context = context
        
        // Configure Header
        
        // Backgrounds
        marcatoreHeader.viewTop.backgroundColor = Color.backgroundGreyLight
        marcatoreHeader.viewBottom.backgroundColor = Color.backgroundGreyLight
        
        // Configure flag
        marcatoreHeader.imgFlag.image = UIImage(named: String(format: "ic-%@", model.league?.country ?? ""))
        
        // Configure title
        marcatoreHeader.lblTitle.text = model.league?.name ?? ""
        marcatoreHeader.lblTitle.textColor = Color.foregroundWhite
        
        // Configure count
        marcatoreHeader.lblCount.text = String(model.games?.count ?? 0)
        marcatoreHeader.lblCount.textColor = Color.foregroundWhite
        
        // Configure arrow
        let templateImage = UIImage(named: String(format: "ic-arrow-%@", isExpanded == true ? "up" : "down"))?.withRenderingMode(.alwaysTemplate)
        marcatoreHeader.imgArrow.image = templateImage
        marcatoreHeader.imgArrow.tintColor = Color.foregroundGrey
        
        // Configure divider
        marcatoreHeader.imgDivider.backgroundColor = Color.backgroundBlack
        
        // Get date from string
        let datetime = context.formatter.date(from: model.time ?? "16-11-2021 18:00:00") ?? Date()
        let dateString = context.formatterString.string(from: datetime).capitalized
        
        // Configure date
        marcatoreHeader.lblDate.text = String(format: "%@", dateString)
        marcatoreHeader.lblDate.textColor = Color.foregroundWhite
        
        // Get header
        return marcatoreHeader
    }
    
    // Button action

    @IBAction func expandCollapse(_ sender: UIButton) {
        context.handleAccordion(onIndexPath: self.indexPath)
    }
}
