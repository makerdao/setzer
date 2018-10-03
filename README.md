# NAME
   `setzer` -- manipulate feeds and update data

# SYNOPSIS
   `setzer <command> [<args>]`  
   `setzer <command> --help`

# COMMANDS

  | command    |      description                                           |
  |------------|------------------------------------------------------------|
  |`average`   |      get average price of 2 or more price `<source>`       |
  |`bot`       |      really cool bot                                       |
  |`compute`   |      get what the medianizer value would be if updated     |
  |`expires`   |      get expiration in seconds (< 0 means expired)         |
  |`help`      |      print help about setzer(1) or one of its subcommands  |
  |`peek`      |      peek a dsvalue, dscache or medianizer                 |
  |`poke`      |      poke a medianizer                                     |
  |`post`      |      update a ds-price                                     |
  |`price`     |      show ETH/USD price from `<source>`                    |
  |`read`      |      read a dsvalue, dscache or medianizer                 |
  |`set`       |      set next feed of a medianizer                         |
  |`spread`    |      variance of 2 values in %                             |
  |`valid`     |      check if a dsvalue, dscache or medianizer has a value |
  |`void`      |      invalidate a feed                                     |
  |`volume`    |      show ETH/USD volume from `<source>`                   |


# INSTALLATION

`setzer` depends on [seth](https://dapp.tools/seth/) and `jshon`.

Install dependencies with Nix:

```
nix-channel --add https://nix.dapphub.com/pkgs/dapphub
nix-channel --update
nix-env -iA dapphub.{seth,jshon}
```

Or follow installation process from [Dapp tools Installing](https://dapp.tools)

   |                |                                        |
   |----------------|----------------------------------------| 
   |`make link`     |  install setzer(1) into `/usr/local`   |  
   |`make uninstall`|  uninstall setzer(1) from `/usr/local` |

# RUNNING SETZER BOT
  `setzer bot` expects a config file located at `/etc/setzer.conf` or
  passed via `--config path/to/config.conf`

  The bot will run with sensible defaults and only needs three things:

```bash
  export ETH_FROM="YOUR ACCOUNT"
  export SETZER_FEED="YOUR PRICE-FEED ADDRESS"
  export SETZER_MEDIANIZER="0x729D19f657BD0614b4985Cf1D82531c67569197B"
```

There are several extra options but you generally will not modify them.
  
```bash
  #The list of price sources. Execute `setzer price` to get list of valid values!
  export SETZER_SOURCES="LIST OF PRICE SOURCES"
  
  #setzer tries to create a price update transaction with increasing gas price to 
  #make sure it gets mined. Starts from $SETZER_INITIAL_GAS_PRICE with $SETZER_GAS_PRICE_INCREMENT 
  #until $SETZER_MAX_GAS_PRICE. 
 
  #initial gas price in Wei
  export SETZER_INITIAL_GAS_PRICE=`seth --to-wei 1 gwei`
  
  #gas price increment in Wei
  export SETZER_GAS_PRICE_INCREMENT=`seth --to-wei 5 gwei`
  
  #max gas price in Wei
  export SETZER_MAX_GAS_PRICE=`seth --to-wei 26 gwei`
  
  #spread between current price and last update price in percentage
  export SETZER_SPREAD=2

  #Seconds to wait between two price fetches
  export SETZER_INTERVAL_SECONDS=120

  #Seconds to wait for price update transaction to execute on blockchain
  # before retrying with higher gas price
  export SETZER_WAIT_FOR_RESEND=240
  
  #automatically update price if needed
  # if set to 1 price will be auto updated if needed on the blockchain
  # if set to '' (empty) price feed will update only if user enters 'y' 
  export SETZER_AUTO=1
  
  #Time to wait for a node to respond
  #default 15s
  export RPC_TIMEOUT=15s
```

# OPTIONS
   You can provide any `seth` option to commands that send transactions.  
   For example `setzer void <feed> -F <account> --gas=100000 -P 1000000000`

Report bugs to <https://github.com/makerdao/setzer/issues>.

Thanks to @dbrock for paving the way with `seth` and `dapp`
