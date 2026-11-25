<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="zh-CN">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="/rss/channel/title"/> · RSS 订阅源预览</title>
        <style>
          :root {
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-sub: #475569;
            --text-muted: #94a3b8;
            --primary: #3b82f6;
            --primary-bg: #eff6ff;
            --border: #e2e8f0;
            --radius: 14px;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "PingFang SC", "Microsoft YaHei", sans-serif;
          }
          @media (prefers-color-scheme: dark) {
            :root {
              --bg: #0f1218;
              --card-bg: #171c26;
              --text-main: #f1f5f9;
              --text-sub: #94a3b8;
              --text-muted: #64748b;
              --primary: #60a5fa;
              --primary-bg: #1e293b;
              --border: #283141;
            }
          }
          * { box-sizing: border-box; margin: 0; padding: 0; }
          body {
            background-color: var(--bg);
            color: var(--text-main);
            line-height: 1.6;
            padding: 2rem 1rem;
          }
          .container {
            max-width: 760px;
            margin: 0 auto;
          }
          .notice-card {
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 1.75rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 20px -2px rgba(0,0,0,0.05);
          }
          .feed-title {
            font-size: 1.6rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
          }
          .feed-desc {
            color: var(--text-sub);
            font-size: 0.95rem;
            margin-bottom: 1.25rem;
          }
          .feed-box {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
            align-items: center;
            background: var(--primary-bg);
            padding: 0.85rem 1.1rem;
            border-radius: 10px;
            margin-bottom: 1.25rem;
          }
          .feed-url {
            font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
            font-size: 0.88rem;
            color: var(--primary);
            word-break: break-all;
            flex: 1;
          }
          .action-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            background: var(--primary);
            color: #fff;
            border: none;
            padding: 0.45rem 1rem;
            border-radius: 8px;
            font-size: 0.88rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: opacity 0.2s;
          }
          .action-btn:hover { opacity: 0.9; }
          .guide-text {
            color: var(--text-sub);
            font-size: 0.86rem;
          }
          .readers {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-top: 0.75rem;
          }
          .reader-link {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            background: var(--bg);
            border: 1px solid var(--border);
            border-radius: 6px;
            color: var(--text-sub);
            font-size: 0.82rem;
            text-decoration: none;
            transition: all 0.2s;
          }
          .reader-link:hover {
            border-color: var(--primary);
            color: var(--primary);
          }
          .section-title {
            font-size: 1.25rem;
            font-weight: 700;
            margin: 2rem 0 1rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
          }
          .articles-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
          }
          .article-item {
            display: block;
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 1.25rem 1.5rem;
            text-decoration: none;
            color: inherit;
            transition: transform 0.2s, box-shadow 0.2s, border-color 0.2s;
          }
          .article-item:hover {
            transform: translateY(-2px);
            border-color: var(--primary);
            box-shadow: 0 6px 20px -4px rgba(0,0,0,0.06);
          }
          .article-title {
            font-size: 1.15rem;
            font-weight: 650;
            color: var(--text-main);
            margin-bottom: 0.4rem;
          }
          .article-desc {
            color: var(--text-sub);
            font-size: 0.9rem;
            line-height: 1.5;
            margin-bottom: 0.75rem;
          }
          .article-meta {
            font-size: 0.8rem;
            color: var(--text-muted);
          }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="notice-card">
            <h1 class="feed-title">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#f97316" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M4 11a9 9 0 0 1 9 9"/><path d="M4 4a16 16 0 0 1 16 16"/><circle cx="5" cy="19" r="1"/></svg>
              <xsl:value-of select="/rss/channel/title"/> · RSS 订阅源
            </h1>
            <p class="feed-desc"><xsl:value-of select="/rss/channel/description"/></p>
            
            <div class="feed-box">
              <span class="feed-url" id="feed-url">
                <xsl:choose>
                  <xsl:when test="/rss/channel/atom:link/@href">
                    <xsl:value-of select="/rss/channel/atom:link/@href"/>
                  </xsl:when>
                  <xsl:when test="/rss/channel/link">
                    <xsl:value-of select="/rss/channel/link"/>rss.xml
                  </xsl:when>
                  <xsl:otherwise>/rss.xml</xsl:otherwise>
                </xsl:choose>
              </span>
              <button class="action-btn" onclick="copyFeedUrl()">复制订阅源</button>
            </div>

            <p class="guide-text">
              这是一个标准的 RSS/Atom 订阅源，您可以将上方链接粘贴至任何 RSS 阅读器中，免除算法打扰，即时收到博客更新。
            </p>
            <div class="readers">
              <a class="reader-link" href="/" target="_self">← 返回博客首页</a>
              <a class="reader-link" href="https://follow.is" target="_blank" rel="noopener">Follow 阅读器</a>
              <a class="reader-link" href="https://feedly.com" target="_blank" rel="noopener">Feedly</a>
              <a class="reader-link" href="https://www.inoreader.com" target="_blank" rel="noopener">Inoreader</a>
            </div>
          </div>

          <div class="section-title">
            <span>最新文章预览</span>
            <small style="font-size: 0.85rem; color: var(--text-muted); font-weight: normal;">共 <xsl:value-of select="count(/rss/channel/item)"/> 篇</small>
          </div>

          <div class="articles-list">
            <xsl:for-each select="/rss/channel/item">
              <a class="article-item">
                <xsl:attribute name="href">
                  <xsl:value-of select="link"/>
                </xsl:attribute>
                <h2 class="article-title"><xsl:value-of select="title"/></h2>
                <p class="article-desc"><xsl:value-of select="description"/></p>
                <div class="article-meta">
                  发布于 <xsl:value-of select="pubDate"/>
                </div>
              </a>
            </xsl:for-each>
          </div>
        </div>

        <script>
          function syncFeedUrl() {
            var feedEl = document.getElementById('feed-url');
            if (!feedEl) return;
            var text = feedEl.textContent ? feedEl.textContent.trim() : '';
            if (!text || text === '/rss.xml' || text.indexOf('example.com') !== -1) {
              feedEl.textContent = window.location.href;
            }
          }
          if (document.readyState !== 'loading') syncFeedUrl();
          else document.addEventListener('DOMContentLoaded', syncFeedUrl);

          function copyFeedUrl() {
            var feedEl = document.getElementById('feed-url');
            var url = (feedEl &amp;&amp; feedEl.textContent.trim()) || window.location.href;
            if (navigator.clipboard &amp;&amp; navigator.clipboard.writeText) {
              navigator.clipboard.writeText(url).then(function() {
                alert('RSS 订阅地址已复制到剪贴板！\n' + url);
              }).catch(function() {
                prompt('复制此订阅地址：', url);
              });
            } else {
              prompt('复制此订阅地址：', url);
            }
          }
        </script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
