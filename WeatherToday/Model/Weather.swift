import Foundation

public struct Weather {
    let city: String
    let temperature: String
    let temp_min: String
    let temp_max: String
    let description: String
    let icon: String
    
    init(response: APIResponse) {
        city = response.name
        temperature = "\(Int(response.main.temp))"
        temp_min = "\(Int(response.main.temp_min))"
        temp_max = "\(Int(response.main.temp_max))"
        description = response.weather.first?.description ?? ""
        icon = response.weather.first?.icon ?? ""
    }
}
