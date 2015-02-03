## About

This is Kontaktdatenbank. This application should support the Press & PR people at Frauencomputerzentrum Berlin
in organizing their contacts. It is being developed within a project semester at htw Berlin
and also our first Rails project.

## Setup
```
git clone git://github.com/codingcats/fczb-adressdatenbank
cd fczb-adressdatenbank
gem install bundler
bundle install

[configure your database]
[configure the application]

bundle exec rake db:migrate
```

## Description

Kontaktdatenbank has three main sections.

### Contacts
An individual person and their Emailadress(es).

### Institutions
The instution each contact is associated with, providing a 'real life' mailing address and other info.

### Occasions
People can be contacted for different occasions, e.g. a Xmas mailing or an invitation for a multipliers meetup.

[to be elaborated on]

## Authors

see contributors
