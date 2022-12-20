//
//  TopMoverItemView.swift
//  SwiftCoin
//
//  Created by Rakha Fatih Athallah on 11/10/22.
//

import SwiftUI
import Kingfisher

struct TopMoverItemView: View {
    let coin : Coin
    var body: some View {
        VStack(alignment: .leading){
            //image
            KFImage(URL(string: coin.image))
                .resizable()
                .placeholder({
                    Circle()
                        .frame(width: 32, height: 32)
                })
                .frame(width: 32, height: 32)
                .padding(.bottom, 8)
                

            //coin info
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray )
            }
            
            //coin percentage
            Text("\(coin.priceChangePercentage24H.toPercentString())")
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .background(Color("itemBackgroundColor"))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        }
    }
}

//struct TopMoverItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoverItemView()
//    }
//}
