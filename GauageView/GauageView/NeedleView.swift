//
//  NeedleView.swift
//  GauageView
//
//  Created by Sushanth on 10/08/24.
//

import SwiftUI

struct NeedleView: View {
    var body: some View {
        ZStack() {
            Triangle()
                        .foregroundColor(.black)
                        .frame(width: 70, height: 130)
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .foregroundStyle(Color.black)
                    Circle()
                        .foregroundStyle(Color.white)
                        .frame(width: 20)
                }.frame(width: 68.7)
                
            }.frame(width: 70)
            
         
           
          //  Spacer()
        }.frame(width: 70, height: 200)
    }
    
    
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

#Preview {
    NeedleView()
}
