//
//  TableViewController.swift
//  Demo
//
//  Created by Tomas Hakel on 02/03/2016.
//  Copyright © 2016 Inloop. All rights reserved.
//

import UIKit
import INLThemes

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        INLThemeService.applyThemeTo(themeConsumer: cell)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        INLThemeService.registerThemeConsumer(themeConsumer: self)
    }

	deinit {
        INLThemeService.removeThemeConsumer(themeConsumer: self)
	}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}

}
