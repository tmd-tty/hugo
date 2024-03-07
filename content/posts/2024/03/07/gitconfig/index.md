---
title: "Gitconfig"
date: 2024-03-07T13:54:36+09:00
showtoc: true
draft: false
categories:
tags: 
---


## 基本

| priority | location         | file                | 
| :------: | ---------------- | ------------------- | 
| 1        | local(--local)   | {repo}/.git/config  | 
| 2        | global(--global) | ~\.gitconfig        | 
| 3        | system(--system) | (wsl)/etc/gitconfig | 

### 設定確認

```shell
$ git config --list
```

### 設定変更

```shell
$ git config {location} {property} {value}
```

## プロパティ

### ガイド

```shell
$ man git-config
```

### 例

```shell
$ git config --global core.editor vim
```
