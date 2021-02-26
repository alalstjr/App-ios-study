//
//  MyTextView.swift
//  study1
//
//  Created by 김민석 on 2021/02/26.
//

import SwiftUI

struct MyTextView: View {
    
    @State
    private var index : Int = 0
    
    @Binding
    var isActivated : Bool

    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    // 배경색 배열 준비
    private let backgroundColor = [
        Color.red,
        Color.blue,
        Color.yellow,
        Color.gray
    ]
    
    var defalutText : String = "Link Move Hello!"
    var activeText  : String = "Active!"
    
    var body: some View {
        VStack {
            Text("\(self.defalutText) \(self.isActivated ? self.activeText : "") \(self.index)")
                .font(.system(size: 20))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
        .background(self.backgroundColor[index])
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            withAnimation {
                if(self.index == self.backgroundColor.count - 1) {
                    self.index = 0
                } else {
                    self.index += 1
                }
            }
        }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
