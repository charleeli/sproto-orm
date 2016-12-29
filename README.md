# sproto-orm
sproto orm lib for database schema, can use like a ordinary lua table, inspired by lua-orm

# require
- lua5.3.2(copy from https://github.com/pigparadise/lua-orm/tree/master/lua-5.3.2)
  - new function enable_oldindex(table, boolean) to enable table's __oldindex feature(default not enable)
  - new metamethod __oldindex to hook hook table set when key already existed(in lua code)
  - need a code patch, you can see detail in this <a href="https://github.com/pigparadise/lua-orm/commit/648322465bde340b048806621a353c876b67f24a" target="_blank">commit</a>
  
- [lpeg](http://www.inf.puc-rio.br/~roberto/lpeg/) for schema parser

# support
- basic data type: boolean, integer, string, struct, list, map
- custom define class
- class ref

# typedef examples
```
you can have a look at https://github.com/cloudwu/sproto
```

# lua code examples
```
local orm = require 'orm'
local type_list = (require 'typedef').parse('test.sproto', ".")
orm.init(type_list)
local obj_a = orm.create('class_a')
```

you need make lua first and can see more examples in test.lua.

if you want create your own typedef syntax, you can see typedef.lua.
