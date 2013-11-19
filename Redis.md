# Redis (Key value store)

## Uses
   * Rails
     * Session Store
     * HTTP Cache
     * Model Caching
     * Fragment Caching
   * Caching. We'll see more of this
   * Queues.
   * Real time tracking. What users are logged in, etc.
   * Counting unique visits to a page. Add client IPs that have viewed page.
   * Leader boards. Users sorted by score. 
   * Live update of items, (articles, orders, etc.) on your home page.

## Installation
   [Installation on OSX](http://paralyzedegg.blogspot.com/2013/05/homebrew-redis-on-mountain-lion.html)

## Manage Redis server.
### Lunchy gem
   <p>Install the [lunchy gem](https://github.com/mperham/lunchy) to manage OSX services. Wraps launchctl.</p>
   * Will show the process id, pid, of redis service if it's running.
   <code> lunchy status redis</code>
   * Stop Redis server/service.
   <code> lunchy stop redis</code>
   * Start Redis server/service.
   <code> lunchy start redis</code>

## Overview
   * Operates Like a big hash.
   * Keys are strings with identify pieces of data (values)
   * Values are arbitrary byte arrays that Redis doesn't care about.
   * Redis has five data structures, (strings, hashes, lists, sets and ordered sets)
   * Not a silver bullet but is good for many, many tasks.
## Persistence
   * In-memory, persistent store. 
   * Data is stored in memory, so it's real fast to do read/writes. Hundred of thousands operations per second.
   * Can loose recent data if server died before a save/persist was done.
   * Default is to store every 60 seconds if 1000 or more keys have changed. This can be adjusted.
   * Can run in append mode. When a key changes an append only file is updated on the disk.

## Ruby Redis Gem
   * [Github Gem](https://github.com/redis/redis-rb)
   * [Gem Documentation](http://redis-rb.keyvalue.org/v2.2.0/)
   * [Documentation](http://redis-rb.keyvalue.org/v2.2.0/)
   * [Methods](http://redis-rb.keyvalue.org/v2.2.0/Redis.html)

## Data Types 
  * [Data Types](http://redis.io/topics/data-types)
  * [String Operations](http://redis.io/commands/#string)   
  * [List Operations](http://redis.io/commands/#list)        
  * [Set Operations](http://redis.io/commands/#set)   


### Redis Client
  * [Redis Client](http://redis.io/topics/data-types-intro)
    
  <code>redis-cli --help</code>


### References
  * [Little Redis Book](http://openmymind.net/2012/1/23/The-Little-Redis-Book/)
  * [Redis Presentation](http://no.gd/redis-presentation.pdf)
