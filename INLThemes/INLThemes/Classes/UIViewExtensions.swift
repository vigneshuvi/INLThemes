//
//  UIViewExtensions.swift
//  INLThemes
//
//  Created by Tomas Hakel on 26/02/2016.
//  Copyright © 2016 Inloop. All rights reserved.
//

import UIKit


extension UIButton {
    open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

        if let color = theme.color(elementId: "color") {
			self.imageView?.tintColor = color
		}
        if let textColor = theme.color(elementId: "textColor") {
            self.setTitleColor(textColor, for: .normal)
		}
        if let text = theme.string(elementId: "text") {
            self.setTitle(text, for: .normal)
		}
        if let image = theme.image(elementId: "image") {
            self.setImage(image, for: .normal)
		}
		if let font = theme.font() {
			self.titleLabel?.font = font
		}
	}
}


extension UICollectionViewCell {
    open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

        if let backgroundColor = theme.color(elementId: "backgroundColor") {
			let backgroundView = UIView(frame: CGRect.zero)
			backgroundView.backgroundColor = backgroundColor
			backgroundView.layer.masksToBounds = true
			self.backgroundView = backgroundView
		}
        if let selectedBackgroundColor = theme.color(elementId: "selectedBackgroundColor") {
			let backgroundView = UIView(frame: CGRect.zero)
			backgroundView.backgroundColor = selectedBackgroundColor
			backgroundView.layer.masksToBounds = true
			self.selectedBackgroundView = backgroundView
		}
	}
}


extension UIImageView {
	open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

        if let image = theme.image(elementId: "image") {
			self.image = image
		}
	}
}


extension UILabel {
    open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

		if let text = theme["text"] {
			self.text = text
		}
		if let textColor = theme.color(elementId:"textColor") {
			self.textColor = textColor
		}
		if let font = theme.font() {
			self.font = font
		}
	}
}


extension UINavigationBar {
    open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

		if let barTintColor = theme.color(elementId:"barTintColor") {
			self.barTintColor = barTintColor
		}
	}
}


extension UIPageControl {
    open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

        if let color = theme.color(elementId: "color") {
			self.currentPageIndicatorTintColor = color
		}
        if let inactiveColor = theme.color(elementId: "inactiveColor") {
			self.pageIndicatorTintColor = inactiveColor
		}
	}
}


extension UIScrollView {
    open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

        if let useDarkIndicator = theme.bool(elementId: "useDarkIndicator") {
            self.indicatorStyle = useDarkIndicator ? .black : .white
		}
	}
}

extension UISwitch {
    open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

        if let tintColor = theme.color(elementId: "tintColor") {
			self.onTintColor = tintColor
		}
	}
}


extension UITabBar {
    open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

        if let barTintColor = theme.color(elementId: "barTintColor") {
			self.barTintColor = barTintColor
		}
	}
}


extension UITableView {
    @objc open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

        if let separatorColor = theme.color(elementId: "separatorColor") {
			self.separatorColor = separatorColor;
		}
	}
}


extension UITableViewCell {
	open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

		if let backgroundColor = theme.color(elementId:"backgroundColor") {
			let backgroundView = UIView(frame: CGRect.zero)
			backgroundView.backgroundColor = backgroundColor
			backgroundView.layer.masksToBounds = true
			self.backgroundView = backgroundView
		}

		if let selectedBackgroundColor = theme.color(elementId:"selectedBackgroundColor") {
			let backgroundView = UIView(frame: CGRect.zero)
			backgroundView.backgroundColor = selectedBackgroundColor
			backgroundView.layer.masksToBounds = true
			self.selectedBackgroundView = backgroundView
		}
	}
}


extension UITextField {

    open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

		if let text = theme["text"] {
			self.text = text
		}
		if let placeholder = theme["placeholder"] {
			self.placeholder = placeholder
		}
        if let textColor = theme.color(elementId: "textColor") {
			self.textColor = textColor
		}
        if let inactiveColor = theme.color(elementId: "placeholderColor"), let placeholder = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedStringKey.foregroundColor: inactiveColor])
		}
		if let font = theme.font() {
			self.font = font
		}
	}
}


extension UITextView {
    @objc open override func applyTheme(_ theme: INLThemeElement) {
		super.applyTheme(theme)

		if let text = theme["text"] {
			self.text = text
		}
        if let textColor = theme.color(elementId: "textColor") {
			self.textColor = textColor
		}
		if let font = theme.font() {
			self.font = font
		}
	}
}
