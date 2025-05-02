//
//  Untitled.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

enum FederalState: String, CaseIterable, Identifiable {

	var id: Self { self }

	case bw
	case by
	case be
	case bb
	case hb
	case hh
	case he
	case mv
	case ni
	case nw
	case rp
	case sl
	case sn
	case st
	case sh
	case th
}

extension FederalState {
	var name: String {
		switch self {
		case .bw: return "Baden-Württemberg"
		case .by: return "Bayern"
		case .be: return "Berlin"
		case .bb: return "Brandenburg"
		case .hb: return "Bremen"
		case .hh: return "Hamburg"
		case .he: return "Hessen"
		case .mv: return "Mecklenburg-Vorpommern"
		case .ni: return "Niedersachsen"
		case .nw: return "Nordrhein-Westfalen"
		case .rp: return "Rheinland-Pfalz"
		case .sl: return "Sachsen"
		case .sn: return "Sachsen-Anhalt"
		case .st: return "Schleswig-Holstein"
		case .sh: return "Schleswig-Holstein"
		case .th: return "Thüringen"
		}
	}

	var short: String {
		self.rawValue.uppercased()
	}
}
