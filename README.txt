口袋星球 1.0 · 离线电子宠物

安卓：安装 PocketPlanet-1.0.apk，Android 6.0+。内置网页游戏，不需要联网，不申请网络权限。
已验证 APK 签名与包结构。未在真机上测试。
存档位于应用私有 WebView；卸载会丢失存档，与网页存档不互通。
安卓使用本项目测试签名，签名文件位于 android/test-signing.jks；密码 android，别名 pocket。仅用于本游戏测试版更新。

iOS：此压缩包提供 Xcode 工程，并非已编译 IPA。支持 iOS 15+。
需要 Mac + Xcode，运行 bash ios/build-unsigned.sh 生成 ios/output/PocketPlanet-unsigned.ipa，再使用自己的工具签名安装。
也可将此目录内容放进自己的 GitHub 仓库，在 Actions 中手动运行 Build unsigned iOS IPA，再下载产物。
iOS 工程未在 Xcode 中编译，可能需要根据编译输出修正。
不需要把 Apple 账号、证书或证书密码提供给任何人。

玩法：摸蛋 5 次孵化；喂食、清洁、陪玩和休息增加成长；达到 45 成长值进入成长期，120 成长值进入成熟期。
喂食偏多→奶油猫；玩耍次数严格高于喂食和睡觉→星光狐；睡觉多于喂食且未满足星光狐条件→月亮枭。
当前为简易图标角色。只有一代宠物，没有重置/繁殖功能。

Android 源码编译：安装 SDK platform 35/build-tools 35.0.0 和 JDK，设置 ANDROID_SDK_ROOT 后运行 bash android/build.sh。
