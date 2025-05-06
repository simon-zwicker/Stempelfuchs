//
//  TimebookingVIew.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 04.05.25.
//

import SwiftUI

struct TimebookingView: View {

	// MARK: - Properties
    @Binding var currentEntry: TimeEntry?
	@Binding var entries: [TimeEntry]

	// MARK: - View Body
	var body: some View {
        VStack(spacing: 30) {
            TimerComponent(current: $currentEntry)
            TimebookingWeek()

			HStack {
				ForEach(entries) { entry in
					
				}
			}

			Spacer()
		}
		.padding(.top, 20)
		.padding()
	}
}

#Preview {
    @Previewable @State var entry: TimeEntry? = nil
	@Previewable @State var entries: [TimeEntry] = []
	TimebookingView(currentEntry: $entry, entries: $entries)
}

