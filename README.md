# 知一 · Zhiyi Blog

<p align="center">
  <img src="public/avatar.jpg" alt="知一 Logo" width="96" height="96" style="border-radius: 50%; box-shadow: 0 4px 20px rgba(0,0,0,0.15);" />
</p>

<p align="center">
  <strong>在数字噪点中构筑一方留白。专注于界面美学、极致排版与纯粹阅读体验的个人博客。</strong>
</p>

<p align="center">
  <a href="https://blog.660881.xyz" target="_blank">🌐 在线预览 (blog.660881.xyz)</a> ·
  <a href="#-一键部署到-cloudflare-pages">⚡ 部署教程</a> ·
  <a href="#-特性亮点">✨ 特性介绍</a> ·
  <a href="#-快速开始">🚀 快速开始</a>
</p>

<p align="center">
  <a href="https://deploy.workers.cloudflare.com/?url=https://github.com/z2004y/zhiyi">
    <img src="https://deploy.workers.cloudflare.com/button" alt="Deploy to Cloudflare Pages" />
  </a>
</p>

---

## ✨ 特性亮点

- 📖 **双模式排版切换**：支持「现代黑体排版」与「经典书页衬线排版（Georgia + 宋体）」一键切换，具备舒适的两端对齐与书页行高，偏好自动持久化。
- 📱 **极致移动端体验**：手机端目录抽屉层级深度调优，上滑唤出悬浮胶囊顶栏（`.post-top-bar`），随时呼出导航与章节目录，平滑避让防遮挡。
- 🎨 **三态色彩系统**：浅色 / 深色 / 跟随系统主题无缝切换，基于 CSS 变量精确控制微对比度，纯粹毛玻璃质感，刷新防闪白。
- ⚡ **纯 Astro 静态架构**：零重型框架客户端运行时负担，极致轻量，全球 CDN 节点毫秒级首屏直出。
- 🔍 **全局即时搜索**：原生支持 `Ctrl / Cmd + K` 唤出聚焦搜索弹窗，无需外部第三方检索服务，支持键盘上下键无缝选择。
- 🖼️ **富媒体阅读增强**：代码块带语言标签、行号、一键复制；图片 Medium 风格平滑放大；Callout 提示框；KaTeX 数学公式渲染。
- 🧭 **完善的内容生态**：文章目录高亮跟踪、字数与阅读时长预估、标签墙、时间轴归档、交互式友链卡片及申请模板。
- 📡 **自动化标准化输出**：自动生成符合规范的 RSS 订阅源（带美化样式表）与 Sitemap 索引。

---

## ⚡ 一键部署到 Cloudflare Pages

本项目为标准 Astro 静态站点，完美契合 **Cloudflare Pages** 的全球边缘分发网络。推荐使用以下方式部署：

### 方案一：Git 仓库自动集成（推荐，全自动 CI/CD）

这是最省心的方式，只需在 GitHub 提交代码，Cloudflare 会自动在全球数百个边缘节点拉取、构建并发布：

1. **准备仓库**：
   - Fork 本仓库或将代码推送到你的 GitHub 账户：`https://github.com/z2004y/zhiyi`。

