---
title: "Windows開発環境構築"
date: 2022-04-21T10:02:00+09:00
draft: false
showtoc: true
categories:
- tech
tags: 
- wsl
- git
- homebrew
---
## 環境
Microsoft Windows [Version 10.0.19043.1645]

## WSL2
### 事前準備
BIOSメニューにて、SVM Modeを有効にする。

### インストール
管理者で以下を実行。
```shell
> wsl --install
```
完了後再起動。

### 確認
```shell
> wsl --status
```

### アップデート
管理者で以下を実行
```shell
> wsl --update
```

### アンインストール
1. 設定 > アプリと機能 > `Windows Subsystem for Linux`をアンインストール
1. コントロールパネル > プログラム > プログラムと機能 > Windowsの機能の有効化または無効化 > 「Linux用Windowsサブシステム」のチェックを外す

### .wslconfigの設定
`%UserProfile%`に`.wslconfig`を作成して編集する。  
詳細は[こちら](https://docs.microsoft.com/ja-jp/windows/wsl/wsl-config)。
+ `localhostForwarding`: booleanで、localhost にバインドされたポートにホストから接続できるかどうかを指定する。


## aptの更新
```shell
> wsl
$ sudo apt update && sudo apt upgrade
```

## git
### gitの設定
```shell
$ git config --global user.name {name}
$ git config --global user.email {mail address}
```

### credential managerのインストール
githubの認証が面倒なので、credential managerをインストール。  
[こちら](https://github.com/microsoft/Git-Credential-Manager-for-Windows)からインストーラを落として実行。
```shell
$ git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"
```

## パッケージマネージャー
MACユーザーなので[Home brew](https://brew.sh/ja)をインストール。