//
//  TabbarView.swift
//  ACHNBrowserUI
//
//  Created by Thomas Ricouard on 08/04/2020.
//  Copyright © 2020 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import Backend

struct TabbarView: View {
    @EnvironmentObject private var uiState: UIState
    @ObservedObject private var viewModel = TabbarViewModel(musicPlayerManager: MusicPlayerManager.shared)

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $uiState.selectedTab) {
                TodayView()
                    .tag(UIState.Tab.dashboard)
                    .tabItem {
                        Image("icon-bells-tabbar")
                        Text("Dashboard")
                }
                
                CategoriesView(categories: Category.items())
                    .tag(UIState.Tab.items)
                    .tabItem {
                        Image("icon-leaf-tabbar")
                        Text("Catalog")
                }
                
                TurnipsView()
                    .tag(UIState.Tab.turnips)
                    .tabItem {
                        Image("icon-turnip-tabbar")
                        Text("Turnips")
                }
                
                VillagersListView()
                    .environmentObject(UserCollection.shared)
                    .tag(UIState.Tab.villagers)
                    .tabItem {
                        Image("icon-villager-tabbar")
                        Text("Villagers")
                }
                
                CollectionListView()
                    .tag(UIState.Tab.collection)
                    .tabItem {
                        Image("icon-cardboard-tabbar")
                        Text("Collection")
                }
                
            }
            .accentColor(Color.white)
            
            if viewModel.showPlayerView {
                PlayerView()
            }
        }
    }
}
