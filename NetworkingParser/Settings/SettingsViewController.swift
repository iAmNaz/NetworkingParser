//
//  SettingsViewController.swift
//  NetworkingParser
//
//  Created by Nazario Mariano on 8/10/21.
//

import UIKit

struct UserDefaultKey {
    static let scrollDirection = "scrollDirection"
}

struct FieldModel {
    var cellIdentifier: String
    var value: Any?
    var cellClass: UITableViewCell.Type
}

class SettingsViewController: UIViewController {
    
    private var settingsCellIdentifier = "SettingsCellIdentifier"
    
    private var sectionTitles = ["TableView", "CollectionView"]
    
    private var collectionViewSettings = [FieldModel]()
    private var tableViewSettings = [FieldModel]()
    private var settings: [[FieldModel]]!
    
    fileprivate func setupTableViewData() {
        tableViewSettings.append(FieldModel(cellIdentifier: "BasicTableViewCell", value: nil, cellClass: BasicTableViewCell.self))
        tableViewSettings.append(FieldModel(cellIdentifier: "DisclosureTableViewCell", value: nil, cellClass: DisclosureTableViewCell.self))
    }
    
    fileprivate func setupCollectionViewData() {
        let scrollDirection = UserDefaultsHelper.scrollDirection
        
        // Setting the collectionview settings
        let scrollDirectionField = FieldModel(cellIdentifier: "SegmentedTableViewCell", value: scrollDirection, cellClass: SegmentedTableViewCell.self)
        collectionViewSettings.append(scrollDirectionField)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings"
        setupCollectionViewData()
        setupTableViewData()

        settings = [tableViewSettings, collectionViewSettings]
        
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fields = settings[indexPath.section]
        let fieldModel = fields[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: fieldModel.cellIdentifier, for: indexPath)
        
        if cell is SegmentedTableViewCell {
            let segmentCell = cell as! SegmentedTableViewCell
            segmentCell.model = fieldModel
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}

extension SettingsViewController: UITableViewDelegate {
    
}
