//
//  ContentView.swift
//  IPLocations
//
//  Created by Nishk Balsara on 2023-01-15.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
//the stacks used here are ZStack and Vstack through which we are able to achieve this overlayed style view
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.location)
                .ignoresSafeArea()
            Circle()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.blue.opacity(0.20))
            
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    Text("**IP**: \(vm.ipAddress)")
                    Text("\(vm.ipGeo.city), \(vm.ipGeo.country)")
                }
                .padding()
                .frame(width: 330)
                .background(.thickMaterial)
                .cornerRadius(10)
                .padding(.vertical, 50)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
