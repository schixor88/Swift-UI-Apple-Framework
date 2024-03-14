//
//  FrameworkGridView.swift
//  AppleFramework
//
//  Created by Kushagra Acharya on 11/03/2024.
//


import SwiftUI

struct FrameworkGridView: View {
    
    //when initializing brand new vm then use stateobj, when injecting using observableobj
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns : [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(MockData.frameworks, id: \.id){
                        framework in
                        FrameworkTitleView(framework: framework).onTapGesture {
                            print("tapped")
                            viewModel.selectedFramework = framework
                        }
                    }
                }
            }.navigationTitle("🍎 Framework")
                .sheet(isPresented: $viewModel.isShowingDetailView){
                    FrameworkDetailsView(framework: viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView)
                }
           
        }
       
    }
}

struct FrameworkTitleView: View {
    let framework:FrameworkModel
    
    var body: some View {
        
        VStack{
            Image(framework.imageName)
                .resizable()
                .frame(width: 60, height: 60)
            Text(framework.name)
                .font(.title3)
                .fontWeight(.regular)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }.padding()
    }
}

#Preview {
    FrameworkGridView()
}
