//
//  ContentViewModel.swift
//  Tradesy KMM iOS Trial
//
//  Created by Michael Roebuck on 3/30/22.
//

import Foundation
import TradesyApiFramework


class ContentViewModel : ObservableObject {
    
    @Published private(set) var list: [HomePagePromotion] = []
    
    init() {
        ApiClient().tradesyHomePage {(response, error) in
            if let response = response {
                if let homePageData = response.homepage?.homePageData {
                    if !homePageData.isEmpty {
                        self.list = Array(homePageData.values)
                    }
                }
            }
        }
    }
}

