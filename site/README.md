# Campfyre Content Guide

This repo contains the Campfyre site content. Use this guide to add or update
pages.

## Where content lives

- Main English content: [content/en](content/en)
- Other locales (examples in this repo):
  - [content/fa](content/fa)
  - [content/no](content/no)

Most pages are Markdown files. Some sections use folders with an `_index.md` to
define a section landing page.

## Common tasks

### Edit an existing page

1. Find the file under [content/en](content/en).
2. Open the `.md` file and edit the text.
3. Save the file.

### Add a new page

1. Choose the section folder (for example, [content/en/docs](content/en/docs)).
2. Create a new `.md` file with a short, descriptive name.
3. Add a title and content. A minimal example:

Title: Use the page title as the first heading in the file.

### Add a new section

1. Create a new folder under the locale (for example,
   [content/en/community](content/en/community)).
2. Add an `_index.md` file in that folder.
3. Add child pages as `.md` files alongside `_index.md`.

## Tips

- Keep filenames lowercase and use hyphens for spaces.
- Reuse existing sections as templates for structure and front matter.
- If you are translating content, mirror the folder structure across locales.

## Need to find things quickly?

- Docs overview: [content/en/docs/\_index.md](content/en/docs/_index.md)
- Blog posts: [content/en/blog](content/en/blog)
- About page: [content/en/about/index.md](content/en/about/index.md)

---

Campfyre content is designed to be edited directly in Markdown. If something
looks unfamiliar, search for a similar page and follow its structure.
