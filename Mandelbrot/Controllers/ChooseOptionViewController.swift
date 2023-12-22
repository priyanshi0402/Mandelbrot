//
//  ChooseOptionViewController.swift
//  Mandelbrot
//
//  Created by Priyanshi Bhikadiya 2 on 22/12/23.
//

import UIKit

enum Options: String {
    case manual = "Manual Zooming Mandelbrot"
    case auto = "Auto Zooming Mandelbrot"
}

class ChooseOptionViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tblView: UITableView!
    
    // MARK: - Variables
    
    var optionsArray: [Options] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.optionsArray = [.manual, .auto]
        self.setUpTableView()
    }

}

// MARK: - Private methods

extension ChooseOptionViewController {
    
    private func setUpTableView() {
        tblView.register(UINib(nibName: "OptionsTableViewCell", bundle: nil), forCellReuseIdentifier: "OptionsTableViewCell")
        self.tblView.delegate = self
        self.tblView.dataSource = self
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ChooseOptionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.optionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionsTableViewCell", for: indexPath) as? OptionsTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        let row = self.optionsArray[indexPath.row]
        cell.titleLabel.text = row.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.optionsArray[indexPath.row]
        switch row {
        case .auto:
            let autoController = storyboard?.instantiateViewController(withIdentifier: "AutoZoomInViewController") as! AutoZoomInViewController
            self.navigationController?.pushViewController(autoController, animated: true)
        case .manual:
            let manualController = storyboard?.instantiateViewController(withIdentifier: "ManualZoomViewController") as! ManualZoomViewController
            self.navigationController?.pushViewController(manualController, animated: true)
        }
    }
    
}
