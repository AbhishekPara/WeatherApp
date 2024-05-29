//
//  ContentView.swift
//  WeatherApp
//
//  Created by Abhishek Parapuram on 2024-05-26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManger = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            
            if let location = locationManger.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView().task {
                        do {
                            try await weather = weatherManager.getCurrentWeather(lattitude: location.latitude, longitude: location.longitude)
                        } catch {
                            print("Error getting weather \(error)")
                        }
                    }
                }
            } else {
                if locationManger.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManger)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
