//
//  ContentView.swift
//  GauageView
//
//  Created by Sushanth on 10/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var segement = ["Very Low","Low", "Medium", "High"]
    @State var segmentColor = [Color.green, Color.gray, Color.yellow, Color.blue]
    var start = 0.0
    var end = 0.5
    
    var body: some View {
        
        ZStack {
            Circle()
                .trim(from: 0.499, to: 1)
                .stroke(lineWidth: 22)
                // .rotationEffect(.degrees(180))
            
            ForEach(0..<segement.count, id: \.self) {
                index in
               // self.start = self.end
                //end = 0.5/(segement.count - index)
                Circle()
                    .trim(from: CGFloat(0.499/CGFloat(segement.count)) * CGFloat(index), to: CGFloat(0.499/CGFloat(segement.count) * CGFloat(index + 1)))
                    .stroke(segmentColor[index], lineWidth: 20)
                    .rotationEffect(.degrees(180))
                    
                
            }
           
           //Circle()
                
            
            
        }
        .padding()
    }
    
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            }
        }
    }
    
}

#Preview {
    NeedleView()
}

