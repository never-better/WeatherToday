import SwiftUI

@main
struct WeatherTodayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
        }
    }
}
