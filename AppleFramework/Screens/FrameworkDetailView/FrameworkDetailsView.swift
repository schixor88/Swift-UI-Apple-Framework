//
//  FrameworkDetailsView.swift
//  AppleFramework
//
//  Created by Kushagra Acharya on 11/03/2024.
//

import SwiftUI

struct FrameworkDetailsView: View {
    
    var framework:FrameworkModel
    @Binding var isShowingDetailView:Bool
    @State var isShowingSafariView = false
    
    var body: some View {
        VStack{
           XDismissButton(isShowingDetailView: $isShowingDetailView)
            Spacer()
            FrameworkTitleView(framework: framework)
            Text(framework.description).padding().font(.body)
            Spacer()
            Button{
                isShowingSafariView = true
            }label: {
               AFButton(title: "Learn More")
            }
           
        }.fullScreenCover(isPresented: $isShowingSafariView){
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        }
    }
}

#Preview {
    FrameworkDetailsView(framework:
                            FrameworkModel(name: "ARKit",
                                                                   imageName: "arkit",
                                                                   urlString: "https://developer.apple.com/augmented-reality/arkit",
                                           description: "ARKit 4 introduces a brand-new Depth API, creating a new way to access the detailed depth information gathered by the LiDAR Scanner on iPhone 12 Pro, iPhone 12 Pro Max, and iPad Pro.\n\nLocation Anchors leverages the higher-resolution data in Apple Maps to place AR experiences at a specific point in the world in your iPhone and iPad apps. And support for face tracking extends to all devices with the Apple Neural Engine and a front-facing camera, so even more users can experience the joy of AR in photos and videos."), isShowingDetailView: .constant(false))
}
