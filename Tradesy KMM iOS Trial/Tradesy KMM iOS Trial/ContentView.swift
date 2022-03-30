//
//  ContentView.swift
//  Tradesy KMM iOS Trial
//
//  Created by Michael Roebuck on 3/29/22.
//

import SwiftUI
import TradesyApiFramework

struct ContentView: View {
    
    init() {
        ApiClient().tradesyHomePage {(response, error) in
            if let response = response {
                print("response = \(response)")
            }
            if let error = error {
                print("error = \(error)")
            }
        }
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
