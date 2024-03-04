---
title: "Hugoでmermeaidを表示する"
date: 2022-05-02T11:33:20+09:00
draft: false
showtoc: true
categories:
- tech
tags: 
- hugo
- mermaid
---

Hugoでmermaidを表示したかったので、導入時のメモ。

## 環境

```shell
$ hugo version
hugo v0.97.3+extended linux/amd64 BuildDate=unknown
```
## render-codeblock-mermaid.html,　extend_footer.htmlを作成

+ `\layouts\_default\_markup\render-codeblock-mermaid.html`を作成。
+ `/layouts/partials/extend_footer.html`を作成。

### 参考

<iframe class="hatenablogcard" style="width:100%;height:155px;margin:15px 0;max-width:680px;" title="Diagrams | Hugo" src="https://hatenablog-parts.com/embed?url=https://gohugo.io/content-management/diagrams/#mermaid-diagrams" frameborder="0" scrolling="no"></iframe>

## 問題点
このサイトでは、PaperModテーマを使っているが、`layouts/_default/baseof.html`のフッター定義が以下になっている。

```html
{{ partialCached "footer.html" . .Layout .Kind (.Param "hideFooter") (.Param "ShowCodeCopyButtons") -}}

```

partialCachedでpartialが定義されていると、同じlayoutを利用している場合にフッターが再レンダリングされず、`{{ if .Store.Get "hasMermaid" }}`で、mermaidのコードブロックでsetした値が取得できないと思われる。

性能影響は不明だけど、一旦次のように条件分岐を削除しておいた。


### extend_footer.html

```html
<script type="module">
  import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.esm.min.mjs';
  mermaid.initialize({ startOnLoad: true });
</script>
```


### render-codeblock-mermaid.html

```html
<pre class="mermaid">
  {{- .Inner | safeHTML }}
</pre>
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