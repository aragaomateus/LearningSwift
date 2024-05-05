//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mateus Aragão on 4/19/24.
//

import SwiftUI
// every view returns a body and a view
// struct dont hold state, they get destroyd and created all the time.

struct ContentView: View {
    
//    source of truth data, variable to handle is night is true or
    // night is false.
    // this keeps the state as the views get created and destroyed
    @State private var isNight = false
    

    let days : Array = ["TUE",
                        "WED",
                        "THU",
                        "FRI",
                        "SAT"]
    let figs : Array = ["cloud.sun.fill",
                       "sun.max.fill",
                       "wind",
                       "sun.horizon.fill",
                       "moon.stars.fill"]
    let temp : Array = ["74",
                        "70",
                        "66",
                        "60",
                        "55"]
    var body: some View {
        ZStack{
            // the order of the modifiers matters
            // the $ ensures the binding between the views
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                WeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 76)
                // an H stack that is populated with a for ForEach
                HStack(spacing: 20){
                    ForEach(Array(zip(days,zip(figs,temp))),id:\.0) { day, figTemp in let (fig,temp) = figTemp
                        dayView(day:day, figure: fig, temperature: temp)
                    }
                }
                Spacer()
                Button{
                    
                    isNight.toggle()

                }label:{
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}


struct dayView: View {
    var day: String
    var figure:String
    var temperature:String
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: figure)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60,height: 60)
            
            Text(temperature)
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
//    var topColor : Color
//    var bottomColor : Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black: .blue,  isNight ? .gray : Color("lightblue")]),
                       startPoint:.topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea( .all)
    }
}

struct CityTextView: View{
    var cityName : String
    
    var body : some View{
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white )
            .padding()
    }
}


struct WeatherStatusView : View{
    
    var imageName : String
    var temperature: Int
    
    var body : some View{
        VStack(spacing:10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }.padding(.bottom, 40)
    }
}
