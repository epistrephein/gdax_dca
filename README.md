# GDAX DCA

BTC [Dollar Cost Averaging](https://en.wikipedia.org/wiki/Dollar_cost_averaging) script for GDAX.  
Buy a fixed budget of BTC every day automatically using cronjobs.

## Usage

Customize `config/config.yml` with the `api_key`, `api_secret` and `api_pass` created in the GDAX API panel.
Choose your daily fiat budget and set `daily` (GDAX minimum for a market buy is 10€).  
The script can be used to buy ETH, LTC and BCH by changing the `market` value.

Install dependencies with `bundle install`, customize the time you want the script to perform the buy in `config/scheduler.rb`, then run
`whenever --update-crontab`.
