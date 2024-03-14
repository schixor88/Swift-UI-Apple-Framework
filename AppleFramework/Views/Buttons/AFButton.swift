//
//  AFButton.swift
//  AppleFramework
//
//  Created by Kushagra Acharya on 11/03/2024.
//

import SwiftUI

struct AFButton: View {
    
    var title:String
    
    var body: some View {
       
            Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        
    }
}

#Preview {
    AFButton(title: "Test Title")
}
