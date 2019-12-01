# auto
#### Droplet setup and deploy scripts
---

I've created this script as a tool for me to avoid the repetition of deploying my Django sites. I've made it open source in case anyone else finds it useful.

```
mkdir tmp && mkdir auto && curl -L https://github.com/Grayson112233/auto/tarball/master | tar xz -C tmp && cp -R tmp/*/* auto && rm -rf tmp
```

Then run `cd auto && bash ./machine_setup.sh`.