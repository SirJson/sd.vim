# sd.vim
Simple and small vim wrapper for [sd](https://github.com/chmln/sd)

For people how are used to PCRE / Python / JavaScript style regular expression search and replace and fight with sed every other day.

## Example

Imagine your buffer looks like this:

```
sed is easy
```

Now you run `:Sd 'sed(\ .*)' 'sd$1'` and what you get is:

```
sd is easy
```

## Caveats

1. You are still using your shell. Single quote your input!
2. Spaces have to be escaped with backslash. That is because vim.
3. This plugin depends on [sd](https://github.com/chmln/sd). So make sure it is installed and in your PATH.
