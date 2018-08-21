# GDAX DCA

BTC [Dollar Cost Averaging](https://en.wikipedia.org/wiki/Dollar_cost_averaging) script for GDAX.  
Buy a fixed budget of BTC every day automatically using cronjobs.

## Usage

Copy `config/config.example.yml` to `config/config.yml` and customize it with
the `api_key`, `api_secret` and `api_pass` created in the GDAX API panel.  
Choose your daily fiat budget and set `daily` (GDAX minimum for a market buy is 10€).  
The script can be used to buy ETH, LTC and BCH by changing the `market` value.

Install dependencies with `bundle install`, copy `config/scheduler.example.rb`
to `config/scheduler.rb` and customize the time you want the script to perform
the buy in then run `whenever --update-crontab`.
