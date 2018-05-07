// 写入一个投注图案
function addTouzhu(i,w) {
	var a = '<div number="'+i+'"><img src="/static/images/'+i+'.png" alt=""></div>';
	var z = $('.touzhukuang');
	var zd = $('.touzhukuang > div');
	if($('#wanfa').val() == 2) {
			// if($('.touzhukuang > div').length < 2) {
			// 	if($('.touzhukuang > div').length == 0) {
			// 	$('.touzhukuang').append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
			// }
			// $('.touzhukuang').append(a);
			if(w == 'danya') {
				console.log('现在是2骰单压');
				if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
				z.append(a);
			}else if(w == 'erzhonger') {
				if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
				z.append(a);
				console.log('现在是2骰二中二');
			}else if(w == 'duizi') {
				if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
				z.append(a);
				console.log('现在是2骰对子');
			}
	} else if($('#wanfa').val() == 3) {
		// if($('.touzhukuang > div').length < 3) {
		// 	if($('.touzhukuang > div').length == 0) {
		// 		$('.touzhukuang').append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
		// 	}
		// $('.touzhukuang').append(a);
		if(w == 'danya') {
			if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
			z.append(a);
			console.log('现在是3骰单压');
		}else if(w == 'erzhonger') {
			if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
			z.append(a);
			console.log('现在是3骰二中二');
		}else if(w == 'baozi') {
			if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
			z.append(a);
			console.log('现在是3骰豹子');
		}
	} 
	}
//给图案添加点击效果
function tuanCurrent($this) {
	$this.addClass('gameimgcurrent');
	setTimeout(function(){
		$this.removeClass('gameimgcurrent');
	},100);
}
//删除一个已选投注图案
function removeTouzhu(i) {
	$('.touzhukuang > [number='+i+']').remove();
}
//删除所有投注图案
function dropTouzhu() {
	$('.touzhukuang').empty();
}
//获取当前下注信息
function getTouzhu() {
	var t = $('.touzhukuang > div');
	var zhunum = '';
	t.each(function(i,v){
		zhunum += $(this).attr('number')+',';
	});
	return zhunum.substring(0,zhunum.length-1);
}
// 查看当前筹码是否被选中
function choumaCurrent($this) {
	return $this.hasClass('choumacurrent');
}
// 查看当前图案是否被选中
function gameimgCurrent($this) {
	return $this.hasClass('gameimgcurrent');
}
// 获取当前选中的投注图案数量
function gameimgnum() {
	var num = 0;
	var divs = $('.gamecontrol > div');
	divs.each(function(index,val){
		if($(val).hasClass('gameimgcurrent')){
			num++;
		}
	});
	return num;
}
// 获取当前玩法
function getGameMethod() {
	return $('#wanfa').val();
}
// 设置当前玩法CSS类
function setGameMethod() {
	if($('#wanfa').val() == 2){
		$('#gameTwo').addClass('gamecurrent');
	} else if($('#wanfa').val() == 3) {
		$('#gameThree').addClass('gamecurrent');
	}
}
// 获取当前选中筹码值
function getChouma() {
	var s = $('.choumaimg');
	var money = 0;
	s.each(function(i,v){
		if($(v).hasClass('choumacurrent')) {
			money = $(this).attr('money');
		
		}
	});
		return money;
}
// 获取选中的投注图案信息
function getTouZhu() {
	var a = $('.gamecontrol > div');
	var zhu = '';
	a.each(function(i,v){

	});
}
function getQiHao() {//获取当前期号和开奖时间
	var qihao;
		$.ajax({
		          	url:"/getqihao",
            		type:"get",
            		dataType:"json",
            		async:false,
            		success:function(data){
            			qihao = $.parseJSON(data);
            		},
            		error:function(data){
                	
           		}
        			});
		return qihao;
}
function getYaZhuBtn() {
	var b = $('#wfbtn > button');
	var t = '';
	b.each(function(i,v){
			if($(v).hasClass('btn-danger')) {
				t = $(this).attr('id');
			}
	});
	return t;
}
function cDate() {
			var qihao  = getQiHao();
			var kjsj   = qihao.kjsj;
			var myDate = new Date();
			//获取当前年
			var year   = myDate.getFullYear();
			//获取当前月
			var month  = myDate.getMonth() + 1;
			//获取当前日
			var date   = myDate.getDate();
			var h      = myDate.getHours(); //获取当前小时数(0-23)
			var m      = myDate.getMinutes(); //获取当前分钟数(0-59)'4/28/2019 11:02:00'
			var str    = month+'/'+date+'/'+year+' '+kjsj;
			var qi     = year+'-'+month+'-'+date+'-'+qihao.qihao;
			var data   = {sj:str,qi:qi};
    	return data;
}


function checkplayed(moeny){
	var played = getYaZhuBtn();
	var codeToStr   = getTouzhu();
	var codeToArr   = codeToStr.split(",");
	var moeny  =  moeny ? moeny : getChouma();
	console.log(codeToArr);
	if(played == 'danya'){
		return danya(codeToArr,moeny);
	}else if(played == 'erzhonger'){
		return erzhonger(codeToArr,moeny);
	}
}
// 单压
function danya(code,moeny){
	var data;

}

function erzhonger(code,moeny){
	var data = {};
	var ncode = code.sort();
	var zcode = new Array();
	var index = 0;
	for (var i = 0; i < ncode.length; i++) {
		if(ncode[i] == ncode[i+1] || code.length < 2){
			layer.alert('二中二模式需要选择两个或两个以上不同的号码搭配投注', {
			  icon: 5
			})
			return false;
		}
	}
	for (var i = 0; i < ncode.length-1; i++) {
		for (var j = i+1; j < ncode.length; j++) {
			zcode[index] = ncode[i] +','+ncode[j];
		index++;
		}
	}
	var odds = zcode.length;
	var zmoeny = odds * moeny;
	data.odds = odds;
	data.moeny = zmoeny;
	data.code = zcode.join("|");
	return data;
}