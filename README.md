# NAME
   `setzer` -- manipulate feeds and update data

# SYNOPSIS
   `setzer <command> [<args>]`  
   `setzer <command> --help`

# INSTALLATION

   |                |                                        |
   |----------------|----------------------------------------| 
   |`make link`     |  install setzer(1) into `/usr/local`   |  
   |`make uninstall`|  uninstall setzer(1) from `/usr/local` |

# SETUP
  setzer expects a `/etc/setzer.conf` file that looks like this:

```bash
  export ETH_FROM="YOUR ACCOUNT"
  export SETZER_FEED="YOUR PRICE-FEED ADDRESS"
  export SETZER_MEDIANIZER="0x729D19f657BD0614b4985Cf1D82531c67569197B"
  
  #The list of price sources. Execute 'setzer price'
  export SETZER_SOURCES="LIST OF PRICE SOURCES"
  
  #setzer can connect to multiple nodes listed here
  #Space separated list of nodes' rpc ports to connect to
  #default 8545
  export RPC_PORTS="8545"
  
  #Time to wait for a node to respond
  #defaults to 15s
  export RPC_TIMEOUT=15s
```
# DEPENDENCIES
   seth(1)         https://github.com/dapphub/seth  
   curl(1)         https://curl.haxx.se/  
   jshon(1)        https://github.com/mbrock/jshon/

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
  |`poker`     |      update a poker                                        |
  |`post`      |      update a ds-price                                     |
  |`price`     |      show ETH/USD price from `<source>`                    |
  |`prod`      |      update a ds-cache                                     |
  |`read`      |      read a dsvalue, dscache or medianizer                 |
  |`set`       |      set next feed of a medianizer                         |
  |`spread`    |      variance of 2 values in %                             |
  |`valid`     |      check if a dsvalue, dscache or medianizer has a value |
  |`void`      |      invalidate a feed                                     |
  |`volume`    |      show ETH/USD volume from `<source>`                   |

# OPTIONS
   You can provide any `seth` option to commands that send transactions.  
   For example `setzer void <feed> -F <account> --gas=100000 -P 1000000000`

Report bugs to <https://github.com/makerdao/setzer/issues>.

Thanks to @dbrock for paving the way with `seth` and `dapp`
