//
//  SafariView.swift
//  AppleFramework
//
//  Created by Kushagra Acharya on 11/03/2024.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    let url:URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) ->  SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
    
   
}

