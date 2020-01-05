x = 15
3.times do #blocks & if/whiles can actually change the variable outside of it;
    x += 2
end

 
puts x # 21

x = 15

def foo(x) # scope of methods; does not change variables outside of the scope
    x = 10
end
foo(x)
 
puts x # 15

3.0 == 3 #=> true
3.0.eql? 3 #=> false
#a.eql?(b) implies a.hash == b.hash

some_array = [1]
some_hash = { some_array => 'secrets' }
some_array << 2
some_hash[some_array] # =>nil