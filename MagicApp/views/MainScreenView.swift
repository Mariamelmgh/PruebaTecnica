import SwiftUI

struct MainScreenView: View {
    @ObservedObject var presenter: MainScreenPresenter
    @State private var isNavigating = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
             
                VStack(spacing: 10) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)

                    Text("Magic App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0/255, green: 0/255, blue: 128/255))
                        .multilineTextAlignment(.center)
                       
                    Text("Bienvenido")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                        .multilineTextAlignment(.center)
                        .padding( 10)
                    
                }
                .padding(.top, 40)
                
            

               
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .center, spacing: 3){
                        Text("Nombre")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("Mariam")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                    }
                    HStack{
                        Text("Apellido")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("EL MGHARAZ")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                    }
                    HStack{
                        Text("Correo")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("mariam.elmghraz20@gmail.com")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                    }
                    HStack{
                        Text("Fecha")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("12/09/2024")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                    }
                   

                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)

                Spacer()

              
                Button(action: {
                    isNavigating = true
                }) {
                    Text("Cartas")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(Color(red: 0/255, green: 0/255, blue: 128/255))
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 4)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
               

                Spacer()
            }
            .background(
                    Image(Constant.background)
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea()
                            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGroupedBackground))
            .navigationDestination(isPresented: $isNavigating) {
                presenter.goToListScreen()
            }
                            )
        }
    }
}

//#Preview {
//    MainScreenView(presenter: presenter)
//}