2. **连接 Cloudflare Pages**：
   - 登录 [Cloudflare 控制台 (Dashboard)](https://dash.cloudflare.com/)。
   - 在左侧导航栏点击 **Workers 和 Pages (Workers & Pages)**。
   - 点击 **创建应用程序 (Create application)** -> 选择 **Pages** 选项卡 -> 点击 **连接到 Git (Connect to Git)**。
   - 授权 GitHub 并选中你的 `zhiyi` 仓库，点击 **开始设置 (Begin setup)**。

3. **配置构建参数**：
   - **项目名称 (Project name)**：`zhiyi`（或自定义）
   - **生产分支 (Production branch)**：`main`
   - **框架预设 (Framework preset)**：选择 `Astro`
   - **构建命令 (Build command)**：`npm run build`
   - **构建输出目录 (Build output directory)**：`dist`
   - **环境变量 (Environment variables)**（展开高级设置）：
     - 添加变量名：`NODE_VERSION`，值填入：`20`

4. **完成部署**：
   - 点击 **保存并部署 (Save and Deploy)**。
   - Cloudflare 将自动执行依赖安装与静态编译，约 30~60 秒后即可获得类似 `https://zhiyi.pages.dev` 的全球访问网址。

5. **绑定自定义域名（如 `blog.660881.xyz`）**：
   - 部署完成后，在项目详情页点击 **自定义域 (Custom domains)** 标签。
   - 点击 **设置自定义域 (Set up a custom domain)**，输入你的独立域名 `blog.660881.xyz`。
   - 如果你的域名也在 Cloudflare 解析，系统会自动添加 CNAME 记录并自动签发免费的 SSL/TLS 证书；如果域名在外部 DNS，按提示添加一条 CNAME 记录指向你的 `pages.dev` 地址即可。

---

### 方案二：使用 Wrangler CLI 命令行部署

如果你习惯本地构建或想要快速推送发布：

1. 安装 Cloudflare CLI 工具：
   ```bash
   npm install -g wrangler
   ```

2. 登录 Cloudflare 账号：
   ```bash
   npx wrangler login
   ```

3. 本地构建并一键推送到 Pages：
   ```bash
   # 1. 编译站点
   npm run build

   # 2. 直推发布
   npx wrangler pages deploy dist --project-name=zhiyi
   ```

---

## 🚀 本地开发与预览

### 环境要求

- [Node.js](https://nodejs.org/) v18.14.1 或更高版本（推荐 Node 20+）
- 包管理器：`npm` / `pnpm` / `yarn`

### 安装与运行

```bash
# 1. 克隆代码仓库
git clone https://github.com/z2004y/zhiyi.git
cd zhiyi

# 2. 安装依赖
npm install

# 3. 启动本地开发服务器
npm run dev
```

启动后在浏览器访问 `http://localhost:4321` 即可体验。

### 编译构建

```bash
# 执行生产环境静态导出
npm run build

# 本地预览编译后的 dist 输出
npm run preview
```

---

## 🛠️ 站点配置与个性化

大部分个人设置均收拢在清晰的配置文件中，无需翻找繁杂的代码：

| 配置内容 | 文件位置 | 说明 |
| :--- | :--- | :--- |
| **站点基本信息** | [src/consts.ts](src/consts.ts) | 博客标题 `SITE_TITLE`、简介、个人联系方式（邮箱/Github/Linux.do） |
| **站点域名** | [astro.config.mjs](astro.config.mjs) & [src/consts.ts](src/consts.ts) | 当前已配置为 `https://blog.660881.xyz` |
| **分类定义与色彩** | [src/consts.ts](src/consts.ts) | `CATEGORIES` 数组，可自定义分类名称及其专属强调色 |
| **友链列表** | [src/consts.ts](src/consts.ts) | `FRIEND_LINKS` 数组，包含朋友博客的卡片信息与分类 |
| **全站全局样式** | [src/styles/global.css](src/styles/global.css) | 颜色 Token、字体、排版规则、响应式微调 |
| **头像与 Logo** | [public/avatar.jpg](public/avatar.jpg) | 博客头像、网站 Favicon 图标文件 |

---

## 📝 编写与发布文章

所有文章内容以 Markdown 或 MDX 格式保存在 `src/content/blog/` 目录下。

新建文件示例 `src/content/blog/my-first-post.md`：

```markdown
---
title: "我的第一篇博客文章"
description: "写下一段文字，记录今天的思考与技术沉淀。"
pubDate: 2026-11-26
heroImage: "../../assets/covers/reading.webp"
category: "技术"
tags: ["Astro", "前端"]
featured: true
---

这里是正文开始的地方...

## 一级小节

支持完整的 Markdown 扩展排版与代码高亮。
```

- `category`：请使用 `src/consts.ts` 中定义的分类（如 `技术`、`开发`、`生活`、`杂谈`）。
- `featured: true`：标记为精选文章，会自动展示在首页顶部的精选轮播与推荐位中。

---

## 📄 开源许可证

本项目基于 [MIT License](LICENSE) 开源。欢迎 Star、Fork 并打造属于你的个人知识花园！
