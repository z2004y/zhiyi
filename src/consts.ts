// 站点级配置：替换为自己的信息即可完成大部分个性化。
export const SITE_TITLE = '知一';
export const SITE_DESCRIPTION =
  '知行合一，保持好奇。探索技术本质，记录生活微光与设计思考。';
export const SITE_URL = 'https://blog.660881.xyz';

export const AUTHOR = {
  name: '知一',
  avatar: '/avatar.jpg',
  bio: '知行合一，专注前端开发与界面美学。保持好奇，探求事物本质。',
  location: '中国',
  email: 'hello@example.com',
  github: 'https://github.com',
  wechat: '#wechat',
  linuxdo: 'https://linux.do',
} as const;

export const ESTABLISHED_YEAR = 2026;

export type CategoryName = '技术' | '开发' | '生活' | '杂谈' | '未分类';

export interface CategoryMeta {
  color: string;
  label: CategoryName;
}

export const CATEGORIES: CategoryMeta[] = [
  { label: '技术', color: '#3b82f6' },
  { label: '开发', color: '#7c6cff' },
  { label: '生活', color: '#f27373' },
  { label: '杂谈', color: '#24b8a6' },
  { label: '未分类', color: '#94a3b8' },
];

export function categoryColor(name: string): string {
  return CATEGORIES.find((item) => item.label === name)?.color ?? '#94a3b8';
}

export const NAV_ITEMS = [
  { label: '首页', href: '/', icon: 'home' },
  { label: '文章', href: '/blog', icon: 'files' },
  { label: '标签', href: '/tags', icon: 'tag' },
  { label: '友链', href: '/links', icon: 'link' },
  { label: '归档', href: '/archive', icon: 'archive' },
  { label: '关于', href: '/about', icon: 'user' },
] as const;

export const SOCIAL_LINKS = [
  { label: 'GitHub', href: AUTHOR.github, icon: 'github' },
  { label: '邮箱', href: `mailto:${AUTHOR.email}`, icon: 'mail' },
  { label: '微信', href: AUTHOR.wechat, icon: 'wechat' },
  { label: 'L 站', href: AUTHOR.linuxdo, icon: 'linuxdo' },
  { label: 'RSS 订阅', href: '/rss.xml', icon: 'rss' },
] as const;

export interface FriendLink {
  name: string;
  url: string;
  description: string;
  group: string;
  tags: string[];
  color: string;
  avatar?: string;
}

/** 示例友链：上线前替换为真实站点信息即可。 */
export const FRIEND_LINKS: FriendLink[] = [
  {
    name: '知庐',
    url: 'https://blog.zhilu.site',
    description: '纸上得来终觉浅，绝知此事要躬行。专注沉浸阅读的个人数字花园。',
    group: '技术同好',
    tags: ['博客', '前端', '生活'],
    color: '#4f7cff',
  },
  {
    name: '栖童の小站',
    url: 'https://blog.linux-qitong.top/',
    description: '越努力，越幸运。记录技术折腾、建站与生活成长。',
    group: '技术同好',
    tags: ['Linux', '折腾', '博客'],
    color: '#06b6d4',
  },
  {
    name: '北屿笔记',
    url: 'https://example.com',
    description: '关于系统设计、开源工具与效率方法的长期笔记。',
    group: '技术同好',
    tags: ['开发', '效率'],
    color: '#7c6cff',
  },
  {
    name: '青柚日记',
    url: 'https://example.com',
    description: '写旅行、写代码，也写一些没什么用但很开心的事。',
    group: '生活记录',
    tags: ['生活', '旅行'],
    color: '#24b8a6',
  },
  {
    name: '半山书房',
    url: 'https://example.com',
    description: '读书笔记与影音清单，偶尔分享一些安静的想法。',
    group: '生活记录',
    tags: ['阅读', '影视'],
    color: '#f27373',
  },
  {
    name: 'Astro 文档',
    url: 'https://docs.astro.build/',
    description: '构建更快、内容优先网站的官方文档，遇到问题先来这里。',
    group: '推荐资源',
    tags: ['Astro', '文档'],
    color: '#bc6bff',
  },
  {
    name: 'MDN Web Docs',
    url: 'https://developer.mozilla.org/zh-CN/',
    description: 'Web 开发者必备参考，标准、示例与浏览器兼容性都很完整。',
    group: '推荐资源',
    tags: ['Web', '参考'],
    color: '#334155',
  },
];
