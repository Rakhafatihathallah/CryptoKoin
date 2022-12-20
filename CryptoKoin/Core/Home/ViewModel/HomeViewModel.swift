//
//  HomeViewModel.swift
//  SwiftCoin
//
//  Created by Rakha Fatih Athallah on 11/10/22.
//

import SwiftUI


class HomeViewModel : ObservableObject {
    @Published var changeCurrency : String = ""
 
    let coinURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=idr&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h"
    
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    //when initializing the ViewModel, the function will called (@StateObj, @ObservedObj)
    //so we doesnt need to use onAppear
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        guard let url = URL(string: coinURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                // return to stop function when error
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("DEBUG: response with code \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
                print("DEBUG: Coins \(coins)")
            }catch {
                print("DEBUG: Failed to decode with error \(error)")
            }
            
        }.resume()
    }
    
    //sorting by top mover in 24h
    func configureTopMovingCoins() {
        let topMovers = coins.sorted { $0.priceChangePercentage24H > $1.priceChangePercentage24H }
        self.topMovingCoins = Array(topMovers.prefix(5))
    }
    
}
