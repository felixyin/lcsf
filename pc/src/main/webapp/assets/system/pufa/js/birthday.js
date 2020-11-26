(function () {//工具集
    var Tools = {
        //a是否在数组b中
        inArray: function (a, b) {
            for (var i = 0; i < b.length; i++) {
                if (a == b[i]) return i;
            }
            return -1;
        },
        //获取某年某月的天数
        getNumberOfDays: function (year, month) {
            if (this.inArray(month, [1, 3, 5, 7, 8, 10, 12]) > 0) return 31;
            else if (this.inArray(month, [4, 6, 9, 11]) > 0) return 30;
            else if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) return 29;
            else return 28;
        }
    };
//日期选择器类，传入日期div的id名，div的结构参考上面的html，同一个页面上可以有多个ID不同的日期选择器
    var DateSelector = function (dateSelector) {
        if (typeof dateSelector !== 'string') return false;
        //获取DOM
        this.dateSelector = document.getElementById(dateSelector);
        this.dateSelectedBox = this.dateSelector.querySelector('.date-selected-box');
        this.dateSelectBox = this.dateSelector.querySelector('.date-select-box');
        this.dateSelectElement = {
            year: this.dateSelector.querySelector('.date-select-year'),
            month: this.dateSelector.querySelector('.date-select-month'),
            day: this.dateSelector.querySelector('.date-select-day'),
            sure: this.dateSelector.querySelector('.date-select-sure')
        };
        //定义option模板
        this.optionTpl = {
            normal: '<option>{$v}</option>',
            selected: '<option selected>{$v}</option>'
        };
        this.dateObj = new Date();
        //获取日期
        this.today = {
            year: this.dateObj.getFullYear(),
            month: this.dateObj.getMonth() + 1,
            day: this.dateObj.getDate()
        };
        //填充选项
        this.fillSelectFields();
        //绑定事件
        this.bind();
    };
//定义方法
    DateSelector.prototype = {
        //显示/隐藏选项框
        showSelectBox: function () {
            this.dateSelectBox.style.display = 'block';
        },
        hideSelectBox: function () {
            this.dateSelectBox.style.display = 'none';
        },
        //设置文本框的值，传入带有year,month,day属性的对象
        fillSelectedBox: function (o) {
            this.dateSelectedBox.value = o.year + '年' + o.month + '月' + o.day + '日';
        },
        //用从start到end的数字选项option填充某个select元素element，selected数为默认选中，option Template见上方定义
        fillSelectField: function (element, start, end, selected) {
            var tmp = [];
            for (var i = start; i <= end; i++) {
                var tpl = i === selected ? this.optionTpl.selected : this.optionTpl.normal;
                tmp.push(tpl.replace('{$v}', i));
            }
            element.innerHTML = tmp.join('\n');
        },
        //填充日月年的选项
        fillSelectFields: function () {
            this.fillSelectField(this.dateSelectElement.year, this.today.year - 99, this.today.year, this.today.year);
            this.fillSelectField(this.dateSelectElement.month, 1, 12, this.today.month);
            this.fillSelectField(this.dateSelectElement.day, 1, Tools.getNumberOfDays(this.today.year, this.today.month), this.today.day);
        },
        //绑定事件
        bind: function () {
            //保存指向类的指针
            var _this = this;
            _this.dateSelectedBox.onclick = function () {
                _this.showSelectBox();
            };
            _this.dateSelectElement.sure.onclick = function () {
                _this.fillSelectedBox({
                    year: _this.dateSelectElement.year.value,
                    month: _this.dateSelectElement.month.value,
                    day: _this.dateSelectElement.day.value
                });
                _this.hideSelectBox();
            };
            //当 年 或 月 的值改变时调整 日 的可选值
            _this.dateSelectElement.year.onchange = _this.dateSelectElement.month.onchange = function () {
                //为了方便计算，把dom中的alue转为整型
                var y = parseInt(_this.dateSelectElement.year.value, 10),
                    m = parseInt(_this.dateSelectElement.month.value, 10);
                _this.fillSelectField(_this.dateSelectElement.day, 1, Tools.getNumberOfDays(y, m), 1);
            };
        }

    };

//实例化类
    new DateSelector('date-selector-1');
})()