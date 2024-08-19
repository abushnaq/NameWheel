//
//  NameWheel.swift
//  NameWheel
//
//  Created by Ahmad Remote on 8/19/24.
//

import SwiftUI
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}


struct NameWheel: View {
    @EnvironmentObject var names : Names
    var colors : [Color] = [.pink, .purple, .primary, .secondary, .teal, .green, .gray, .brown]
    var body: some View {
        ZStack
        {
            RadialLayout
            {
                let angleToRotateBy = 360.0 / Double($names.names.count)
                ForEach(0..<$names.names.count, id: \.self) { nameIndex in
                    let name = $names.names[nameIndex]
                    ZStack
                    {
                        Triangle()
                            .fill(colors[nameIndex])
                            .background(.clear)
                            .frame(width: 130, height: 165)
                            .rotationEffect(Angle(degrees:-180.0 + Double(nameIndex) * 45.0))
                        Text(name.wrappedValue)
                            .background(.purple)
                            .rotationEffect(Angle(degrees:-90.0 + Double(nameIndex) * 45.0))
                    }
                }
            }.frame(width: 500, height: 500)
            
            Circle().stroke(.blue, lineWidth: 10.0)
                .frame(width: 100, height: 100)
        }

    }
}

#Preview {
    NameWheel()
        .environmentObject(Names())
}
