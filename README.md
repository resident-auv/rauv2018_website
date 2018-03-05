# Resident AUV Workshop 2018

This site is written in [Hugo](https://gohugo.io).   To build the website, first [install Hugo](https://gohugo.io/getting-started/installing/).

Then:

    git clone https://github.com/resident-auv/rauv2018_website.git
    cd rauv2018_website
    make serve

The [Makefile](Makefile) contains a two rules (which are really simple, you could just copy-paste them yourself --- but be sure to run the `git submodule` command once!):

  - `make serve` will run Hugo in server mode,
    allowing you to preview the website on your own computer

  - `make ovid` will push the website to the UW web hosting system.   You must have permission to access the `rauv` web hosting account.  You won't be able to push if there are any pending changes which haven't been commited to Git.
    The resulting website will be at [https://depts.washington.edu/rauv/](https://depts.washington.edu/rauv/)

If you aren't comfortable publishing the website or you don't have permission, please use a [pull request!](https://help.github.com/articles/about-pull-requests/)

__We could host this site anywhere!  UW Web Hosting is just a good starting place.__

## Organization

All of the website content is written in [Markdown](https://daringfireball.net/projects/markdown/).  The organization is more-or-less hierarchical:

- Pages appear in `content/`.
- Subdirectories of `content/` become tabs at the top of the web page.
- An `_index.html` file a  "front page".  So `content/logistics/_index.html` is the page you get when you click on "Logistics".
- `content/_index.html` is the front page for the web site.

## Branches

The `master` branch in Git is the "real" website.

The `next` branch is the _next_ version of the website for drafting new content, etc.   If you `make ovid` is will publish to [https://depts.washington.edu/rauv/next/](https://depts.washington.edu/rauv/next/).   This site is _only available to people with a UW NetID_  (and we could make it even more restrictive....)


<!-- ## [Projects Folder](projects) -->
