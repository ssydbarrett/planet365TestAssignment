//
//  MarcatoreGamePlayerTableViewCell.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 22.10.21..
//

import UIKit

class MarcatoreGamePlayerTableViewCell: UITableViewCell {

    // MARK: - Outlets
    // MARK:
    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewBottom: UIView!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgArrow: UIImageView!
    
    @IBOutlet weak var viewStack: UIStackView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lblMarc1: UILabel!
    @IBOutlet weak var lblKvota1: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var lblMarcX: UILabel!
    @IBOutlet weak var lblKvotaX: UILabel!
    @IBOutlet weak var btnX: UIButton!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var lblMarc2: UILabel!
    @IBOutlet weak var lblKvota2: UILabel!
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet var viewsMarc: [UIView]!
    @IBOutlet var lblsMarc: [UILabel]!
    @IBOutlet var lblsKvota: [UILabel]!
    @IBOutlet var btnsKvota: [UIButton]!
    
    // MARK: - Properties
    // MARK:
    
    var context: MarcatoreViewController!
    
    var indexPath: IndexPath!
    var tableView: UITableView!
    
    var model: MarcatoreModel!
    
    // MARK: - Configuration
    // MARK:
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
        // Configure cell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Configure cell
    static func configureCell(_ tableView: UITableView, itemAtIndexPath indexPath: IndexPath, params: NSDictionary?, context: MarcatoreViewController) -> MarcatoreGamePlayerTableViewCell {
        
        // Create item
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarcatoreGamePlayerTableViewCell", for: indexPath) as! MarcatoreGamePlayerTableViewCell
        
        // Set context and index path
        cell.context = context
        cell.indexPath = indexPath
        cell.tableView = tableView
        
        // Set model
        cell.model = params?["model"] as? MarcatoreModel ?? MarcatoreModel()
        
        // Configure cell
        cell.configureCell()
        
        // Set values to cell outlets
        cell.setValues()
        
        // Return cell
        return cell
    }
    
    func configureCell() {
        
        // Configure title
        lblTitle.textColor = Color.foregroundWhite
        
        // COnfigure arrow
        let templateImage = imgArrow.image?.withRenderingMode(.alwaysTemplate)
        imgArrow.image = templateImage
        imgArrow.tintColor = Color.foregroundGrey
        
        // Configure views
        for view in viewsMarc {
            view.backgroundColor = Color.backgroundGreyDark
            view.layer.cornerRadius = 4.0
            view.layer.masksToBounds = true
        }
        
        // Configure labels
        for lbl in lblsMarc {
            lbl.textColor = Color.foregroundWhite
        }
        for lbl in lblsKvota {
            lbl.textColor = Color.foregroundWhite
        }
    }
    
    func setValues() {
        
        // Player name
        let playerName = String(format: "%@ (%@)", model.player?.name ?? "", model.player?.club?.name ?? "")
        lblTitle.text = playerName
        
        // 1 - hide if 0.0
        let kvota1 = model._1 ?? 0.0
        if kvota1 <= 0.0 {
            view1.isHidden = true // view1.removeFromSuperview()
        } else {
            view1.isHidden = false
            lblKvota1.text = String(format: "%0.2f", kvota1)
        }
        
        // x - hide if 0.0
        let kvotaX = model._x ?? 0.0
        if kvotaX <= 0.0 {
            viewX.isHidden = true // viewX.removeFromSuperview()
        } else {
            viewX.isHidden = false
            lblKvotaX.text = String(format: "%0.2f", kvotaX)
        }
        
        // 2 - hide if 0.0
        let kvota2 = model._2 ?? 0.0
        if kvota2 <= 0.0 {
            view2.isHidden = true // removeFromSuperview()
        } else {
            view2.isHidden = false
            lblKvota2.text = String(format: "%0.2f", kvota2)
        }
        
        // Select cell if selected
        if context.selectedGameOnIndexPath.0 == self.indexPath {
            switch context.selectedGameOnIndexPath.1 {
            case 0:
                view1.backgroundColor = Color.backgroundYellowSelected
                lblMarc1.textColor = Color.foregroundBlack
                lblKvota1.textColor = Color.foregroundBlack
            case 1:
                viewX.backgroundColor = Color.backgroundYellowSelected
                lblMarcX.textColor = Color.foregroundBlack
                lblKvotaX.textColor = Color.foregroundBlack
            case 2:
                view2.backgroundColor = Color.backgroundYellowSelected
                lblMarc2.textColor = Color.foregroundBlack
                lblKvota2.textColor = Color.foregroundBlack
            default:
                break
            }
        }
    }

    // MARK: - Button actions
    // MARK:

    @IBAction func openGameSection(_ sender: UIButton) {
        
        // Push to game section
        context.pushToViewController(vc: "HomePlayerViewController", storyboardName: "Home", params: nil)
    }
    
    @IBAction func selectKvota(_ sender: UIButton) {
        
        // Deselect if already selected
        if context.selectedGameOnIndexPath.0 == self.indexPath && context.selectedGameOnIndexPath.1 == sender.tag {
            context.selectedGameOnIndexPath = (IndexPath(row: -1, section: -1), -1)
        } else {
            context.selectedGameOnIndexPath = (self.indexPath, sender.tag)
        }
        
        // Reload data to apply changes
        tableView.reloadData()
    }
}
