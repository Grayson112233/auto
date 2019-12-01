# auto-django
#### Automatically deploy a given Django website on Ubuntu
---

I've created this script as a tool for me to avoid the repetition of deploying my Django sites. I've made it open source in case anyone else finds it useful.

```
mkdir tmp && mkdir auto-django && curl -L https://github.com/Grayson112233/auto-django/tarball/master | tar xz -C tmp && cp -R tmp/*/* auto-django && rm -rf tmp
```