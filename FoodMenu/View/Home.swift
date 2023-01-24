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
                                        .foregroundColor(currentTab.replacingOccurrences(of: " SCROLL", with: "") == tab.id ? .black : .gray)

                                    if currentTab.replacingOccurrences(of: " SCROLL", with: "") == tab.id {
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
                                        currentTab = "\(tab.id) TAP"
                                        proxy.scrollTo(currentTab.replacingOccurrences(of: " TAP", with: ""), anchor: .topTrailing)
                                    }
                                }
                            }
                        }
                            .padding(.horizontal, 30)
                    }
                    .onChange(of: currentTab) { _ in
                    if currentTab.contains(" SCROLL") {
                        withAnimation(.easeInOut) {
                            proxy.scrollTo(currentTab.replacingOccurrences(of: " SCROLL", with: ""), anchor: .topTrailing)
                        }
                    }
                }


                }.padding(.top)

            }
                .padding([.top])

                .background(scheme == .dark ? Color.black : Color.white)
                .overlay(
                Divider().padding(.horizontal, -15), alignment: .bottom
            )

            ScrollView(.vertical, showsIndicators: false) {

                ScrollViewReader { proxy in

                    VStack(spacing: 15) {

                        ForEach(tabItems) { tab in
                            MenuCardView(tab: tab, currentTab: $currentTab)
                                .padding(.top)
                        }

                    }
                        .padding([.horizontal, .bottom])
                        .onChange(of: currentTab) { newValue in
                        if currentTab.contains(" TAP") {
                            withAnimation(.easeOut) {
                                proxy.scrollTo(currentTab.replacingOccurrences(of: " TAP", with: ""), anchor: .topTrailing)
                            }
                        }
                    }
                }

                    

            }
                .coordinateSpace(name: "SCROLL")
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


struct MenuCardView: View {
    var tab: Tab
    @Binding var currentTab: String
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(tab.tab)
                .font(.title.bold())
                .padding(.vertical)

            ForEach(tab.foods) { food in
                HStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(food.title)
                            .font(.title.bold())

                        Text(food.description)
                            .font(.caption)
                            .foregroundColor(.gray)

                        Text("Price: \(food.price)")
                            .fontWeight(.bold)
                    }
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Image(food.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 75)
                        .cornerRadius(10)
                }
                Divider()

            }
        }
            .modifier(OffsetModifier(tab: tab, currentTab: $currentTab))

            .id(tab.id)
    }
}
