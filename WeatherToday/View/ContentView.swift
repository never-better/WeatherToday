import SwiftUI



struct ContentView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: viewModel.weatherBackground, startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(){
                Spacer()
                
                Text("\(viewModel.todayDay)")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.white)
                Text("\(viewModel.cityName)")
                    .font(.system(size: 60, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                
                
                VStack(spacing: 20) {
                    Image(systemName: "\(viewModel.weatherIcon)")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .padding(20)
                    
                    Text("\(viewModel.temperature)")
                        .font(.system(size: 50, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text("\(viewModel.tempMin) ~ \(viewModel.tempMax)")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                }
                Spacer()
            }
        }
        .onAppear(perform: viewModel.refresh)
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
