# WeidianOpen
=========
Ruby SDK for weidian Open Platform([微店开放平台](http://open.weidian.com/))

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'weidian_open'
```

And then execute:
```shell
$ bundle
```

Or install it yourself as:
```shell
$ gem install weidian_open
```

## Usage
#### Information about this gem:
```ruby
puts WeidianOpen::API
puts WeidianOpen::HOWTO_CONFIG
```

#### Configuration
```ruby
WeidianOpen.config do
    @app_key = '1111111'             # your app_key
    @app_secret = '1111111111111111' # your app_secret
  end
```
or
```ruby
WeidianOpen.app_key = '111111'          # your app_key
WeidianOpen.app_secret = '1111111111'   # your app_secret
```

###Access Token
Access Token can be refreshed automatically by this Gem.
You can show access token used currently after configuration:
```ruby
WeidianOpen.access_token
```

#### [Weidian Open API WIKI](http://wiki.open.weidian.com/):
Normally, you can use any Offical API method if HTTP Method of it is GET.
All you need to do is subsituing "." inside API method name with "_".

Example:
* API method: [vdian.order.list.get](http://wiki.open.weidian.com/index.php?title=%E8%8E%B7%E5%8F%96%E8%AE%A2%E5%8D%95%E5%88%97%E8%A1%A8)
```ruby
WeidianOpen.vdian_order_list_get(page_num: "1",
                             order_type: "unpay",
                             add_start: "2015-03-18 14:15:12",
                             add_end: "2015-03-20 14:15:12")

WeidianOpen.vdian_order_list_get(order_type: "unpay", page_num: "1")
```

* API method: [vdian.order.get](http://wiki.open.weidian.com/index.php?title=%E8%8E%B7%E5%8F%96%E8%AE%A2%E5%8D%95%E5%88%97%E8%A1%A8)
```ruby
WeidianOpen.vdian_order_get(order_id: "1164787976")
```

## Contributing
1. Fork it ( https://github.com/yanyingwang/weidian_open/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

