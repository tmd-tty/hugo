---
title: "Hugoのアップデート(0.97->0.123)"
date: 2024-03-06T16:58:21+09:00
showtoc: true
draft: false
categories:
tags: 
---

2年くらい放置していたのでまずはアップデートしてみる。

## アップデート前

```shell
$ hugo version
hugo v0.97.3+extended linux/amd64 BuildDate=unknown
```

## アップデート

```shell
$ brew upgrade hugo
```

## アップデート後

```
$ hugo version
hugo v0.123.7-312735366b20d64bd61bff8627f593749f86c964+extended linux/amd64 BuildDate=2024-03-01T16:16:06Z VendorInfo=brew
```

サーバー起動してみたら画面が崩れてた。  
デバッグしてみるとどうやら`config.yaml`の`canonifyurls: true`が原因っぽい。
[公式](https://gohugo.io/content-management/urls/#canonical-urls)によると、

>This is a legacy configuration option, superseded by template functions and Markdown render hooks, and will likely be removed in a future release.

とのことなのでとりあえず削除してOKそう。

## ちなみに
`config.yaml`は`hugo.yaml`になっていそうだったのでついでに修正。
