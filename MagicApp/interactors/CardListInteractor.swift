import Foundation
import Alamofire
class CardListInteractor {
    
    func fetchCards(completion: @escaping (Result<[Card], Error>) -> Void) {
        // Check if we have cached data
        if let cachedCards = loadCachedCards() {
          
                    completion(.success(cachedCards))
                    return
        }
        
        AF.request(Constant.api).validate().responseDecodable(of: CardResponse.self) { response in
            switch response.result {
                       case .success(let cardResponse):
                self.saveCachedCards(cardResponse.cards)
                           completion(.success(cardResponse.cards))
                       case .failure(let error):
                          completion(.failure(error))
             
                       }
            
        }
        
        
    }
    private func saveCachedCards(_ cards: [Card]) {
         if let data = try? JSONEncoder().encode(cards) {
             UserDefaults.standard.set(data, forKey: Constant.cashKey)
         }
     }
     
     private func loadCachedCards() -> [Card]? {
         if let data = UserDefaults.standard.data(forKey: Constant.cashKey),
            let cachedCards = try? JSONDecoder().decode([Card].self, from: data) {
             print("data", data)
             return cachedCards
         }
       
         return nil
     }
}


// Define a custom error type for network errors
enum NetworkError: Error {
    case invalidURL
    case noData
}
