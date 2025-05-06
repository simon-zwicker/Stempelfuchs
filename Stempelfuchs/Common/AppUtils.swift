//
//  AppUtils.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 06.05.25.
//

struct AppUtils {
    
    // MARK: - Singelton Shared
    static var shared: AppUtils = .init()
    
    // MARK: - Properties
    private var settings: Settings
    
    // MARK: - Computed Properties
    var name: String { settings.name }
    var workdays: [Days] { settings.workDays }
    
    // MARK: - Initializer
    init() {
        settings = .empty
        fetchSettings()
    }
    
    // MARK: - Mutating Helper Functions
    mutating func fetchSettings() {
        do {
            guard let data = KeychainEntry.settings.getData else { return }
            self.settings = try data.decode(Settings.self)
        } catch {
            print("Error on fetching Settings: \(error)")
        }
    }
    
    mutating func setSettings(_ settings: Settings) {
        self.settings = settings
        do {
            let data = try settings.encode()
            KeychainEntry.settings.setData(with: data)
        } catch {
            print("Error on setting Settings: \(error)")
        }
    }
}
