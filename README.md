# lotus-ci

A set of Docker images used for `lotus` CI pipelines.

The images are based on [RHEL UBI 9](https://catalog.redhat.com/en/software/base-images), and include:

* `lotus-env`
  * [Git](https://git-scm.com/install/linux)
  * [uv](https://github.com/astral-sh/uv) (package resolver)
  * [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html) (version 23.26)

* `lotus-docs-env`
  * Everything in `lotus-env`
  * [Graphviz](https://packages.debian.org/bookworm/graphviz) (for building the documentation)
  * [pandoc](https://packages.debian.org/bookworm/pandoc) (dependency of `nbsphinx`)


### Image Creation Schedule

* Images will be automatically created every Saturday, at 3:00 AM ET, in order to remain up-to-date with any dependencies.
* Version numbers correspond with the date the image was created.
