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

