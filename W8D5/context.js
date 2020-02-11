// Conclusions

//1. the context of the function that is called functionally is decided by where it is defined.
// m1 vs m1_1

//2. normal input arg functions's context depend on where they're defined.
// m2 vs m2_1; m6 vs m6.2

//3. input functions defined in the arg positions(not an arrow function) has the same context with the scope of the function that has it as an arg (not necessarily the same context)
// m1 vs m2; m2 vs m3; m5 & m6

//4. arrow functions' context go 1 level higher than the normal functions.
// m3 vs m4; m6 vs m6.1

//5. when input arg functions are instance methods, js treat it the same as the normal funtions, and contexts depend on where it is defined.
// m7 vs m7_2 vs m7_3


const callback1 = function(callback2) {
    console.log(`${this} is the context of callback1` )
    callback2()
}

const callback1_1 = function() {
    console.log(`${this} is the context of callback1_1` )
    callback2()
}

const callback2 = function(){
    console.log(`${this} is the context of callback2`)
}

class Test {
    constructor(name) {
        this.name = name;
    }

    method1() {
        console.log(`${this.name} is the context of method1`)
        const callback2 = function(){
            console.log(`${this} is the context of callback2`)
        }
        const callback1 = function() {
            console.log(`${this} is the context of callback1` )
            callback2()
        }
        callback1()
    }

    
    method1_1() {
        console.log(`${this} is the context of method1_1`)

        const callback1 = function() {
            console.log(`${this} is the context of callback1` )
            callback2()
        }
        callback1()
    }

    method2() {
        console.log(`${this} is the context of method2`)
        const callback1 = function(callback2) {
            console.log(`${this} is the context of callback1` )
            callback2()
        }
        callback1(function(){
            console.log(`${this} is the context of callback2`)
        })
    }

    method2_1() {
        console.log(`${this} is the context of method2_1`)
        const callback1 = function(callback2) {
            console.log(`${this} is the context of callback1` )
            callback2()
        }
        callback1(callback2)
    }

    method3() {
        console.log(`${this} is the context of method3`)
        
        callback1(function(){
            console.log(`${this} is the context of callback2`)
        })
    }

    method4() {
        console.log(`${this} is the context of method4`)

        callback1(() => {
            console.log(`${this} is the context of callback2`)
        })
    }

    method5(callback2) {
        console.log(`${this} is the context of method5`)


        callback1(callback2)
    }

    method6(callback2) {
        console.log(`${this} is the context of method6`)
        
        const callback1 = function(callback2) {
            console.log(`${this} is the context of callback1` )
            callback2()
        }
        callback1(callback2)
    }

    method7() {
        console.log(`${this} is the context of method7`)

        this.callback2 = function(){
            console.log(`${this} is the context of callback2`)
        }
        this.callback1 = function() {
            console.log(`${this} is the context of callback1` )
            this.callback2()
        }

        this.callback1()
    }

    method7_1() {
        console.log(`${this} is the context of method7_1`)
 
        let that = this

        this.callback2 = function(){
            console.log(`${this} is the context of callback2`)
        }
        const callback1 = function() {
            console.log(`${this} is the context of callback1` )
            that.callback2()
        }

        callback1()
    }

    method7_2() {
        console.log(`${this} is the context of method7_2`)

        this.callback2 = function(){
            console.log(`${this} is the context of callback2`)
        }
        this.callback1 = function(callback2) {
            console.log(`${this} is the context of callback1` )
            callback2()
        }

        this.callback1(this.callback2)
    }
    method7_3() {
        console.log(`${this} is the context of method7_3`)


        this.callback1 = function(callback2) {
            console.log(`${this} is the context of callback1` )
            callback2()
        }

        this.callback1(this.callback2_1)
    }
}

Test.prototype.callback2_1 = function() {
    console.log(`${this} is the context of callback2_1`)
}

const a = new Test('test1')

