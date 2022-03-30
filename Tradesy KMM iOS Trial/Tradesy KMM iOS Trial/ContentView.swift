//
//  ContentView.swift
//  Tradesy KMM iOS Trial
//
//  Created by Michael Roebuck on 3/29/22.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.list, id: \.self) {
                        let nextObject = $0

                        if let header = nextObject.header {
                            Text(header)
                                .font(.title)
                        }

                        if let subtitle = nextObject.subtitle {
                            Text(subtitle)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.gray)
                        }

                        if let url = nextObject.image {
                            AsyncImage(url: URL(string: url)!,
                                           placeholder: { Text("Loading ...") },
                                           image: { Image(uiImage: $0).resizable() })
                                   .frame(idealHeight: UIScreen.main.bounds.width / 2 * 3)
                        }
                        
                        Divider().border(Color.blue).padding()
                    }

                    //iOS 15 and above...
////                            AsyncImage(url: URL(string: url))
////                                .clipShape(Circle())
////                                .shadow(radius: 8)
//                    .onDelete { index in
//                        // delete item
//                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
