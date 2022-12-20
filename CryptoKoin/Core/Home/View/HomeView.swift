//
//  HomeView.swift
//  SwiftCoin
//
//  Created by Rakha Fatih Athallah on 11/10/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                // top mover view
                TopMoverView(viewModel: viewModel)
                Divider()
                // all coins view
                AllCoinsView(viewModel: viewModel) //binding the coin
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
