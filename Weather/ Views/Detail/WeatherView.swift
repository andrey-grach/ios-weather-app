//
//  WeatherView.swift
//  Weather
//
//  Created by Андрей Грач on 06.07.2022.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText = ""
    
    var searchResults: [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter {$0.location.contains(searchText)}
        }
    }
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
//            MARK: Weather Widgets
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(searchResults) { result in
                        WeatherWidget(forecast: result)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay{
//            MARK: Navigation Bar
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
//        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Найти город")
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .preferredColorScheme(.dark)
    }
}
