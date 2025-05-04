//
//  MenuComponent.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 04.05.25.
//

import SwiftUI

struct MenuComponent: View {

	// MARK: - Properties
	@State private var selected: MenuPoint = .timer

	// MARK: - View Body
	var body: some View {
		HStack {
			ForEach(MenuPoint.allCases) { point in
				HStack {
					Image(systemName: point.icon)
					if selected == point {
						Text(point.name)
							.font(.Bold.regular)
					}
				}
				.foregroundStyle(selected == point ? .white: .secondary)
				.padding(15)
				.background(
					Capsule()
						.fill(selected == point ? point.color: .secondary.opacity(0.2))
				)
				.button {
					withAnimation {
						selected = point
					}
				}
			}
		}
	}
}

#Preview {
	MenuComponent()
}
