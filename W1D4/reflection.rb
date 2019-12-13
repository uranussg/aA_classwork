#phase 2

def xnor_select(array, prc1, prc2)
    selected = []
    array.each do |el|
        selected << el if prc1.call(el) == prc2.call(el)
    end
    selected
end


def filter_out!(array, &prc)
    array.uniq.each { |el| array.delete(el) if prc.call(el) }
end


def proctition(array, &prc)
    trues = []
    falses = []
    array.each do |el|
        if prc.call(el)
            trues << el
        else
            falses << el
        end
    end
    [ *trues, *falses ]
end


#phase 3

def chain_map(val, prcs)
    prcs.inject(val) { |accum, prc| prc.call(accum) }
end