//
//  DashboardScreen.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

import SwiftUI

struct DashboardScreen: View {

	// MARK: - Properties

	@State private var model: DashboardModel = .init()

	// MARK: - View Body
	var body: some View {
		VStack {
			HStack(spacing: 15) {
				Image(.sfLogo)
					.resizable()
					.scaledToFit()
					.frame(width: 50)

				Text("Hallo \(model.setting.name)")
					.font(.Bold.heading1)

				Spacer()
			}

			VStack {

				VStack {
					HStack(spacing: 5) {
						Text(model.timeElapsed.hourMinuteString)
							.font(.Bold.extraLarge)

						Text(model.timeElapsed.secondsString)
							.font(.Bold.regularSmall)
							.padding(.top, 25)
					}
					.foregroundStyle(model.timerIsRunning ? .primary: .secondary)
				}
				.padding()
				.frame(maxWidth: .infinity)
				.padding(.horizontal, 35)

				HStack {
					Image(systemName:  "\(model.timerIsRunning ? "pause": "play").fill")
						.font(.Bold.title)
						.padding()
						.frame(maxWidth: .infinity)
						.foregroundStyle((model.timerIsRunning ? Color.blue: Color.green).mix(with: .black, by: 0.15))
						.background(
							RoundedRectangle(cornerRadius: 10)
								.fill((model.timerIsRunning ? Color.blue: Color.green).mix(with: .black, by: 0.15).opacity(0.2))
								.stroke((model.timerIsRunning ? Color.blue: Color.green).mix(with: .black, by: 0.15), lineWidth: 2)
						)
						.button {
							withAnimation {
								if model.timer.isNil {
									model.startTimer()
								} else {
									model.pausedTimer()
								}
							}
						}

					if model.timer.isNotNil  {
						Image(systemName: "stop.fill")
							.font(.Bold.title)
							.padding()
							.frame(maxWidth: .infinity)
							.foregroundStyle(.red.mix(with: .black, by: 0.15))
							.background(
								RoundedRectangle(cornerRadius: 10)
									.fill(.red.mix(with: .black, by: 0.15).opacity(0.2))
									.stroke(.red.mix(with: .black, by: 0.15), lineWidth: 2)
							)
							.button {
								withAnimation {
									model.stopTimer()
								}
							}
					}
				}
			}

			Spacer()
		}
		.padding(.horizontal)
		.environment(\.dashboardModel, model)
		.onAppear {
			print(model.setting)
		}
	}
}

#Preview {
	DashboardScreen()
}
