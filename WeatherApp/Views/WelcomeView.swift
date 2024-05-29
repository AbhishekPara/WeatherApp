//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Abhishek Parapuram on 2024-05-26.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManger: LocationManager
    var body: some View {
        VStack {
            VStack (spacing: 20){
                Text("Welcome to the Weather App")
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Please share your current location to get the weather in your area").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            LocationButton(.shareCurrentLocation){
                locationManger.requestLocation()
            }
            .cornerRadius(30.0)
            .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
