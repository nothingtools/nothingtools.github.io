<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:html="http://www.w3.org/TR/REC-html40"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>XML Sitemap - Nothing Space</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <style>
          /* Global Fixes */
          * { box-sizing: border-box; }
          body { 
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; 
            line-height: 1.6; 
            color: #24292e; 
            background-color: #ffffff; 
            margin: 0; 
            padding: 20px 10px; 
          }
          .container { 
            max-width: 900px; 
            margin: 0 auto; 
            padding: 0 10px; 
          }

          /* Header and GIF */
          .hero {
            text-align: center;
            margin-bottom: 30px;
          }
          .hero h1 { 
            font-size: 2.2em; 
            margin: 10px 0; 
            font-weight: 700; 
            color: #24292e;
          }
          .hero .subtitle {
            font-size: 1.1em;
            font-weight: 600;
            color: #555;
            margin: 0 0 20px 0;
          }
          .hero img {
            max-width: 100%; 
            height: auto;
            border-radius: 12px;
            border: 1px solid #eaecef;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
          }

          /* General Text */
          p { 
            margin-top: 0; 
            margin-bottom: 16px; 
            color: #444;
            font-size: 15px;
          }
          hr { 
            height: 1px; 
            margin: 30px 0; 
            background-color: #eaecef; 
            border: 0; 
          }

          /* Table Styles */
          .table-wrapper {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            border: 1px solid #eaecef;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.02);
          }
          table { 
            border-collapse: collapse; 
            width: 100%; 
            background: #fff;
          }
          th, td {
            padding: 14px 16px;
            text-align: left;
            white-space: nowrap;
          }
          th {
            background-color: #f6f8fa;
            font-weight: 600;
            color: #24292e;
            border-bottom: 2px solid #eaecef;
            font-size: 14px;
          }
          td { 
            border-bottom: 1px solid #eaecef; 
            font-size: 14px;
          }
          tr:last-child td {
            border-bottom: none;
          }
          tr:hover td {
            background-color: #f1f8ff;
          }
          a { 
            color: #0366d6; 
            text-decoration: none; 
            font-weight: 500;
          }
          a:hover { 
            text-decoration: underline; 
          }
          .tag {
            background-color: #e1e4e8;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            color: #24292e;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="hero">
            <h1>🔴 Nothing Space Sitemap</h1>
            <p class="subtitle">Built Together for Nothing &amp; CMF Users</p>
            
            <img src="https://nothingtools.github.io/giphy.gif" alt="Sitemap Showcase" />
          </div>
          
          <hr/>
          
          <p>This is the official XML Sitemap generated for search engines. It helps Googlebot effectively crawl the Nothing Space website.</p>
          <p>Total Active Pages: <strong><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></strong></p>
          
          <div class="table-wrapper">
            <table>
              <thead>
                <tr>
                  <th>Page URL</th>
                  <th>Images</th>
                  <th>Last Modified</th>
                  <th>Frequency</th>
                  <th>Priority</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="sitemap:urlset/sitemap:url">
                  <tr>
                    <td>
                      <xsl:variable name="itemURL">
                        <xsl:value-of select="sitemap:loc"/>
                      </xsl:variable>
                      <a href="{$itemURL}" target="_blank">
                        <xsl:value-of select="sitemap:loc"/>
                      </a>
                    </td>
                    <td>
                      <span class="tag"><xsl:value-of select="count(image:image)"/> IMG</span>
                    </td>
                    <td>
                      <xsl:value-of select="sitemap:lastmod"/>
                    </td>
                    <td><xsl:value-of select="sitemap:changefreq"/></td>
                    <td><xsl:value-of select="sitemap:priority"/></td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
