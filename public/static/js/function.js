// 写入一个投注图案
var playedID;
function addTouzhu(i,w) {
	var a = '<div number="'+i+'"><img src="/static/images/'+i+'.png" alt=""></div>';
	var z = $('.touzhukuang');
	var zd = $('.touzhukuang > div');
	if($('#gameTwo').hasClass('gamecurrent')) {
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
				playedID = 1;
				z.append(a);
			}else if(w == 'erzhonger') {
				if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
				playedID = 2;
				z.append(a);
				console.log('现在是2骰二中二');
			}else if(w == 'duizi') {
				if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
				playedID = 3;
				z.append(a);
				console.log('现在是2骰对子');
			}
	} else if($('#gameThree').hasClass('gamecurrent')) {
		// if($('.touzhukuang > div').length < 3) {
		// 	if($('.touzhukuang > div').length == 0) {
		// 		$('.touzhukuang').append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
		// 	}
		// $('.touzhukuang').append(a);
		if(w == 'danya') {
			if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
				playedID = 4;
			z.append(a);
			console.log('现在是3骰单压');
		}else if(w == 'erzhonger') {
			if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
				playedID = 5;
			z.append(a);
			console.log('现在是3骰二中二');
		}else if(w == 'baozi') {
			if(zd.length == 0){
					z.append('<button class="btn btn-danger" id="qingkong" onClick="dropTouzhu()">清空</button>');
				}
				playedID = 6;
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
// 获取UID
function getUid(){
	var uid;
	$.ajax({
		url:'/getUserId',
		type:"post",
		success:function(data){
			uid = data;
		}


	});
	return uid;
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
// 更新页面余额
function getMoney(){
	var uid = $('#uid').val();
	$.ajax({
		url:'/getUserCoin',
		type:"post",
		data:{'id':uid},
		dataType:'json',
		async:false,
		success:function(data){
			$('#userMoney').text("余额："+data);
		},
		error:function(data){
		}
	})
}



function getYaZhuBtn() {
	var b = $('.played > button');
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
			var qi     = qihao.qihao;
			var data   = {sj:str,qi:qi};
    	return data;
}

/**
 * [getqihao 获取页面日期]
 * @return {[type]} [description]
 */
function getqihao(){
	var qihaos  = $('#kjqihao').text();
	var qihaos = qihaos.match(/[0-9]*/g);
	var qihao = qihaos[1];
	return qihao;
}


// 下注合法性检查 不同的模式用不同的方法检查
// 返回data对象 计算出需要展示的数据:
// 	data.odds  一共选择的注数
// 	data.code  计算出下注号码
// 	data.money 最终的下注金额
// 	在此更改下注约束逻辑
function checkplayed(money){
	var played    = getYaZhuBtn();
	var playedId  = playedID;
	var codeToStr = getTouzhu();
	var codeToArr = codeToStr.split(",");
	var money     =  money ? money : getChouma();
	var setting   = getSetting();
	var maxamount = parseInt(setting.maxamount);
	var minamount = parseInt(setting.minamount); 
	var touzhuinfo= $('.touzhuinfo').text();
	var qihao = getqihao();
	// var SysActionNo = getActionNo();
	// return false;
	if(money > maxamount){
		layer.alert('下注金额大于最大投注额:'+maxamount, {
			  icon: 5
			});
		return false;
	}else if(money < minamount){
		layer.alert('下注金额小于最小投注额:'+minamount, {
			  icon: 5
			});
		return false;
	}else if(touzhuinfo != '投注'){
		layer.alert(touzhuinfo+'时间不允许下注', {
			  icon: 5
			});
		return false;
	}


	if(played == 'danya'){
		return danya(codeToArr,money,qihao,playedId);
	}else if(played == 'erzhonger'){
		return erzhonger(codeToArr,money,qihao,playedId);
	}else if(played == 'baozi'){
		return baozi(codeToArr,money,qihao,playedId);
	}else if(played == 'duizi'){
		return duizi(codeToArr,money,qihao,playedId);
	}
}

// 获取后台的设置参数
function getSetting(){
	var vdata;
	$.ajax({
      	url:"/getSetting",
		type:"post",
		dataType:"json",
		async:false,
		success:function(data){
			vdata = $.parseJSON(data);

		},
		error:function(data){
    	
		}
	});
	return vdata;
}





// 对子
 function duizi(code,money,qihao,playedId){
	var data  = {};
	var zcode = '';
	var index = 0;
	if(code.length > 1){
 			layer.alert('对子模式:请选择一个号码');
 			return false;
 	}
		zcode         = code[0] +'|'+ code[0];
		data.odds     = code.length;
		data.money    = money;
		data.playedId = playedId;
		data.qihao    = qihao;
		data.code     = zcode;
 	return data;
 }

// 豹子
 function baozi(code,money,qihao,playedId){
	var data  = {};
	var zcode = '';
	var index = 0;
 		if(code.length > 1){
 			layer.alert('豹子模式:请选择一个号码');
 			return false;
 		}
		zcode  = code[0] +'|'+ code[0] +'|'+ code[0];
		
		data.odds     = code.length;
		data.money    = money;
		data.qihao    = qihao;
		data.playedId = playedId;
		data.code     = zcode;
 	return data;
 }

// 单压
function danya(code,money,qihao,playedId){
	var data      = {};
	var zcode     = new Array();
	data.odds     = code.length;
	data.money    = data.odds * money;
	data.qihao    = qihao;
	data.playedId = playedId;
	data.code     = code.join("|");
	// console.log(data);
	return data;

}

// 二中二下注检查
function erzhonger(code,money,qihao,playedId){
	var data  = {};
	var ncode = code.sort();
	var zcode = new Array();
	var index = 0;
	for (var i = 0; i < ncode.length; i++) {
		if(ncode[i] == ncode[i+1] || code.length < 2){
			layer.alert('二中二模式:需要选择两个或两个以上不同的号码搭配投注', {
			  icon: 5
			})
			return false;
		}
	}
	// 笛卡尔积算法
	for (var i = 0; i < ncode.length-1; i++) {
		for (var j = i+1; j < ncode.length; j++) {
			zcode[index] = ncode[i] +','+ncode[j];
		index++;
		}
	}
	var odds      = zcode.length;
	var zmoney    = odds * money;
	data.odds     = odds;
	data.money    = zmoney;
	data.qihao    = qihao;
	data.playedId = playedId;
	data.code     = zcode.join("|");
	return data;
}


/**
 * [two 切换两骰和三骰]
 * @return {[type]} [description]
 */
function twoAndThree(){
	$('.TT').toggle();
	$('#two').toggle();
	$('#three').toggle();
	$('#gameTwo').toggleClass('gamecurrent');
	$('#gameThree').toggleClass('gamecurrent');
	if($('#gameTwo').hasClass('gamecurrent')){
		$('.twwf').addClass('played');
		$('.thwf').removeClass('played');
	}else{
		$('.thwf').addClass('played');
		$('.twwf').removeClass('played');
	}


}


/**
 * [getCode 获取开奖号码]
 * 实现功能
 * 倒计时结束获取最新一期的开奖号 并且更新开奖记录
 * @return {[type]} [description]
 */
function getCode(){
	var qihao = getqihao();

	$.ajax({
		url:"/getCode",
		type:"post",
		dataType:"json",
		success:function(data){
			$('.shangqi > div > img').each(function(i){
				$(this).attr('src',"/static/images/"+data[i]+".png");
			})
		},
		error:function(){

			
		}
	});

}

/**
 * [showbet 获取下注记录]
 * @return {[type]} [description]
 */
function showBet(){
	// layer.load();
	$.ajax({
		url:'/getBetList',
		type:'post',
		dataType:"json",
		success:function(data){
			var codestr = '';
			for (var i = data.length - 1; i >= 0; i--) {
				codestr += "<tr>";
				codestr += "<td>"+data[i].actionTime+"</td>";
				codestr += "<td>"+data[i].orderId+"</td>";
				codestr += "<td>"+data[i].actionNo+"</td>";
				codestr += "<td>"+data[i].actionData+"</td>";
				codestr += "<td>"+data[i].playedId+"</td>";
				codestr += "<td>"+data[i].amount+"</td>";
				codestr += data[i].zjamount;
				codestr += data[i].state;
				codestr += "</tr>";
			}
				$('#betList').html(codestr);
				$('#bet').show();
		},
		error:function(){

		}

	})
}

/**
 * [Vrecharge 充值页面弹窗]
 */
function Vrecharge(){
	layer.open({
      type: 2,
      title: '鱼虾蟹用户充值。',
      shadeClose: true,
      shade: false,
      maxmin: true, //开启最大化最小化按钮
      area: ['893px', '750px'],
      content: '/Vrecharge'
    });
}
/**
 * [withdraw 提现页面弹窗]
 * @return {[type]} [description]
 */
function withdraw(){
	layer.open({
      type: 2,
      title: '鱼虾蟹用户提现。',
      shadeClose: true,
      shade: false,
      maxmin: true, //开启最大化最小化按钮
      area: ['893px', '750px'],
      content: '/withdraw'
    });
}


/**
 * [checkOline 检查用户还在线]
 * @return {[type]} [description]
 */
function checkOline(){
	$.ajax({
		url:'/checkOnline',
		type:'post',
		dataType:"json",
		success:function(data){
			if(data != 'yes'){
				layer.alert('您已在别处登录!请重新登录',{icon:3,close:false},function(){
					window.location.reload();
				});
			}
		},
		error:function(){

		}
	})
}