var Countdown = function()
{
	return {
		interval : 1000,
		timer : {},
		lang : {
			'sec' : '',
			'min' : '',
			'hour' : '0',
			'day' : '',
			'mon' : '',
			'year' : ''
		},
		init : function(from, displayId, goodsno, type)
		{
			var self = this;

			self.timer[displayId] = {};
			self.timer[displayId]['date'] = self.getDate(from);
			self.timer[displayId]['element'] = document.getElementById(displayId);
			self.timer[displayId]['timer'] = setInterval(function()
			{
				self.display(displayId, goodsno, type);
			}, self.interval);

			self.display(displayId, goodsno, type);
		},
		display : function(displayId, goodsno, type)
		{
			var self = this;

			var from = self.timer[displayId]['date'];
			var now = new Date();

			var diff = Math.floor(from.getTime() - now.getTime()) / 1000;
			var diffDay = Math.floor(diff / 24 / 60 / 60);

			if (diff <= 0 ) {
							
				/*if(goodsno)
					location.href = "goods_timesale_list.php?goodsno=" + goodsno;
				else
					location.reload();
				**/
			
				return;
			}
			diff -= diffDay * 24 * 60 * 60;
			var diffHour = Math.floor(diff / 60 / 60);
			diff -= diffHour * 60 * 60;
			var diffMin = Math.floor(diff / 60);
			diff -= diffMin * 60;
			var diffSec = Math.floor(diff);

			var ret = [];
			
			if(displayId == "gnb_time_sale")
			{
				if(diffSec==0||diffSec==1||diffSec==2||diffSec==3||diffSec==4||diffSec==5||diffSec==6||diffSec==7||diffSec==8||diffSec==9) {
					ret.push('0' + diffSec + self.lang.sec);
				} else {
					ret.push(diffSec + self.lang.sec);
				}
				
				if(diffMin==0||diffMin==1||diffMin==2||diffMin==3||diffMin==4||diffMin==5||diffMin==6||diffMin==7||diffMin==8||diffMin==9) {
					ret.unshift("0" + diffMin + self.lang.min);
				} else {
					ret.unshift(diffMin + self.lang.min);
				}
				

				if(diffHour==0||diffHour==1||diffHour==2||diffHour==3||diffHour==4||diffHour==5||diffHour==6||diffHour==7||diffHour==8||diffHour==9) {
					ret.unshift(self.lang.hour + diffHour);
				} else {
					ret.unshift(diffHour);
				}

				if (diffDay != 0) {
					//ret.unshift(diffDay + self.lang.day);
				}
				self.timer[displayId]['element'].innerHTML = ret.join(':');
			}
			else if( type)
			{

				ret.push('<span class="time_con">' + Math.floor(diffHour / 10) +'</span>');
				ret.push('<span class="time_con">' +  Math.floor(diffHour % 10) +'</span>');
				ret.push('<span class="conlon">:</span>');

				ret.push('<span class="time_con">' + Math.floor(diffMin / 10) +'</span>');
				ret.push('<span class="time_con">' +  Math.floor(diffMin % 10) +'</span>');
				ret.push('<span class="conlon">:</span>');

				ret.push('<span class="time_con">' + Math.floor(diffSec / 10) +'</span>');
				ret.push('<span class="time_con">' +  Math.floor(diffSec % 10) +'</span>');
				
				self.timer[displayId]['element'].innerHTML = ret.join('');
			}
			else
			{
				if(diffSec==0||diffSec==1||diffSec==2||diffSec==3||diffSec==4||diffSec==5||diffSec==6||diffSec==7||diffSec==8||diffSec==9) {
					ret.push('<div class="today-timer">' +'0' + diffSec + self.lang.sec +'</div>');
				} else {
					ret.push('<div class="today-timer">' +diffSec + self.lang.sec +'</div>');
				}
				
				if(diffMin==0||diffMin==1||diffMin==2||diffMin==3||diffMin==4||diffMin==5||diffMin==6||diffMin==7||diffMin==8||diffMin==9) {
					ret.unshift('<div class="today-timer">' + "0" + diffMin + self.lang.min   + '</div>');
				} else {
					ret.unshift('<div class="today-timer">' + diffMin + self.lang.min  + '</div>');
				}
				

				if(diffHour==0||diffHour==1||diffHour==2||diffHour==3||diffHour==4||diffHour==5||diffHour==6||diffHour==7||diffHour==8||diffHour==9) {
					ret.unshift('<div class="today-timer">' + self.lang.hour + diffHour + '</div>');
				} else {
					ret.unshift('<div class="today-timer">' + diffHour + '</div>');
				}

				if (diffDay != 0) {
					//ret.unshift(diffDay + self.lang.day);
				}
				self.timer[displayId]['element'].innerHTML = ret.join('<div class="today-timer1"></div>');
			}
			
		},
		getDate : function(date)
		{
			var year = parseInt(date.substring(0, 4), 10);
			var mon = parseInt(date.substring(5, 7) - 1, 10);
			var day = parseInt(date.substring(8, 10), 10);
			var hour = parseInt(date.substring(11, 13), 10);
			var min = parseInt(date.substring(14, 16), 10);
			var sec = parseInt(date.substring(17, 19), 10);

			return new Date(year, mon, day, hour, min, sec);
		}
	};
}();
