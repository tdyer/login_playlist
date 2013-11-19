require 'redis'
require 'hiredis'
require 'json'

redis = redis = Redis.new(:driver => :hiredis)

puts '#' * 20 + ' Strings ' +  '#' * 20
##################### Strings #####################

# key with a string
redis.set('key1', "hey you")
puts redis['key1']

redis.append('key1', ", ya I'm talking to you.")
puts redis['key1']

# In redis-cli
# get key1
##################### Counters #####################

redis.del('counter')  # remove this and run again
puts redis['counter'] || "no key" 

4.times do
  redis.incrby('counter', 3)
end
puts redis['counter']


redis.incrby('counter', 77)
puts redis['counter']

redis.decrby('counter', 7)
puts  redis['counter']

# In redis-cli
# get counter

##################### Expiration #####################
# Can be used for caching the Least Recently Used (LRU) entries in a
# cache

redis.setex('my_name', 10, "tom")
# sleep(12)
puts redis['my_name']

# In redis-cli
# get my_name

#####################  Lists #####################
# namespaces, ga:myapp. These can be used to to group all
# keys of a specific application, class or type of redis entry
# semicolons are used, by convention, to separate namespaces

# del entry
redis.del('ga:myapp:logs')

# right push
3.times do |i|
  redis.rpush('ga:myapp:logs', "log message #{i}")
end

# show the whole list
puts redis.lrange('ga:myapp:logs', 0, -1)
puts redis.lrange('ga:myapp:logs', 0, -1).join(', ')

# left push
redis.lpush('ga:myapp:logs', "log message left 1")
redis.lpush('ga:myapp:logs', "log message left 2")
puts redis.lrange('ga:myapp:logs', 0, -1).join(', ')

# length 
puts  redis.llen('ga:myapp:logs').to_s

# left pop
redis.lpop('ga:myapp:logs')
puts redis.lrange('ga:myapp:logs', 0, -1).join(', ')
puts redis.llen('ga:myapp:logs').to_s

# get entry at index
puts  redis.lindex('ga:myapp:logs', 2)

# remove entry
puts redis.lrange('ga:myapp:logs', 0, -1).join(', ')
redis.lrem('ga:myapp:logs', 0, "log message 1")
puts redis.lrange('ga:myapp:logs', 0, -1).join(', ')


# add more entries
redis.rpush('ga:myapp:logs', 'hello')
redis.rpush('ga:myapp:logs', 'world')
puts redis.lrange('ga:myapp:logs', 0, -1).join(', ')


# left trim list 
redis.ltrim('ga:myapp:logs', 0, 1)
puts redis.lrange('ga:myapp:logs', 0, -1).join(', ')
# In redis-cli
# lrange ga:myapp:logs 0 -1

##################### Hashes #####################
redis.hset('ga:hash:1', 'one', 'foo')
redis.hset('ga:hash:1', 'a1', [1,3,55].to_json)
puts redis.hget('ga:hash:1', 'one')
puts redis.hget('ga:hash:1', 'a1')

# get the entire hash
puts redis.hgetall 'ga:hash:1'

# delete entry
redis.hdel 'ga:hash:1', 'one'
puts redis.hgetall 'ga:hash:1'

# in redis-cli
# hgetall ga:hash:1

##################### Sets #####################
# sick of typing redis all the time
r = redis
r.del 'foo-tags'
r.del 'bar-tags'

p "create a set of tags on foo-tags"

r.sadd 'foo-tags', 'one'
r.sadd 'foo-tags', 'two'
r.sadd 'foo-tags', 'three'

puts "foo-tags: "
p r.smembers('foo-tags')

p "create a set of tags on bar-tags"
r.sadd 'bar-tags', 'three'
r.sadd 'bar-tags', 'four'
r.sadd 'bar-tags', 'five'

puts "bar-tags: "
p r.smembers('bar-tags')

p 'intersection of foo-tags and bar-tags'
p r.sinter('foo-tags', 'bar-tags')

##################### Sorted(Scored) Sets #####################

r.zadd 'hackers', 1940, 'Alan Kay'
r.zadd 'hackers', 1953, 'Richard Stallman'
r.zadd 'hackers', 1965, 'Matz'
r.zadd 'hackers', 1916, 'Claude Shannon'
r.zadd 'hackers', 1969, 'Linus Torvalds'
r.zadd 'hackers', 1912, 'Alan Turing'

puts "hackers (ordered by year):"
p r.zrange('hackers', 0, -1)

puts "hackers (reverse ordered by year):"
p r.zrevrange('hackers', 0, -1)

=begin
=end


