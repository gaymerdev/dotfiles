# Linux Profile COnfigurations

This repository contains, at the moment, configurations for the Z Shell (ZSH), SSH client, and the `dig` and `vim` commands.

## Setup Script

Placeholder

## ZSH

- Uses the Antigen plugin manager
- Uses the Powerline10K theme
  - *Windows*:  requires a special font to render the theme as expected. [MesloLGS NF](https://github.com/fontmgr/MesloLGSNF) works well.
- Loads aliases based on hostname of the server
- If available, runs the `neofetch` command when loaded

*Note:  a `.hushlogin` file can be created in the home directory to silence other SSH login banners.*

## SSH Client

Contains aliases for the home and work servers. This sets particular config options. Notably, the `control` options do not work on Windows machines.

## DIG

Remove general clutter from the output when using the `dig` command. This returns only the IPv4 addresses. Add `AAAA` to the command to return the IPv6 records, such as `dig cloudflare.com AAAA`.

## Vim

Placeholder
