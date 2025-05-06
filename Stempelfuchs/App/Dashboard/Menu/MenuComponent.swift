//
//  MenuComponent.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 04.05.25.
//

import SwiftUI

struct MenuComponent: View {

	// MARK: - Properties
	@Binding var selected: MenuPoint

	// MARK: - View Body
	var body: some View {
		HStack {
			ForEach(MenuPoint.allCases) { point in
				HStack {
					Image(systemName: selected == point ? point.iconSelected: point.icon)
					if selected == point {
						Text(point.name)
							.font(.Bold.regular)
					}
				}
				.foregroundStyle(selected == point ? .white: .secondary)
				.padding(15)
				.frame(height: 50)
				.frame(minWidth: 60)
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
