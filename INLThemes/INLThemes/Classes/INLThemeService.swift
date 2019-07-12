//
//  INLThemeService.swift
//  INLThemes
//
//  Created by Tomas Hakel on 01/03/2016.
//  Copyright © 2016 Inloop. All rights reserved.
//

import Foundation


@objc
open class INLThemeService: NSObject {

	open class var sharedService: INLThemeService {
		struct Static {
			static var instance = INLThemeService()
		}
		return Static.instance
	}

	open var currentTheme: INLTheme?
	var themeConsumers = [INLThemeConsumer]()

	// MARK: - Register theme consumer
	open func registerThemeConsumer(themeConsumer: INLThemeConsumer) {

		themeConsumers.append(themeConsumer)
		if let theme = currentTheme {
			applyTheme(theme, to: themeConsumer)
		}
	}

	open func removeThemeConsumer(themeConsumer: INLThemeConsumer) {

		themeConsumers = themeConsumers.filter { !$0.isEqual(themeConsumer) }
	}

	// MARK: - Apply theme
	open func applyTheme(_ theme: INLTheme) {

		currentTheme = theme;
		themeConsumers.forEach { applyTheme(theme, to: $0) }
	}

	open func applyTheme(_ theme: INLTheme, to themeConsumer: INLThemeConsumer) {

		applyTheme(theme, toViews: themeConsumer.themedViews())
	}

	open func applyThemeTo(themeConsumer: INLThemeConsumer) {

		if let currentTheme = self.currentTheme {
			applyTheme(currentTheme, to: themeConsumer)
		}
	}

	func applyTheme(_ theme: INLTheme, toViews themedViews:[INLThemedView]) {

		themedViews.forEach {
			if let element = theme.uiElements[$0.elementId] {
				$0.applyTheme(element)
			}
		}
	}

	// MARK: - Convinience
	open class func registerThemeConsumer(themeConsumer: INLThemeConsumer) {
        sharedService.registerThemeConsumer(themeConsumer: themeConsumer)
	}

	open class func removeThemeConsumer(themeConsumer: INLThemeConsumer) {
        sharedService.removeThemeConsumer(themeConsumer: themeConsumer)
	}

	open class func applyTheme(_ theme: INLTheme) {
		sharedService.applyTheme(theme)
	}

	open class func applyTheme(_ theme: INLTheme, to themeConsumer:INLThemeConsumer) {
		sharedService.applyTheme(theme, to: themeConsumer)
	}

	open class func applyThemeTo(themeConsumer: INLThemeConsumer) {
        sharedService.applyThemeTo(themeConsumer: themeConsumer)
	}
}
