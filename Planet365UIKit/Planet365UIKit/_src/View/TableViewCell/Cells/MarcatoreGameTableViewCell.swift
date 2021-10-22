//
//  MarcatoreGameTableViewCell.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 22.10.21..
//

import UIKit

class MarcatoreGameTableViewCell: UITableViewCell {

    // MARK: - Outlets
    // MARK:
    
    @IBOutlet weak var tblTable: UITableView!
    
    // MARK: - Properties
    // MARK:
    
    var context: MarcatoreViewController!
    
    var apiModel: MoccupAPIModel!
    
    var indexPath: IndexPath!
    
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
    static func configureCell(_ tableView: UITableView, itemAtIndexPath indexPath: IndexPath, params: NSDictionary?, context: MarcatoreViewController) -> MarcatoreGameTableViewCell {
        
        // Create item
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarcatoreGameTableViewCell", for: indexPath) as! MarcatoreGameTableViewCell
        
        // Set context and index path
        cell.context = context
        cell.indexPath = indexPath
        
        // Set Model
        cell.apiModel = params?["model"] as? MoccupAPIModel ?? MoccupAPIModel()
        
        // Init table view and set delegate
        if cell.tblTable != nil {
            cell.tblTable.delegate = cell
            cell.tblTable.dataSource = cell
            
            // Regster table cell
            cell.registerCellsForTableView()
        }
        
        // Clear content inset
        cell.tblTable.contentInset = UIEdgeInsets(top: -34.0, left: 0, bottom: -60.0, right: 0)
        
        // Return cell
        return cell
    }
}

// MARK: - Register cells
// MARK:

extension MarcatoreGameTableViewCell {
    
    // Register vehicle cell
    func registerCellsForTableView() {
        let nibName = UINib(nibName: "MarcatoreGamePlayerTableViewCell", bundle:nil)
        self.tblTable.register(nibName, forCellReuseIdentifier: "MarcatoreGamePlayerTableViewCell")
    }
}

// MARK: - UITableViewDelegate
// MARK:

extension MarcatoreGameTableViewCell: UITableViewDelegate {
    
    // Estimated cell height
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Cell height for row at index path
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Height for header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    // Header view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return MarcatoreGameHeaderTableView.initMarcatoreGameHeaderViewWith(model: apiModel.games?[section] ?? GameModel(), marcatoreCount: apiModel.marcatoreArray?.count ?? 0, isExpanded: context.expandedGames[self.indexPath.section][section], section: self.indexPath.section, indexPath: IndexPath(row: 0, section: section), context: self)
    }
}

// MARK: - UITableViewDatasource
// MARK:

extension MarcatoreGameTableViewCell: UITableViewDataSource {
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.apiModel.games != nil && self.apiModel.games?.count ?? 0 > 0 {
            return self.apiModel.games?.count ?? 0
        } else {
            return 0
        }
    }
    
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.apiModel.marcatoreArray != nil && self.apiModel.marcatoreArray?.count ?? 0 > 0 {
            return self.apiModel.marcatoreArray?.count ?? 0
        } else {
            return 0
        }
    }
    
    // Cell For Row at IndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return MarcatoreGamePlayerTableViewCell.configureCell(tableView, itemAtIndexPath: indexPath, params: ["model": self.apiModel.marcatoreArray?[indexPath.row] ?? MarcatoreModel()], context: self.context)
    }
    
}


