import SwiftUI

struct CardListView: View {
    @ObservedObject var presenter: CardListPresenter
    @State private var isNavigating = false
    var body: some View {
            NavigationView {
                VStack {
                    if presenter.isLoading {
                        ProgressView("carga de tarjetas...")
                    } else if let errorMessage = presenter.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    } else {
                        List(presenter.cards) { card in
                            NavigationLink(destination: presenter.didSelectCard(card), label: {
                                Button(action: {
                                    isNavigating = true
                                }) {
                                    VStack(alignment: .leading) {
                                        // Navy blue color for the card name
                                        Text(card.name)
                                            .foregroundColor(Color(red: 0/255, green: 0/255, blue: 128/255))  // Navy blue

                                        // Gray color for the card description
                                        Text(card.text)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                            })
                        }
                    }
                }
                .onAppear {
                    presenter.loadCards() 
                }
              
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                 
                            Image(Constant.logoName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                            
                           
                            Text("Lista De Cartas")
                                .fontWeight(.bold)
                                .font(.headline)
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
