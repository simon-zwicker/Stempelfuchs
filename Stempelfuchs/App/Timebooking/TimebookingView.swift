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

	// MARK: - View Body
	var body: some View {
        VStack(spacing: 30) {
			TimerComponent()
            TimebookingWeek()

			Spacer()
		}
		.padding(.top, 20)
		.padding()
	}
}

#Preview {
    @Previewable @State var entry: TimeEntry? = nil
	TimebookingView(currentEntry: $entry)
}

