//
//  ContentView.swift
//  LearingUiInCode
//
//  Created by bkulasiewicz on 12/03/2020.
//  Copyright © 2020 bkulasiewicz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var picekerSelectedItem = 0
    @State var dataPoints: [[CGFloat]] = [
        [50,100,150,30,40,12,56],
        [20,70,90,200,10,33,77],
        [10,20,39,50,14,7,45]
        
    ]
    
    var body: some View {
        
        ZStack {
       
            Color("backgroundColor").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calory Intake!")
                .font(.system(size: 34))
                .fontWeight(.heavy)
                
                
                Picker(selection: $picekerSelectedItem , label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal,24)
                
                
                HStack (spacing: 17) {
                    BarView(value: dataPoints[picekerSelectedItem][0],day: "Su")
                    BarView(value: dataPoints[picekerSelectedItem][1],day: "M")
                    BarView(value: dataPoints[picekerSelectedItem][2],day: "T")
                    BarView(value: dataPoints[picekerSelectedItem][3],day: "W")
                    BarView(value: dataPoints[picekerSelectedItem][4],day: "TH")
                    BarView(value: dataPoints[picekerSelectedItem][5],day: "F")
                    BarView(value: dataPoints[picekerSelectedItem][6],day: "Sa")
                    
               }.padding(.top, 24)
                    .animation(.default)
                
                
            }
            
        }
        
        
    }
}
struct BarView: View {
    var value: CGFloat = 0
    var day: String
    var body: some View {
        
        VStack{
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.2973814011, green: 0.9037696123, blue: 0.715687573, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text(day).padding(.top, 8)
        }
    }
}


