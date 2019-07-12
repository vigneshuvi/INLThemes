//
//  INLThemeElement.swift
//  INLThemes
//
//  Created by Tomas Hakel on 01/03/2016.
//  Copyright © 2016 Inloop. All rights reserved.
//

import Foundation

extension INLThemeElement {

	open subscript (elementId:String) -> String? {
		return values[elementId] as? String
	}

	open func string(elementId: String) -> String? {
		return self[elementId]
	}

	open func number(elementId: String) -> Double? {
		guard let number = values[elementId] as? NSNumber
			else { return nil }

		return number.doubleValue
	}

	open func color(elementId: String) -> UIColor? {
		guard let color = self[elementId]
			else { return nil }

		return UIColor(hex: color)
	}

	open func image(elementId: String) -> UIImage? {
		guard let image = self[elementId]
			else { return nil }

		return INLAssetService.imageNamed(image)
	}

	open func bool(elementId: String) -> Bool? {
		guard let number = values[elementId] as? NSNumber
			else { return nil }

		return number.boolValue
	}

	open func font() -> UIFont? {
        guard let fontName = self["font"], let fontSize = self.number(elementId: "fontSize")
			else { return nil }

		return UIFont(name: fontName, size: CGFloat(fontSize))
	}
}
