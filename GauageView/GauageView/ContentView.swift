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
    @State var angle = 90
    var body: some View {
        
        ZStack(alignment: .center) {
            ZStack {
                Circle()
                    .trim(from: 0.499, to: 1)
                .stroke(lineWidth: 22)
                ForEach(0..<segement.count, id: \.self) {
                    index in
                    Circle()
                        .trim(from: CGFloat(0.499/CGFloat(segement.count)) * CGFloat(index), to: CGFloat(0.499/CGFloat(segement.count) * CGFloat(index + 1)))
                        .stroke(segmentColor[index], lineWidth: 20)
                        .rotationEffect(.degrees(180))
                }
            }.frame(height: 300)
                // .rotationEffect(.degrees(180))
            
            
            ZStack() {
                VStack(spacing: -10) {
                    Triangle()
                                .foregroundColor(.black)
                                .frame(width: 20, height: 100)
                                .padding(.top, 40)
                                .rotationEffect(.degrees(Double(angle)), anchor: .bottom)
                            .animation(.easeInOut(duration: 1), value: angle)
                    ZStack(alignment: .center) {
                        Circle()
                            .foregroundStyle(Color.black)
                           // .padding(.vertical, 58.0)
                            .frame(width: 20)
                        Circle()
                            .foregroundStyle(Color.white)
                            .frame(width: 4)
                    }//.frame(width: 20, height: 30)
                   // .padding(.bottom, -50)
                        
                    Spacer()
                }
                
//                VStack {
//                    Spacer()
//                    
//                    
//                }.frame(width: 20, height: 100)
                
             
               
                Spacer()
            }.frame(height: 300)

            //Spacer()
                //.rotationEffect(.degrees(90))
           //Circle()
                
            
            
        }
        .frame(height: 300)
        .padding()
        .onAppear(perform: {
            withAnimation(.easeOut, {
                angle = -20
            })
            //anima
           // angle = -90
        })
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
    ContentView()
}



