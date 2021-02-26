---------------------------
# iOS 어플리케이션 제작 공부 노트
---------------------------

# 목차

- [1. iOS 내부에는 어떠한 것들이 들어 있을까?](#iOS-내부에는-어떠한-것들이-들어-있을까?)
    - [1-1. Core OS](#Core-OS)
    - [1-2. Core Services](#Core-Services)
    - [1-3. Media](#Media)
    - [1-3. Cocoa Touch](#Cocoa-Touch)

# iOS 내부에는 어떠한 것들이 들어 있을까?

우리는 그동안 iOS 를 사용해 왔습니다.  
그렇다면 그 안에는 어떤 프로그래밍 API[기본적으로 IOS 앱이 동작하도록 우리가 사용하는 함수나 메소드, 클래스 같은 프로그래밍 인터페이스]  
정말 많은 것들이 존재하지만 **4개의 계층**으로 정리해 보겠습니다.

## Core OS

- Core OS
    - OSX Kernel
    - Power Management
    - Mach 3.0
    - Keychain Access
    - BSD
    - Certificates
    - Sockets
    - File System
    - Security
    - Bonjour

`Core OS 는 하드웨어에 가깝습니다.`  
아이폰은 `UNIX` 에서 작동합니다.  
`UNIX` 는 Multitasking, INIX 파일시스템 같은 모든 것들을 가지고 있습니다.  
그리고 iOS 앱을 빌드할 때 큰 도움이 됩니다.

`UNIX` 계층에는 모바일 기기에 특화된 것들이 있습니다.  
[중요한 전원 관리 Power Management, 접근을 제어하는 KeyChain Access] 등등이 있습니다.

## Core Services

- Core Services
    - Collections
    - Core Location
    - Address Book
    - Net Services
    - Networking
    - Threading
    - File Access
    - Perferences
    - SQLite
    - URL Utilities

우리는 가급적으로 객체지향 프로그래밍을 하길 바라지만  
UNIX 위에는 객체지향언어로 작성된 계층이 있습니다.

[Networking, MultiThread, Preferences, 데이터베이스에 쓰이는 SQL 같은 것들을 쓸 수 있게 해줍니다.]  
객체지향 API를 사용해서 이러한 것들을 사용할 수 있습니다.  
그래서 이건 Core Services 에 있는 객체지향 계층의 일종입니다.

`Core Services` 계층은 UI와 상관없이 `베이스가 되는 계층`이라 생각하면 됩니다.

## Media

- Media
    - Core Audio
    - JPEG, PNG, TIFF
    - OpenAL
    - PDF
    - Audio Mixing
    - Quartz (2D)
    - Audio Recording
    - Core Animation
    - Video Playback
    - OpenGL ES

Media 계층은 [비디오, 모든 종류의 오디오 프레임워크, 2D 로 된 그림을 그리기 위한 Quartz API, 3D OpenGL] 등등을 담고 있습니다.

## Cocoa Touch

- Cocoa Touch
    - Multi-Touch
    - Alerts
    - Core Motion
    - Web View
    - View Hierarchy
    - Map Kit
    - Localization
    - Image Picker
    - Controls
    - Camera

사용자에 가까우며 `UI 를 만들기 위한 객체지향 API`  
UI 는 화면에 보이는 Button 이나 Slider 만 해당되는 것이 아닙니다.  
예를 들어서 휴대폰을 흔들면 어떤 기능이 동작하게 하는지  
또는 휴대폰의 가로, 세로 방향을 사용하는 것들을 말합니다.

# MVC 모델

MVC 는 Model-View-Controller 의 약자  
객체지향 앱에 있는 모든 클래스를 [Model 그룹, View 그룹, Controller 그룹] 나눈것 입니다.
 
- Model
    - 우리의 프로그램이 하는 일 자체를 의미합니다.
    - UI 와는 독립적이며 상관이 없습니다.
    - 계산기 프로그램에서 Model 은 모든 계산을 처리하는 영역입니다.
- View
    - 사용자와 상호작용하는 User Interface 입니다.
    - 계산기의 경우 버튼이나 디스플레이같은 것들이 해당됩니다.
- Controller
    - Model 과 View 를 연결하는 역할을 합니다.
    - UI 에서 무슨일이 일어나는지 확인 후 Model 을 업데이트 합니다.

# @State

변화를 감지

# @Binding

데이터 전달

> MyVstackView

~~~
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
                .fontWeight(.bold)
                .font(.system(size: 60))
            Text("2")
                .fontWeight(.bold)
                .font(.system(size: 60))
            Text("3")
                .fontWeight(.bold)
                .font(.system(size: 60))
        }
        .background(self.isActivated ? Color.red : Color.green)
    }
}

...
~~~

isActivated 변수를 Bool형 public 으로 선언합니다.  
public 으로 선언한 이유는 데이터를 전달하기 위해 외부에서 접근해야 하기 때문입니다.

@Binding 을 사용하려면 기본 생성자를 생성해야 합니다.  
.constant(true) 로 기본값을 false 로 설정합니다.

만약 MyVstackView(true) true 값이 들어온다면 생성자의 값이 true 로 변경되면서  
background 값이 변경됩니다.

> ContentView

~~~
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
                ...
        }
    }
}
~~~

# Swift 문서

[기본 문서](https://docs.swift.org/swift-book/index.html)  
[Swift 변경 사항 정리-docs](https://docs.swift.org/swift-book/RevisionHistory/RevisionHistory.html)
[Swift 변경 사항 정리-git](https://github.com/apple/swift-evolution)
[raywenderlich.com의 Swift 스타일 가이드](https://github.com/swift-kr/swift-style-guide-raywenderlich/blob/master/ko_style_guide.md)
[참고 유튜브 영상주소](https://www.youtube.com/watch?v=R8OWOgCNt4M)
[참고 유튜브 영상주소](https://www.youtube.com/watch?v=LiWtjXLlhYw&list=PLgOlaPUIbynqyJHiTEv7CFaXd8g5jtogT)
[참고 유튜브 영상주소](https://www.youtube.com/watch?v=OhOPVKxKvP0)

# 참고

SwiftUI 튜토리얼 1편 — 기본구조
https://medium.com/harrythegreat/swiftui-튜토리얼-1편-기본구조-11e7b589e6de