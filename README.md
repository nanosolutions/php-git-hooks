# PHP Git Hooks

The Git hooks for applying in the local repository of the PHP project. Include the `pre-commit` hook.

## Installation

Clone repository:

```bash
cd some/path
git clone https://github.com/intaro/php-git-hooks
cd php-git-hooks
php -r "readfile('https://getcomposer.org/installer');" | php
./composer.phar install

# Execute setup.sh to clone Symfony2 coding standard to PHPCS
./setup.sh

```

Make symlink to the `pre-commit` file:

```bash
cd some/symfony/project/.git/hooks
ln -s some/path/php-git-hooks/pre-commit pre-commit
```


## pre-commit

Checks the committed files:

* PHP Syntax on PHP-errors (with PHPLint)
* Check code style for compliance with the standard PSR2 or Symfony2
* composer.json must be commited with composer.lock
* configurable language dependent debug code checks

Based on `pre-commit` hook of [Carlos Buenosvinos](http://carlosbuenosvinos.com/write-your-git-hooks-in-php-and-keep-them-under-git-control/).

### Example of output

```bash
$ git ci -m "commit message"
Intaro Code Quality Tool
Fetching files
Running PHPLint
Checking code style
1) src/Acme/DemoBundle/Tests/Controller/DefaultControllerTest.php (unused_use, eof_ending)

  [Exception]
  There are coding standards violations!
```

```bash
$ git ci -m "commit message"
Intaro Code Quality Tool
Fetching files
Running PHPLint
Checking code style
Checking code style with PHPCS
FILE: ...m/src/Acme/DemoBundle/Tests/Controller/DefaultControllerTest.php
--------------------------------------------------------------------------------
FOUND 0 ERROR(S) AND 2 WARNING(S) AFFECTING 2 LINE(S)
--------------------------------------------------------------------------------
 197 | WARNING | Line exceeds 120 characters; contains 172 characters
 212 | WARNING | Line exceeds 120 characters; contains 128 characters
--------------------------------------------------------------------------------

  [Exception]
  There are PHPCS coding standards violations!
```

```bash
$ git ci -m "commit message"
Intaro Code Quality Tool
Fetching files
Running PHPLint
Checking code style
Checking code style with PHPCS
Good job dude!
[some-branch 0f5ea39] commit message
 10 files changed, 357 insertions(+), 17 deletions(-)
 create mode 120000 bin/php-cs-fixer
 create mode 120000 bin/phpcs
 create mode 100644 src/Acme/DemoBundle/Tests/Controller/DefaultControllerTest.php
```
