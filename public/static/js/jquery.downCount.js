/**
 * downCount: Simple Countdown clock with offset
 * Author: Sonny T. <hi@sonnyt.com>, sonnyt.com
 */

(function ($) {
    $.fn.downCount = function (options, callback) {
        var settings = $.extend({
                date: null,
                offset: null,
                qi:null
            }, options);

        // 如果日期参数为空则抛出异常
        if (!settings.date) {
            $.error('Date is not defined.');
        }

        // 如果参数异常则抛出异常
        if (!Date.parse(settings.date)) {
            $.error('Incorrect date format, it should look like this, 12/24/2012 12:00:00.');
        }

        // 保存当前容器
        var container = this;

        /**
         * Change client's local date to match offset timezone
         * @return {Object} Fixed Date object.
         */
        var currentDate = function () {
            // get client's current date
            var date = new Date();

            // turn date to utc
            var utc = date.getTime() + (date.getTimezoneOffset() * 60000);

            // set new Date object
            var new_date = new Date(utc + (3600000*settings.offset))

            return new_date;
        };

        /**
         * Main downCount function that calculates everything
         */
        function countdown () {
            var target_date = new Date(settings.date), //设置到期时间
                current_date = currentDate(); // 获取当前时间

            // 计算倒计时时间
            var difference = target_date - current_date;

            // 如果倒计时事件为0则结束倒计时并且调用回调方法
            if (difference < 0) {
                // stop timer
                clearInterval(interval);

                if (callback && typeof callback === 'function') callback();

                return;
            }

            // basic math variables
            var _second = 1000,
                _minute = _second * 60,
                _hour = _minute * 60,
                _day = _hour * 24;

            // calculate dates
            var day = Math.floor(difference / _day),
                hour = Math.floor((difference % _day) / _hour),
                minute = Math.floor((difference % _hour) / _minute),
                second = Math.floor((difference % _minute) / _second);

                // fix dates so that it will show two digets
               var days = (String(day).length >= 2) ? day : '0' + day;
               var hours = (String(hour).length >= 2) ? hour : '0' + hour;
               var minutes = (String(minute).length >= 2) ? minute : '0' + minute;
               var seconds = (String(second).length >= 2) ? second : '0' + second;
            var qihao = settings.qi;
            // based on the date change the refrence wording
            var ref_days = (days === 1) ? '天' : '天',
                ref_hours = (hours === 1) ? '时' : '时',
                ref_minutes = (minutes === 1) ? '分' : '分',
                ref_seconds = (seconds === 1) ? '秒' : '秒';
            var ms = minute*60+second;
            var qz = 30;
            var fd = 90;
            var cha = 600-ms;
            if(cha <= 30) {
                container.prev().html('<p id="kjqihao">第'+qihao+'期<span style="color:red;font-size:22px;" class="touzhuinfo">抢庄</span>中</p>');
                 if($('#shangzhuang').attr('disabled')) {
                $('#shangzhuang').prop('disabled',false);
               }
                if(cha >= 20) {
                    layer.tips(30-cha, '.touzhuinfo', {
                    tips: [3, 'rgba(0,0,0,0.3)'], //还可配置颜色
                    time:600,
                });
                }
                
            }else if(cha > 30 && cha <= 510) {
               container.prev().html('<p id="kjqihao">第'+qihao+'期<span style="color:red;font-size:22px;" class="touzhuinfo">投注</span>中</p>');
               if(!$('#shangzhuang').attr('disabled')) {
                $('#shangzhuang').attr('disabled','disabled');
               }
               if(cha >= 500) {
                 layer.tips(510-cha, '.touzhuinfo', {
                    tips: [3, 'rgba(0,0,0,0.3)'], //还可配置颜色
                    time:600,   
                });
               }          
            }else if(cha > 510) {
               container.prev().html('<p id="kjqihao">第'+qihao+'期<span style="color:red;font-size:22px;" class="touzhuinfo">封单</span>中</p>');
               if(cha >= 590) {
                    layer.tips(600-cha, '.touzhuinfo', {
                    tips: [3, 'rgba(0,0,0,0.3)'], //还可配置颜色
                    time:600,   
                });
               }
            }
            //写入容器
            container.find('.minutes').text(minutes);
            container.find('.seconds').text(seconds);
            container.find('.minutes_ref').text(ref_minutes);
            container.find('.seconds_ref').text(ref_seconds);
        };
        // start
        var interval = setInterval(countdown, 1000);
    };

})(jQuery);