---
title: 用 CSS 变量搭一套顺手的主题系统
description: 从颜色、间距到动效，把设计决策收敛成一组可维护的 token。
pubDate: '2026-06-15'
updatedDate: '2026-08-05'
heroImage: '../../assets/covers/tokens.webp'
category: 开发
tags: [CSS, 主题, 设计系统]
featured: true
---

主题切换最难的不是「变黑」，而是让所有组件在同一套规则里变化。我的做法是先定义语义 token，组件只引用语义，不直接写色值。

## 三层结构

第一层是基础色相，第二层是语义颜色，第三层才是组件使用。

```css
:root {
  --hue-theme: 220deg;
  --c-bg: #ffffff;
  --c-text: hsl(var(--hue-theme) 24% 10%);
}

:root[data-theme='dark'] {
  --c-bg: #0f1218;
  --c-text: hsl(var(--hue-theme) 20% 98%);
}
```

组件里只需要这样写：

```css
.card {
  background: var(--c-card);
  color: var(--c-text);
  box-shadow: var(--shadow-1);
}
```

## 跟随系统与手动覆盖

`data-theme` 有三个值：`auto`、`light`、`dark`。页面加载前先用一小段内联脚本写入 `data-theme`，避免刷新时闪白。点击按钮时按顺序循环，并写入 `localStorage`。

## 把间距和动效也 token 化

颜色之外，间距、圆角、阴影和动效时长同样收敛成变量。这样调整视觉密度时，只需要改一处。

```css
:root {
  --radius-md: 16px;
  --motion-duration: 260ms;
  --ease-out: cubic-bezier(0.22, 0.7, 0.28, 1);
}

/* 完整的主题层示例 */
:root[data-theme='light'] {
  --c-bg: #ffffff;
  --c-bg-1: #f7f9fc;
  --c-text: #111827;
  --c-muted: #64748b;
  --c-border: #e2e8f0;
  --c-primary: #3b82f6;
  --c-primary-soft: rgb(59 130 246 / 12%);
}

:root[data-theme='dark'] {
  --c-bg: #0f1218;
  --c-bg-1: #13171f;
  --c-text: #f8fafc;
  --c-muted: #aab4c4;
  --c-border: #2b3340;
  --c-primary: #8ab4ff;
  --c-primary-soft: rgb(138 180 255 / 18%);
}

.card {
  padding: 1rem 1.25rem;
  border-radius: var(--radius-md);
  background: var(--c-bg);
  color: var(--c-text);
  transition: background var(--motion-duration) var(--ease-out);
}
```

## 一个小提醒

深色主题不要直接用浅色主题的透明叠加。叠加后的实际颜色受背景影响很大，最好单独检查每一组文字与背景的对比度。
