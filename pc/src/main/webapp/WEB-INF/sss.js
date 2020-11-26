/**
 * 测试
 * Created by Michel on 2015/10/30.
 */
var TEST = {
    /**
     * 第一个方法
     */
    test1: function () {
        console.log(1);
        TEST.test2(2);
    },
    /**
     * 第二个方法
     * @param msg : name
     */
    test2: function (msg) {
        console.log(msg);
    },
    test3: function () {
        TEST.test2(2);
        console.log(3);
    }
}

var T = {
    test2: function () {
        TEST.test2(2);
        alert('T-2');
    }
}
//加载入口
$(function () {
    TEST.test1();
    TEST.test3();
    T.test2();
});

console.log(1);
console.log(2);
console.log(2);
console.log(3);
console.log(2);
alert('T-2');
