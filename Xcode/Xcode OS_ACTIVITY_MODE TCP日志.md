更新了Xcode8之后的小伙伴们，在控制台已经看到了OS_ACTIVITY_MODE log.有点乱且对于程序调试不是很便捷。
2016-09-14 23:37:22.522261 TestXcode8[6606:870004] subsystem: com.apple.UIKit, category: HIDEventFiltered, enable_level: 0, persist_level: 0, default_ttl: 0, info_ttl: 0, debug_ttl: 0, generate_symptoms: 0, enable_oversize: 1, privacy_setting: 2, enable_private_data: 0
2016-09-14 23:37:22.525813 TestXcode8[6606:870004] subsystem: com.apple.UIKit, category: HIDEventIncoming, enable_level: 0, persist_level: 0, default_ttl: 0, info_ttl: 0, debug_ttl: 0, generate_symptoms: 0, enable_oversize: 1, privacy_setting: 2, enable_private_data: 0
2016-09-14 23:37:22.538153 TestXcode8[6606:869999] subsystem: com.apple.BaseBoard, category: MachPort, enable_level: 1, persist_level: 0, default_ttl: 0, info_ttl: 0, debug_ttl: 0, generate_symptoms: 0, enable_oversize: 0, privacy_setting: 0, enable_private_data: 0
2016-09-14 23:37:22.559243 TestXcode8[6606:869878] subsystem: com.apple.UIKit, category: StatusBar, enable_level: 0, persist_level: 0, default_ttl: 0, info_ttl: 0, debug_ttl: 0, generate_symptoms: 0, enable_oversize: 1, privacy_setting: 2, enable_private_data: 0

Xcode8里边 Edit Scheme-> Run -> Arguments, 在Environment Variables里边添加
OS_ACTIVITY_MODE ＝ Disable

记住要勾选起来