//
//  Home.swift
//  FoodMenu
//
//  Created by Abdullah Karaboğa on 21.01.2023.
//

import SwiftUI

struct Home: View {
    @State var currentTab: String = ""
    @Namespace var animation
    @Environment(\.colorScheme) var scheme


    var body: some View {

        VStack(spacing: 0) {
            VStack {

                HStack(spacing: 15) {
                    Text("Food Menu")
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                }
                ScrollViewReader { proxy in

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            ForEach(tabItems) { tab in
                                VStack {
                                    Text(tab.tab)
                                        .foregroundColor(currentTab == tab.id ? .black : .gray)

                                    if currentTab == tab.id {
                                        Capsule()
                                            .fill(.black)
                                            .matchedGeometryEffect(id: "TAB", in: animation)
                                            .frame(height: 2)
                                            .padding(.horizontal, -10)


                                    } else {
                                        Capsule()
                                            .fill(.clear)
                                            .frame(height: 2)
                                            .padding(.horizontal, -10)

                                    }

                                }
                                    .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        currentTab = tab.id
                                        proxy.scrollTo(currentTab, anchor: .topTrailing)
                                    }
                                }
                            }
                        }
                            .padding(.horizontal, 30)
                    }


                }.padding(.top)

            }
                .padding([.top])

                .background(scheme == .dark ? Color.black : Color.white)
                .overlay(
                Divider().padding(.horizontal, -15), alignment: .bottom
            )

            ScrollView(.vertical, showsIndicators: false) {

            }

        }
            .onAppear {
            currentTab = tabItems.first?.id ?? ""

        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



