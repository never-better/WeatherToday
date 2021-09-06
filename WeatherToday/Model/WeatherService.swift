import Foundation


public final class WeatherService {
    
    private var APIKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "APIKey", ofType: "plist") else {
                fatalError("Couldn't find 'KeyAPI.plist")
            }
        
            let plist = NSDictionary(contentsOfFile: filePath)
        
            guard let value = plist?.object(forKey: "OPENWEATEHRMAP_KEY") as? String else {
                fatalError("Couldn't find OPENWEATEHRMAP_KEY")
            }
            return value
        }
    }

    
    func getData(_ completion: @escaping ((Weather) -> Void)) {
        
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=\(APIKey)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {return}
            if let result = try? JSONDecoder().decode(APIResponse.self, from: data) {
                completion(Weather(response: result))
            }
        }.resume()
    }
}

struct APIResponse: Decodable{
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Double
}

struct APIWeather: Decodable {
    let description: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case icon = "main"
    }
}

