//
//  ContentView.swift
//  testepecas4
//
//  Created by user on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var shouldRotateText: Bool {
            // Determine se o texto deve ser rotacionado com base na orientação da ZStack
            return abs(angle.degrees) > 45
        }
    
    var body: some View {
        ZStack {
            
            VStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
//                    .cornerRadius(15)
                    .overlay(
                        Text("3+3")
                            .font(.title2)
                            .foregroundColor(Color.black)
                            .rotationEffect(Angle(degrees: angle.degrees), anchor: .center)
                    )
                
                
//
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
//                    .cornerRadius(15)
                    .overlay(
                        Text("3+3")
                            .font(.title2)
                            .foregroundColor(Color.black)
                            .rotationEffect(Angle(degrees: angle.degrees), anchor: .center)
                    )
            }
            

        }
        .background(Color.black)
        .cornerRadius(15)//
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 5)
        )
        .rotationEffect(angle) // Aplicar rotação à ZStack que contém ambos os retângulos
                .gesture(
                    RotationGesture()
                        .onChanged { value in
                            angle = value
                            
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                angle = Angle(degrees: 0)
                            }
                            
                        }
                )
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
