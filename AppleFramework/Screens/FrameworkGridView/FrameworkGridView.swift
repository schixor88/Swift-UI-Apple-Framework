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
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: viewModel.columns){
                    ForEach(MockData.frameworks, id: \.id){
                        framework in
                        NavigationLink(value: framework){
                            FrameworkTitleView(framework: framework)
                        }
                    }
                }
            }.navigationTitle("🍎 Framework")
                .navigationDestination(for: FrameworkModel.self){
                    framework in
                    FrameworkDetailsView(framework: framework)
                }
            
//                .sheet(isPresented: $viewModel.isShowingDetailView){
//                    FrameworkDetailsView(framework: viewModel.selectedFramework!, isShowingDetailView: $viewModel.isShowingDetailView)
//                }
           
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
