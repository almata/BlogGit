# BlogGit: KISS tool to create a notebook

## Quick instructions (TL;DR)

1. Fork a copy of [this repository](https://github.com/almata/BlogGit). Go to Settings and edit its name.
2. `$ git clone https://github.com/<your-github-username>/<the-name-you-gave-it>.git`
3. Edit both `readme-header-content.md` and `readme-footer-content.md`.
4. Create a subdirectory per category and start creating notes as Markdown files (`your-note.md`). Avoid spaces.
5. `$ ./publi.sh`

## Why BlogGit?

For the last fifteen years or so I have used several blogging solutions: Blogger, WordPress, Octopress, Jekyll, Blogdown and even custom sites manually crafted using ASP (back in 2003), PHP (some years later), plain static HTML files (at different times)... None of those were what I really wanted to use, as I have always been looking for a system with these characteristics:

* __It has to be extremely easy to use__. When I am to add some content I do not want to run any command or use any template and follow some rigid rules. This way, if I stay away from my notebook for some time, I still will remember how to add some content when I get back. 
* __It has to be magic-free__. If I have to install gems, dependency managers, clone some repository, go find where to add my content, run more commands... I will simply get bored and stop keeping my notebook up to date.
* __It has to use a really basic technology stack__, so that I do not feel I am even running any software but just creating files the same way I would do anyway. Markdown and (basic) Git seem like a reasonable choice.

So I decided to create this system myself. I call it BlogGit, as it kind of resembles a blogging system and is totally based on Git (blogging, blog it, blog&git... what a terrific name, I know).

## So, what is BlogGit and what does it for you?

BlogGit is nothing else than two short shell scripts (`readme.sh` and `publi.sh`) and a specific workflow. About the scripts, do not expect too much. This is the very first time in my life writing shell code, so I have been taking snippets from here and there until the code kind of works the way I want. About the workflow, you will find everything you need to know below.

BlogGit does two main things. First, it tracks all notes (Markdown files) you have created in your notebook. Second, when you choose to publish new content it generates a new `README.md` file that includes all your notes classified by category, with links to each one and so on. BlogGit is a way to keep your `README.md` totally up to date as an index for all your notes. This way you can focus on creating and editing notes and forget about the rest. 

Some things BlogGit assumes:

* You have used Git before and have a GitHub account (but you do not need to be an expert at all). 
* You know the basics of Markdown syntax (or are willing to spend five minutes learning them).
* You can use the terminal to run some basic commands (nothing too fancy).

If you fulfill these conditions, you just need to follow the following steps to use BlogGit. 

## Step 1 -- Fork a copy of [my BlogGit repository](https://github.com/almata/BlogGit) to your GitHub account. 

And take a minute to go to Settings and give it a better name (I use SENotebook for my notebook, but that's just an idea). You will get __exactly six files__:

* Two script files (`publi.sh` and `readme.sh`). __Do not edit them__ (but have a look at the code if you feel like it).
* A pretty empty `CHANGELOG.md`. BlogGit will update it every time you publish new content. __Do not edit it__.
* Two text files `readme-header-content.md` and `readme-footer-content.md`. Edit them as you like.
* A `LICENSE` file. Edit it as you like.

## Step 2 -- Clone your BlogGit repository locally.

```bash
$ git clone https://github.com/<your-github-username>/<the-name-you-gave-it>.git
```

From now on you will do all your work in this directory. Also, use `git remote -v` to ensure `origin` has been set.

## Step 3 -- Customize the content of your `README.md` file.

Your `README.md` file will be automatically generated every time you publish new content. However, you can customize what will be shown __before all your notes__ (`readme-header-content.md`) and what will be shown __after all your notes__ (`readme-footer-content.md`). So, edit these two files using standard Markdown syntax to fit your needs.

## Step 4 -- Add some content.

Create a new directory for each subject and a plain Markdown file for each note. As simple as that. As an example, BlogGit comes with a couple of directories (`Demo-Python` and `Demo-DataScience`) and some notes. Feel free to delete them when you have your own content. And always keep in mind these simple rules:

* Do not use spaces in your names. Ever. Use-dashes or CamelCase, but totally avoid spaces.
* Use `.md` extension for your notes. As in `my-first-note.md`.
* First line in your notes should always be __# Your note's title__. Exactly with that syntax: one `#` character, one space and the title.

## Step 5 -- Publish your content.

Whenever you feel like publishing all the content you have created, just run main script:

```bash
$ ./publi.sh 
```

## Step 6 (optional) -- Add some other content here and there.

If you want to add some additional content in your `README.md` file (through `readme-header-content.md` and `readme-footer-content.md`) and need to create some subdirectories in your main directory but do not want those to be considered categories and be listed in the `README.md` as such, just name your subdirectories with an initial `.` (as in `.SomeContent`). BlogGit will track these directories (for version control purposes) but will not take them into account to generate `README.md`.

## Step 7 (optional) -- Enable GitHub Pages

You can enable GitHub Pages for your repository (look for that option in Settings) and you will get a nicer version of it and a URL like https://<your-github-username>.github.io/SENotebook. GitHub Pages even lets you choose a theme and customize it using standard CSS syntax. I have not done that for my own Software Engineering Notebook as I find GitHub interface clean enough, but the option is there for those who want to give it a go.

__You can find a working example of BlogGit at my [Software Engineering Notebook](https://github.com/almata/SENotebook)__.
