import type { CollectionEntry } from 'astro:content';

/** 按中文阅读速度（约 400 字/分钟）估算阅读时长。 */
export function readingTime(post: CollectionEntry<'blog'>): number {
  const text = post.body ?? '';
  const characters = text.replace(/\s/g, '').length;
  return Math.max(1, Math.round(characters / 400));
}

/** 统计文章总字数（严格对齐 Nuxt-blog 统计逻辑） */
export function wordCount(post: CollectionEntry<'blog'>): number {
  const text = post.body ?? '';
  return text.replace(/\s/g, '').length;
}
