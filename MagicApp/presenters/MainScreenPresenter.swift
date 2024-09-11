//
//  MainScreenPresenter.swift
//  MagicApp
//
//  Created by Mariam El Mgharaz on 10/9/2024.
//

import Foundation
import SwiftUI

class MainScreenPresenter: ObservableObject{
    
     private let router: MainScreenRouter
    
    init(router: MainScreenRouter) {
           self.router = router
       
       }
  

    
       
       func goToListScreen() -> some View{
          return router.navigateToCardsList()
       }
       
   
    
    
    
    
}
