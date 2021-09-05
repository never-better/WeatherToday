import SwiftUI



struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(){
                Spacer()
                
                Text("08  / 31")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.white)
                Text("Seoul")
                    .font(.system(size: 60, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                
                
                VStack(spacing: 20) {
                    Image(systemName: "sun.max.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 180, height: 180)
                        .padding(20)
                    
                    Text("25°C")
                        .font(.system(size: 50, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text("20 ~ 25")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                }
                Spacer()
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
