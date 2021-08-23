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
            
            NavigationLink(
                destination: Location()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true),
                label: {
                    Text("Start")
                        .font(.headline)
                        .frame(width: 200, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                })
            Spacer()
        }
        .navigationBarItems(trailing:
                                NavigationLink(
                                    destination: Location().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                                    label: {
                                        Image(systemName: "arrow.right")
                                            .font(Font.system(.title3))
                                            .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                    })
        )
        .navigationBarBackButtonHidden(true)
    }
}


