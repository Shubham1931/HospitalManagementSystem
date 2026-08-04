console.log("running");

function myFunction1(){
    var num = 1;
    timer = setInterval(() => {
        if(num<31){
            var change = document.getElementById('changeingnum1');
            change.innerHTML = num ;
            num++;
        }
    }, 100);
}
// myFunction1();
function myFunction2(){
    var num = 1;
    timer = setInterval(() => {
        if(num<1001){
            var change2 = document.getElementById('changeingnum2');
            change2.innerHTML = num ;
            num++;
        }
    }, 5);
}
// myFunction2();
function myFunction3(){
    var num = 1;
    timer = setInterval(() => {
        if(num<41){
            var change3 = document.getElementById('changeingnum3');
            change3.innerHTML = num ;
            num++;
        }
    }, 80);
}
// myFunction3();
function myFunction4(){
    var num = 1;
    timer = setInterval(() => {
        if(num<21){
            var change4 = document.getElementById('changeingnum4');
            change4.innerHTML = num ;
            num++;
        }
    }, 100);
}
// myFunction4();
var mMove  = document.getElementById('changeingnum');
mMove.addEventListener("mousemove",function(){
    myFunction4();
    myFunction1();
    myFunction2();
    myFunction3();    
}, {once : true})
navShow = ()=>{
    var hello = document.querySelector("#floatingNav1")
    hello.style.display = "block"
    // console.log(hello)
}
hello2 = ()=>{
    var hello = document.querySelector("#floatingNav1")
    hello.style.display = "none"
}