//
//  ContentView.swift
//  study1
//
//  Created by 김민석 on 2021/02/25.
//

import SwiftUI

struct ContentView: View {
    
    // @State 값의 변화를 감지하도록 선언 그리고 View Re랜더링
    @State
    private var isActivated: Bool = false;
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                }
                .padding(isActivated ? 50.0 : 10.0)
                .background(isActivated ? Color.yellow : Color.black)
                .onTapGesture {
                    print("Hi~!")
                    
                    // 애니메이션 효과를 추가한다.
                    withAnimation {
                        self.isActivated.toggle()
                    }
                } // HStack end
                
                // Navigation Button
                NavigationLink(
                    destination: MyTextView(isActivated: $isActivated),
                    label: {
                        Text("네비게이션")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(10.0)
                            .background(Color.yellow)
                            .foregroundColor(.white)
                            .cornerRadius(30.0)
                    })
                    .padding(.top, 10)
            } // NavigationView end
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            ContentView()
        }
    }
}
