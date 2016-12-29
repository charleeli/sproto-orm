local orm = require 'orm'
tprint = require('utils').print_table

-- test
local type_list = (require 'typedef').parse('test.sproto', "./test")
tprint(type_list)

print('[TC]: type init')
orm.init(type_list)

print('--- obj_class_map')
tprint(orm.cls_map)

print('[TC]: struct init')
local obj_a = orm.create('class_a')
tprint(obj_a)

print('[TC]: struct set attr')
obj_a.a = nil
obj_a.b = 2
obj_a.c = true
obj_a.d = 'hello world'
tprint(obj_a)
for k, v in pairs(obj_a) do
    print(k, v)
end


print('[TC]: struct init by data')
local obj_a = orm.create('class_a', {a=10, b=100})
tprint(obj_a)

print('[TC]: type ref')
local obj_d = orm.create('class_d')
obj_d.a = {a = 100}
obj_d.b = {a = 100}
obj_d.c = {a = 100}
tprint(obj_d)

print('[TC]: complex')
local obj_e = orm.create('class_e')
obj_e.a = {b = {3,4,5,6}}
obj_e.b = {{["1"] = 2, ["2"] = 3},}
tprint(obj_e)
for k, v in pairs(obj_e.b[1]) do
    print(k, type(k), v, type(v))
end


print('[TC]: type ref optimize')
local obj_a = orm.create('class_a')
print("--- obj_a")
local obj_d = orm.create('class_d', {a=obj_a, b=obj_a, c=obj_a})
print("--- obj_d")
-- tprint(obj_d)
local obj_e = orm.create('class_e')
table.insert(obj_e.b, obj_d)
obj_e.d = {
    a = 1,
    b = 'test',
    c = {
        b = {'a', 'b', 'c'},
        c = {a = 1, b = 2, c = 3}
    }
}
-- tprint(obj_e)
print('--- check default', obj_e.d.c.a)
--assert(obj_e.d.c.a)
