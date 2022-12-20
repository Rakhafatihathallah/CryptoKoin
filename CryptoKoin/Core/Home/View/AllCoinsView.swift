//
//  AllCoinsView.swift
//  SwiftCoin
//
//  Created by Rakha Fatih Athallah on 11/10/22.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Coin")
                
                Spacer()
                
                Text("Price")
                
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
    }
}
