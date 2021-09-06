import SwiftUI
import Foundation

private let defaultIcon = "questionmark"
private let defaultBackgroundColor = Gradient(colors: [.blue, Color("LightBlue")])

private let iconMap = [
    "Clear" : "sun.max.fill",
    "Clouds" : "cloud.fill",
    "Drizzle" : "cloud.drizzle.fill",
    "Rain" : "cloud.rain.fill",
    "Snow" : "snowflake",
    "Thunderstorm" : "cloud.bolt.rain.fill"
]

private let backgroundColor = [
    "Clear" : Gradient(colors: [.blue, Color("LightBlue")]) ,
    "Clouds" : Gradient(colors: [.gray, Color("LightGray")]) ,
    "Drizzle" : Gradient(colors: [.gray, Color("MiddleBlue")]) ,
    "Rain" : Gradient(colors: [.gray, Color("DarkBlue")]) ,
    "Snow" : Gradient(colors: [Color("LightMagenta")]) ,
    "Thunderstorm" : Gradient(colors: [.gray, Color("LightGray"), .yellow])
]

private var getToday: String {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "MM  /  dd"
    let todayDay = dateformatter.string(from: Date())
    return todayDay
}


public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City"
    @Published var temperature: String = "--"
    @Published var tempMin: String = "--"
    @Published var tempMax: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    @Published var weatherBackground: Gradient = Gradient(colors: [.blue, Color("LightBlue")])
    @Published var todayDay: String = "--  /  --"
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.getData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)°C"
                self.tempMin = "\(weather.temp_min)"
                self.tempMax = "\(weather.temp_max)"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.icon] ?? defaultIcon
                self.weatherBackground = backgroundColor[weather.icon] ?? defaultBackgroundColor
                self.todayDay = getToday
            }
        }
    }
}
