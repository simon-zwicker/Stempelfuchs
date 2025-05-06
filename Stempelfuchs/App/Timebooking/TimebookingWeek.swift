//
//  TimebookingWeek.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 06.05.25.
//

import SwiftUI

struct TimebookingWeek: View {
    
    // MARK: - Properties
    @State private var today: Date = .now
    
    // MARK: - View Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mai 2025")
                .font(.Bold.title2)
                .foregroundStyle(.main)
            Text("KW\(today.weekNumber)")
                .font(.Bold.regular)
                .foregroundStyle(.secondary)

            HStack(spacing: 5) {
                ForEach(today.daysOfWeek, id: \.self) { day in
                    VStack {
                        VStack(spacing: 25) {
                            Text(day.day.description)
                                .font(.Bold.regular)
                            
                            Text(day.dayNameShort)
                                .font(.Bold.verySmall)
                        }
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(weekdayColor(day))
                        )
                        
                        if day.isToday {
                            Image(systemName: "arrowtriangle.up.fill")
                                .font(.Regular.small)
                                .foregroundStyle(.main)
                                .padding(.top, 3)
                        }
                    }
                }
            }
            .padding(.top, 20)
        }
    }
    
    func weekdayColor(_ day: Date) -> Color {
        guard let workday = Days(rawValue: day.dayNumber) else { return .gray }
        let workdays = AppUtils.shared.workdays
        return workdays.contains(workday) ? .main.opacity(0.3): .secondary.opacity(0.15)
    }
}
