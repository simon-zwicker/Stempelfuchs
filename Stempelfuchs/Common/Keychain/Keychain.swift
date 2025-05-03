//
//  Keychain.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

import KeychainSwift
import Foundation

struct Keychain {
	static let keychain = KeychainSwift()

	static func setData(with data: Data, for entry: KeychainEntry) {
		keychain.set(data, forKey: entry.ident)
	}

	static func getData(for entry: KeychainEntry) -> Data? {
		keychain.getData(entry.ident)
	}
}
