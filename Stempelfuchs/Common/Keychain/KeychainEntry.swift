//
//  Keychain.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

import Foundation

enum KeychainEntry {
	case settings
}

extension KeychainEntry {
	var ident: String {
		switch self {
		case .settings: "stempelfuchs.settings.kc"
		}
	}

	var getData: Data? {
		Keychain.getData(for: self)
	}

	func setData(with data: Data) {
		Keychain.setData(with: data, for: self)
	}
}