// method1/1_1 callback2 is not passed in as an arg of callback1.

// method1: both callback1 and callback2 are defined locally
a.method1() 
// [object Object] is the context of method1
// undefined is the context of callback1
// undefined is the context of callback2 

//method1.1:callback1 is defined locally, callback2 is defined globally
a.method1_1()
// [object Object] is the context of method1_1
// undefined is the context of callback1
// [object global] is the context of callback2

//// Conclusion 1(m1 vs m1_1): 
//// the context of the function that is called functionally is decided by where it is Defined.


// method2: callback1 is defined locally, callback2 is defined as the arg of callback1
a.method2()
// [object Object] is the context of method2
// undefined is the context of callback1
// undefined is the context of callback2 


// method2.1: callback1 is defined locally, callback2 is defined globally
a.method2_1()
// [object Object] is the context of method2_1
// undefined is the context of callback1
// [object global] is the context of callback2

//// Conclusion 2(m2 vs m2_1):
//// normal input arg functions's context depend on where they're defined.
//// Conclusion 3(m1 vs m2):
//// input functions defined in the arg positions has the same context with the scope of the function that it is passed in


// method3: callback1 is defined globally, callback2 is as the arg of callback1.
a.method3()
// [object Object] is the context of method3
// [object global] is the context of callback1
// undefined is the context of callback2

//// m2 vs m3:Conclusion 3 <- (the scope, not the context of the function that it is passed in)

// method4: callback1 is defined globally, callback2 is defined as an arrow function
a.method4()
// [object Object] is the context of method4
// [object global] is the context of callback1
// [object Object] is the context of callback2

//// Conclusion 4(m3 vs m4)
//// arrow functions' context go 1 level higher than the normal functions.



// method5: callback1 is defined globally, callback2 is defined as the arg of method5
a.method5(function(){
    console.log(`${this} is the context of callback2`)
})
// [object Object] is the context of method5
// [object global] is the context of callback1
// [object global] is the context of callback2

// method6: callback1 is defined locally, callback2 is defined as the arg of method6
a.method6(function() {
    console.log(`${this} is the context of callback2`)
})
// [object Object] is the context of method6
// undefined is the context of callback1
// [object global] is the context of callback2

//// (m5 & m6):Conclusion 3

// method6.1: callback1 is defined locally, callback2 is defined as an arrow function
a.method6(() => {
    console.log(`${this} is the context of callback2`)
})
// [object Object] is the context of method6
// undefined is the context of callback1
// [object Object] is the context of callback2 <- this object is not a!

//// (m6 vs m6.1) Conclusion 4

// method6.2: callback1 is defined locally, callback2 is defined globally
a.method6(callback2)
// [object Object] is the context of method6
// undefined is the context of callback1
// [object global] is the context of callback2

//// (m6 vs m6.2):Conclusion 2

// method7: callback1 and callback2 are defined as instance methods locally
a.method7()
// [object Object] is the context of method7
// [object Object] is the context of callback1
// [object Object] is the context of callback2

// method7.1: callback2 is defined as instance method locally, callback1 is defined locally
a.method7_1()
// [object Object] is the context of method7_1
// undefined is the context of callback1
// [object Object] is the context of callback2

//// (m7 & m7.1): basic property of method call

// method7.2: callback1 and callback2 are defined as instance methods locally.pass in callback2 as the arg of callbakc1
a.method7_2()
// [object Object] is the context of method7_2
// [object Object] is the context of callback1
// undefined is the context of callback2

// method7.3: callback1 are defined as intance methods locally, callback2_1 is defined as instance method gloabally. pass in callback 2 as arg of callback 1
a.method7_3()
// [object Object] is the context of method7_3
// [object Object] is the context of callback1
// [object global] is the context of callback2_1

//// (m7 vs m7.2 vs m7.3): Conclusion 5
//// when input arg functions are instance methods, js treat it the same as the normal funtion, and context depend on where it is defined.
