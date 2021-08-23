//
//  OnBoarding.swift
//  FoodDeliveryToYou
//
//  Created by Bakyt Dzhumabaev on 23/8/21.
//

import SwiftUI
import UIKit

struct OnBoarding: View {
  
    @State var showSheetView = false
    
    init() {
        UIPageControl.appearance()
            .currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor =
            UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        NavigationView {
            pages()
        }.sheet(isPresented: $showSheetView) {
            Location()
        }.animation(.none)
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}

struct pages: View {
    var body: some View {
        VStack {
            
            TabView {
                ForEach(Data) { page in
                    GeometryReader { g in
                        VStack {
                            Image(page.image)
                                .resizable()
                                .scaledToFit()
                            Text(page.title)
                                .font(.title).bold()
                                .padding(.all, 20)
                            Text(page.descrip)
                                .multilineTextAlignment(.center)
                                .padding(.all, 10)
                        }.opacity(Double(g.frame(in: .global).minX) / 200 + 1)
                    }
                }
            }.edgesIgnoringSafeArea(.top)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            NavigationLink
        }
    }
}
