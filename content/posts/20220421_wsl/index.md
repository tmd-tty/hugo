---
title: "wslのインストール、アンインストール"
date: 2022-04-21T10:02:00+09:00
draft: false
categories:
- tech
tags: 
- windows
---

## 環境
Microsoft Windows [Version 10.0.19043.1645]

## 事前準備

BIOSメニューにて、SVM Modeを有効にする。

## インストール
管理者で以下を実行。
```
wsl --install
```
完了後再起動。

## 確認
```
wsl --status
```

## アップデート
管理者で以下を実行
```
wsl --update
```

## アンインストール
+ 設定 > アプリと機能 > `Windows Subsystem for Linux`をアンインストール
+ コントロールパネル > プログラム > プログラムと機能 > Windowsの機能の有効化または無効化 > 「Linux用Windowsサブシステム」のチェックを外す