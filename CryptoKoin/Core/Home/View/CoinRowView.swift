//
//  CoinRowView.swift
//  SwiftCoin
//
//  Created by Rakha Fatih Athallah on 11/10/22.
//

import SwiftUI

struct CoinRowView: View {
    let coin : Coin
    var body: some View {
       
        HStack {
            // market cap rank
            Text("\(Int(coin.marketCapRank ?? 1))")
                .font(.caption)
                .foregroundColor(.gray)
            
            // image
            AsyncImage(url: URL(string: coin.image)) { Image in
                Image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                
            } placeholder: {
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 32, height: 32)
            }

            
            // coin name info
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            // coin price info
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text("\(coin.priceChangePercentage24H.toPercentString())")
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
