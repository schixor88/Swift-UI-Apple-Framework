//
//  FrameworkGridViewModel.swift
//  AppleFramework
//
//  Created by Kushagra Acharya on 11/03/2024.
//

import SwiftUI

//if youre not gonna subclass make it final
final class FrameworkGridViewModel : ObservableObject { //this allows obj to publish/broadcast
    
    var selectedFramework:FrameworkModel?{ //any time selectedframework changes, isShowingDetails is true
        didSet{
            isShowingDetailView = true
        }
    }
    
    
    
    //vm is going to have let others know that isShowingDetails or not, so to show it @Published is needed
    // when it is set to true, we will know that now we have to show the detail bottomsheet
    @Published var isShowingDetailView = false
}
