---
title: "Hugoでmermeaidを表示する"
date: 2022-05-02T11:33:20+09:00
draft: false
categories:
- tech
tags: 
- hugo
- mermaid
---

Hugoでmermaidを表示したかったので、導入時のメモ。
あんまりHugoを理解していないけどその勉強はまたいつか・・・

## 環境

```shell
$ hugo version
hugo v0.97.3+extended linux/amd64 BuildDate=unknown
```
## render-codeblock-mermaid.htmlを作成

`\layouts\_default\_markup\render-codeblock-mermaid.html`を作成。

```html
<div class="mermaid">
{{- .Inner | safeHTML }}
</div>
{{ .Page.Store.Set "hasMermaid" true }}

```

## extend_footer.htmlを作成

`/layouts/partials/extend_footer.html`を作成。

```md
{{ if .Page.Store.Get "hasMermaid" }}
  <script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>
  <script>
    mermaid.initialize({ startOnLoad: true });
  </script>
{{ end }}
```

## 結果

```md
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

## 参考
<iframe class="hatenablogcard" style="width:100%;height:155px;margin:15px 0;max-width:680px;" title="Diagrams | Hugo" src="https://hatenablog-parts.com/embed?url=https://gohugo.io/content-management/diagrams/#mermaid-diagrams" frameborder="0" scrolling="no"></iframe>