//
//  CardDetailView.swift
//  MagicApp
//
//  Created by Mariam El Mgharaz on 11/9/2024.
//

import SwiftUI
import Kingfisher

struct CardDetailView: View {
    @ObservedObject var presenter: CardDetailPresenter
    var body: some View {
        NavigationView {
            VStack {
                // Checking if imageUrl is valid and display the image
                if let imageUrl = presenter.card.imageUrl,
                   let url = URL(string:imageUrl) {
                    KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
                   
                } else {
                    // Display a placeholder if the image URL is nil or invalid
                    ZStack {
                       
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(height: 250)
                        
                        // Centered text
                        Text("No hay imagen disponible")
                            .foregroundColor(.black)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                }
                
                // Display card name below the image
                Text(presenter.card.name)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, 20)
                    .foregroundColor(Color(red: 0/255, green: 0/255, blue: 128/255))  // Navy blue

                
                // Display card text below the name
                Text(presenter.card.text)
                    .font(.subheadline)
                    .padding()
                
                
                Spacer()
            }
            .padding()
            .onAppear {
                presenter.fetchCardDetails()
            }
            // Set navigation bar title and add logo
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        // Add logo to the navigation bar
                        Image(Constant.logoName)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
            
                        
                        Text("Detalles de la Carta")
                            .fontWeight(.bold)
                            .font(.headline)
                            .foregroundColor(.yellow)
                        
                    }
                }
            }
        }
        
    }
    
}
