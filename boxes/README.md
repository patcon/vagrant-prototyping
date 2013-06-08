# Creating Vagrant Boxes for Custom Providers

Vagrant providers each require a custom provider-specific box format.

To turn any of these into a box:

```
cd precise64/aws
$ tar cvzf aws-precise64.box ./metadata.json ./Vagrantfile
```

This box works by using Vagrant's built-in Vagrantfile merging to setup
defaults for AWS. These defaults can easily be overwritten by higher-level
Vagrantfiles (such as project root Vagrantfiles).
