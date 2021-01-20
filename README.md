# sd.vim v2

(n)vim wrapper for [sd](https://github.com/chmln/sd). This plugin tries to provide a more familiar regex replace / substitute syntax than the default in vim by wrapping the CLI tool sd.

This plugin is still its early stages. It doesn't really implement range support yet. A continent auto-installer isn't included yet as well.

## What changed compared to v1

There was already an even more basic version here, but it had too many inconveniences which made using it kind of pointless. In this revised version I not only made it possible to use every sd function you could use. I also removed the headaches around shell escaping, meaning you can now type away without thinking about shell character.

## Usage

I try to explain what it can do with a few examples.

### Using a Regex

Imagine your buffer looks like this, and you want to quickly regex replace a string.

```text
vim substitute is easy
```

You could use `:RegexReplace vim\ssubstitute sd`, the first parameter is what to find and the second parameter is what to replace with. And what you get is:

```text
sd is easy
```

#### Using Regex flags

The example above is using no flags which depending on what you want to do is okay or not.

Imagine you have to edit this text file:

```text
And I say VIM substitute is easy, like very easy.
vim SUBstitute could be used by almost anyone!
```

The third parameter of RegexReplace will define the Regex flags. If we want to catch every vim substitute no matter the casing we need the multiline flag and the case-insensitive flag.

```vim
:RegexReplace vim\ssubstitute sd im
```

`i` sets the case-insensitive flag and `m` the multiline flag. Notice that the flag options without spacing.

For a list of all valid flags consult the help output of sd.

```shell
sd --help
...
    -f, --flags <flags>
    Regex flags. May be combined (like `-f mc`).

    c - case-sensitive
    e - disable multi-line matching
    i - case-insensitive
    m - multi-line matching
    s - make `.` match newlines
    w - match full words only
...
```

### Using string literals

String literal mode is now available with the `:SimpleReplace` command

Your buffer might look like this

```text
But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure...
```

What you execute is:

```vim
:SimpleReplace pleasure pizza
```

And it will replace every `pleasure` with `pizza`

## The rough edges

1. This plugin depends on [sd](https://github.com/chmln/sd) and cannot be auto-installed yet. So make sure it is installed and in your PATH.
2. Implements only the buffer motion at the moment. This will change.
