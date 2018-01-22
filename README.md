# GDAX DCA

BTC [Dollar Cost Averaging](https://en.wikipedia.org/wiki/Dollar_cost_averaging) script for GDAX.  
Buy a fixed budget of BTC every day automatically using cronjobs.

## Usage

Customize `config/config.yml` with the `api_key`, `api_secret` and `api_pass` created in the GDAX API panel.
Choose your daily budget and set `daily`.

Install dependencies with `bundle install`, customize the time you want the script to perform the buy in `config/scheduler.rb`, then run
`whenever --update-crontab`.
