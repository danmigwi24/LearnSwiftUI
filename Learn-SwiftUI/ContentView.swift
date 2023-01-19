//
//  ContentView.swift
//  Learn-SwiftUI
//
//  Created by Daniel Kimani on 06/05/2022.
//

import SwiftUI

/*
 -Create Data Model Of MainWeatherStatusView
 -Fetch data from API
 */

struct ContentView: View {
    
    @State private var isNight:Bool = false
    
    var body: some View {
        ZStack{
            //            Color(.blue)
            //                .edgesIgnoringSafeArea(.all)
            
            //            BackGroundView(
            //                topColor: isNight ? .black : .blue,
            //                bottomColor: isNight ? .gray : Color("lightBlue"))
            
            BackGroundView(isNight: $isNight)
            
            VStack{
                CityTextView(textCity: "Abidjan")
                
                MainWeatherStatusView(
                    imageMainWeather: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temparature: 68
                )
                
                HStack(spacing: 20){
                    WeatherDayView(
                        dayOfWeek: "MON",
                        imageName: "sun.max.fill",
                        temprature: 74
                    )
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "snow",
                        temprature: 74
                    )
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sunset.fill",
                        temprature: 74
                    )
                    WeatherDayView(
                        dayOfWeek: "THUR",
                        imageName: "wind.snow",
                        temprature: 74
                    )
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "cloud.sun.fill",
                        temprature: 74
                    )
                    
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                    print("Taped")
                }label: {
                    CustomButtonText(
                        buttonText: "Change Day Time",
                        buttonForegroundColor:.blue,
                        buttonBackGroundColor: .white,
                        buttonRadius: 10,
                        buttonWidth: 280,
                        buttonHeight: 50
                    )
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

struct WeatherDayView: View {
    
    var dayOfWeek:String
    var imageName:String
    var temprature:Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: "\(imageName)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(.bottom,8)
            Text("\(temprature)°")
                .font(.system(size:24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackGroundView: View {
    @Binding var isNight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(
            colors: [isNight ? .black : .blue ,
                     isNight ? .gray : Color("lightBlue")
                    ]
        ), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackGround2View: View {
    var topColor:Color
    var bottomColor:Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView:View{
    var textCity:String
    
    var body: some View{
        Text(textCity)
            .font(.system(size: 32, weight: .medium, design:.default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageMainWeather:String
    var temparature:Int
    var body: some View {
        VStack(spacing:10){
            Image(systemName: imageMainWeather)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 180, height: 180)
                .padding(.bottom,8)
            Text("\(temparature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }.padding(.bottom,48)
    }
}


