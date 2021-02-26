//
//  MyVstackView.swift
//  study1
//
//  Created by 김민석 on 2021/02/25.
//

import SwiftUI

struct MyVstackView: View {
    
    @Binding
    var isActivated : Bool

    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    var body: some View {
        VStack {
            Text("1")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 60))
            Text("2")
                .fontWeight(.bold)
                .font(.system(size: 60))
            Text("3")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 60))
        }
        .background(self.isActivated ? Color.red : Color.green)
    }
}
struct MyVstackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView()
    }
}
