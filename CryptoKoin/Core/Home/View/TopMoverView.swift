//
//  TopMoverView.swift
//  SwiftCoin
//
//  Created by Rakha Fatih Athallah on 11/10/22.
//

import SwiftUI

struct TopMoverView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topMovingCoins) { coin in
                        TopMoverItemView(coin: coin)
                    }
                }
            }
        }.padding()
    }
}

struct TopMoverView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoverView()
    }
}
