//
//  CardListInteractorTests.swift
//  MagicAppTests
//
//  Created by Mariam El Mgharaz on 12/9/2024.
//

import Foundation

import XCTest
@testable import MagicApp
import Alamofire
class CardListInteractorTests: XCTestCase {
    
    var interactor: CardListInteractor!
    var mockUserDefaults: UserDefaults!
    let cardName = "TestCard"
    override func setUp() {
            super.setUp()
            
            interactor = CardListInteractor()
            
           
            mockUserDefaults = UserDefaults(suiteName: cardName)
            UserDefaults.standard.removePersistentDomain(forName: cardName)
        }
    
    override func tearDown() {
          super.tearDown()
          
          interactor = nil
          UserDefaults.standard.removePersistentDomain(forName: cardName)
      }
    
    // Test case: Verify that cached cards are returned when available
        func testFetchCardsWithCachedData() {
            let mockCards = [MockCard(id: "1", name: "Card1", text: "test card 1", imageUrl: ""),MockCard(id: "2", name: "Card2", text: "test card 2", imageUrl: "")]
            let mockData = try! JSONEncoder().encode(mockCards)
            UserDefaults.standard.set(mockData, forKey: Constant.cashKey)

            let expectation = self.expectation(description: "Fetch Cards from Cache")
            interactor.fetchCards { result in
                switch result {
                case .success(let cards):
                    XCTAssertEqual(cards.count, mockCards.count)
                    XCTAssertEqual(cards[0].name, mockCards[0].name)
                case .failure:
                    XCTFail("Expected to fetch cached cards, but got an error.")
                }
                expectation.fulfill()
            }
            
            waitForExpectations(timeout: 1, handler: nil)
        }

    func testFetchCardsFromNetwork() {
            // Arrange:
            UserDefaults.standard.removeObject(forKey: Constant.cashKey)
            

            let mockCardResponse = MockCardResponse(cards: [MockCard(id: "1", name: "Card1", text: "test card 1", imageUrl: "") ])
            let mockData = try! JSONEncoder().encode(mockCardResponse)

            let session = Session(configuration: .default, interceptor: nil, serverTrustManager: nil, redirectHandler: nil, cachedResponseHandler: nil, eventMonitors: [])
            AF.request("your-api-url").responseDecodable(of: MockCardResponse.self) { response in
                XCTAssertEqual(response.data, mockData, "Expected data to match mock network response.")
            }
        }
    func testFetchCardsNetworkFailure() {
           UserDefaults.standard.removeObject(forKey: Constant.cashKey)

           let expectation = self.expectation(description: "Fetch Cards from Network Failure")
           interactor.fetchCards { result in
               switch result {
               case .success:
                   XCTFail("Expected a failure, but got success.")
               case .failure(let error):
                   XCTAssertNotNil(error, "Expected a network failure.")
               }
               expectation.fulfill()
           }
           
           waitForExpectations(timeout: 1, handler: nil)
       }
}
