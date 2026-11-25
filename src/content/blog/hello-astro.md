---
title: 为什么我用 Astro 重写了博客
description: 从 Nuxt 到 Astro，不只是换了一个框架，而是重新思考「博客到底是什么」。
pubDate: '2026-08-12'
heroImage: '../../assets/covers/tech.webp'
category: 技术
tags: [Astro, 静态站点, 重构]
featured: true
---

博客的本质是内容。它不需要复杂的前端状态，也不必为了「像应用」而付出额外的加载成本。基于这个判断，我把博客迁移到了 Astro。

## 为什么要换

旧博客用起来没有问题，但每次打开一篇文章，浏览器都要下载并激活一整套前端运行时。对我来说，这有点本末倒置：读者只想看文字，却先为 JavaScript 买了单。

Astro 的默认策略是「零运行时」。组件在构建时渲染成静态 HTML，只有确实需要交互的地方才下发脚本。这正好符合博客的使用场景。

## Astro 带来了什么

### 内容优先

`src/content/blog` 里的 Markdown 通过 content collections 统一管理。frontmatter 有 schema 校验，写错字段会在构建时直接报错，而不是等到线上才发现页面空白。

```astro
---
import { getCollection } from 'astro:content';

const posts = await getCollection('blog');
---

<ul>
  {posts.map((post) => <li>{post.data.title}</li>)}
</ul>
```

### 更少的客户端代码

首页的筛选、排序、主题切换和搜索都只用了少量原生脚本。没有大型框架 hydration，页面在弱网环境下也能很快可读。

### 灵活的组件边界

需要复杂交互时，Astro 也允许局部引入其他框架的组件。但到目前为止，原生脚本已经足够。

## 界面从哪里来

这版的视觉结构借鉴了 [blog-v3](https://github.com/z2004y/blog-v3)：左侧固定导航、中间内容、右侧小组件，配合浅色/深色主题和卡片式文章列表。我没有复制它的代码，而是用 Astro 组件和设计变量重新实现了一遍。

## 下一步

接下来会继续完善归档、标签和阅读进度，把常用操作做顺手，而不是一味堆功能。如果你也在折腾博客，希望这些记录能给你一点参考。
