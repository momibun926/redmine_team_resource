# Team resource monitoring Plugin

This plugin provides the function of summarize resource by specify projects.

## Current Version
0.0.1

## Compatibility
Redmine 4.0.0 and above

# Main features

## About workig days
1. Excluding weekends and holidays
2. If it is only weekends or holidays, make it a working day
3. Use holidays gem -> Regional settings are set in the common setting page(common setting link in contextial)

Example)

In Japan, May 3, May 4, May 5 are holidays

* Including weekends and holidays

|Start date          |Due date            |Estimated time |Working day|PV per day|
|--------------------|--------------------|---------------|-----------|----------|
|May 1, 2017 (Monday)|May 8, 2017 (Monday)|12 hours       |3 days     |4 hours   |

* Including only a few weekends and holidays

|Start date          |Due date            |Estimated time |Working day|PV per day|
|--------------------|--------------------|---------------|-----------|----------|
|May 1, 2017 (Monday)|May 7, 2017 (Sunday)|10 hours       |2 days     |5 hours   |

* Only weekends and holidays

|Start date          |Due date            |Estimated time |Working day|PV per day|
|--------------------|--------------------|---------------|-----------|----------|
|May 3, 2017 (Wed)   |May 7, 2017 (Sunday)|20 hours       |5 days     |4 hours   |

# Installation
(1) Getting plugin source

**case of zip file.**

* Download zip-file
* Create a folder named redmine_team_resource under [redmine_root]/plugins/
* Extract zip file in redmine_team_resource

**Case of git clone.**

```
git clone https://github.com/momibun926/redmine_team_resource [redmine_root]/plugins/redmine_team_resource
```

(2) bundle install

```
bundle install
```

(3) Restart your Redmine web servers (e.g. mongrel, thin, mod_rails).


# UnInstall
```
rake redmine:plugins:migrate NAME=redmine_team_resource VERSION=0
```

# Screen shots
**Overview**

# Contributing
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

# My Environment
*  Redmine version                4.2.0.stable.20876
*  Ruby version                   2.6.5-p114 (2019-10-01) [x86_64-linux]
*  Rails version                  5.2.5
*  Environment                    production
*  Database adapter               PostgreSQL
*  Mailer queue                   ActiveJob::QueueAdapters::AsyncAdapter
*  Mailer delivery                smtp
