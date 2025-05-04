//
//  TimerView.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 04.05.25.
//

import SwiftUI

struct  TimerComponent: View {

	// MARK: - Properties
	@State private var model: TimerModel = .init()

	// MARK: - View Body
	var body: some View {
		VStack {
			HStack {
				Text(model.timeElapsed.hourMinuteString)
					.font(.Bold.extraLarge)

				Text(model.timeElapsed.secondsString)
					.font(.Bold.regularSmall)
					.padding(.top, 25)
					.frame(width: 20)
			}
			.foregroundStyle(model.isRunning ? .primary: .secondary)
			.frame(maxWidth: .infinity)

			HStack {
				Image(systemName: model.isRunning ? "pause.fill": "play.fill")
					.font(.Bold.title)
					.padding()
					.frame(maxWidth: .infinity)
					.foregroundStyle(model.isRunning ? .blue: .green)
					.background(
						RoundedRectangle(cornerRadius: 10)
							.fill(
								model.isRunning ?
								Color.blue.opacity(0.2) :
								Color.green.opacity(0.2)
							)
							.stroke(
								model.isRunning ?
								Color.blue :
								Color.green,
								lineWidth: 2
							)
					)
					.button {
						withAnimation {
							if model.timer.isNil {
								model.start()
							} else {
								model.pause()
							}
						}
					}

				if model.timer.isNotNil {
					Image(systemName: "stop.fill")
						.font(.Bold.title)
						.padding()
						.frame(maxWidth: .infinity)
						.foregroundStyle(.pink)
						.background(
							RoundedRectangle(cornerRadius: 10)
								.fill(.pink.opacity(0.2))
								.stroke(.pink, lineWidth: 2)
						)
						.button {
							withAnimation {
								model.stop()
							}
						}
				}
			}
		}
	}
}

#Preview {
	TimerComponent()
}
