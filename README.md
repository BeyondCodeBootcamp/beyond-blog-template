# Beyond Theme (for Markdown Blogs)

Intentional Markdown blog template - Lightweight, yet Sophisticated.

# Build a Blog using Markdown and Bash

[![](https://user-images.githubusercontent.com/122831/113492733-e735cc80-9496-11eb-8787-43fee2671891.jpg)](https://www.youtube.com/watch?v=LlYrvZuIYUQ&list=PLxki0D-ilnqZfyo2dZe11ZNGP7RJxJcoA&index=11&rel=0)

## How to Use Beyond Theme

1. Download both stylesheets:

   ```bash
   curl -LO https://raw.githubusercontent.com/BeyondCodeBootcamp/beyond-blog-template/main/assets/github-markdown.css

   curl -LO https://raw.githubusercontent.com/BeyondCodeBootcamp/beyond-blog-template/main/assets/beyond-theme.css
   ```

2. Include them in the `<head>` of your html:

   ```html
   <link rel="stylesheet" href="/assets/github-markdown.css" />
   <link rel="stylesheet" href="/assets/beyond-theme.css" />
   ```

Example:

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Beyond Code Styles -->
    <link rel="stylesheet" href="/assets/github-markdown.css" />
    <link rel="stylesheet" href="/assets/beyond-theme.css" />
  </head>
  <body>
    <!-- more content -->
  </body>
</html>
```

## How to use the Beyond Markdown Article

Inside of your `<body>` create an `<article class="markdown-body">` with the rendered Markdown output.

```html
<article class="markdown-body">
  <!-- Place rendered markdown content here. Example: -->
  <p>Hello</p>
  <ol>
    <li>One</li>
    <li>Two</li>
    <li>Three</li>
  </ol>
</article>
```

## How to use the Beyond Header

Create a `<nav class="beyond-nav">` with a single `<a href="/">` link to the homepage, and a `<ul>` containing all other links.

```html
<nav class="beyond-nav">
  <a href="/">
    <span style="font-weight: bold">Beyond</span>
    <span style="font-weight: lighter">Code</span>
  </a>
  <ul>
    <li><a href="/">Blog</a></li>
    <li><a href="/contact.html">Contact</a></li>
  </ul>
</nav>
```

## How to use the Beyond Footer

Create a `<footer class="beyond-footer">` and all elements inside of it will be spaced evenly.

```html
<footer class="beyond-footer">
  © 2021
  <center>&#x2665;</center>
  AJ ONeal
</footer>
```

# How to Build a Beyond Markdown Blog

```bash
curl -sS https://webinstall.dev | bash

webi sd comrak

bash build.sh
```

# Credit

- @sindresorhus for [github-markdown.css](https://github.com/sindresorhus/github-markdown-css) (MIT License)
- @uniqname for beyond-theme.css
