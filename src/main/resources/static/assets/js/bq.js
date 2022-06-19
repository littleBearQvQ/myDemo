
	//鼠标点击特效
    //页面加载事件
	//request  response  request  response
    jQuery(function () {
    	//使文字不被选中
        $("html").css({"user-select": "none"});
        var count =0;
        //给页面创建点击事件
        $("html").click(function (element) {
        	count++;
        	//alert(element.pageX+element.pageY);
            //创建颜色库
            //随机颜色
            //创建颜色码
            const color_1 = new Array('00', '11', '22', '33', '44', '55', '66', '77', '88', '99',
                'aa', 'bb', 'cc', 'dd', 'ee', 'ff');
            const color_2 = new Array('00', '11', '22', '33', '44', '55', '66', '77', '88', '99',
                'aa', 'bb', 'cc', 'dd', 'ee', 'ff');
            const color_3 = new Array('00', '11', '22', '33', '44', '55', '66', '77', '88', '99',
                'aa', 'bb', 'cc', 'dd', 'ee', 'ff');

            //从颜色库选取一种颜色;当然这是数组的方式;随机性
            var color_1_1 = Math.floor(Math.random() * color_1.length);
            var color_2_1 = Math.floor(Math.random() * color_2.length);
            var color_3_1 = Math.floor(Math.random() * color_3.length);

             /*console.log("前颜色码 = " + color_1_1 + "; 中颜色码 = " + color_2_1 + "; 后颜色码 = " + color_3_1 + ";")
             console.log("#" + color_1[color_1_1] + color_2[color_2_1] + color_3[color_3_1]);*/

            //创建元素; 创建的元素是span元素
            var pic=['😀','😁','😂','😃','😄','😅','😆','😇','😈','😉','😊','😋','😌','😍','😎','😏','😐','😑','😒'
                     ,'😓','😔','😕','😖','😗','😘','😙','😚','😛','😜','😝','😞','😟','😠','😡','😢','😣','😤','😥','😦','😧','😨'
                     ,'😩','😪','😫','😬','😭','😮','😯','😰','😱','😲','😳','😴','😵','😶','😷'];
            
            var content=["╭(●｀∀´●)╯","ヾ(*´▽‘*)ﾉ","╭(′▽`)╭(′▽`)╯","( ‘-ωก̀ )","(ฅ´ω`ฅ)","嘤嘤嘤","٩(๑´0`๑)۶",
                         "(｀д′)","(`･ω･´)"];
             
            var num = parseInt(Math.random() * pic.length);
            var size = parseInt(Math.random() * 30 + 15);
            var size_2 = parseInt(Math.random() * 20 + 10);
            var size_3 = parseInt(Math.random() * 10 + 5);
            var contentNum = parseInt(Math.random() * content.length);
        	
            //alert(num);
            
            var newContent = $("<span>").text(pic[num]).css({"font-size":size+"px"});
            var newContent_2 = $("<span>").text(content[contentNum]).css({"font-size":size_2+"px"});
            var newContent_3 = $("<span>").text("❤").css({"font-size":size_3+"px"});
            //在页面上添加span元素
            jQuery("html").append(newContent);
          
             //每3次点击弹出一个颜表情
            if(count%3==0){
            	//alert("s");
            	//alert(count);           	
            	jQuery("html").append(newContent_2);           	 
            }
              
               //每2次点击弹出一个心心
            if(count%2==0){
            	//alert("s");
            	//alert(count);           	
            	jQuery("html").append(newContent_3);    	 
            }
            
            //获取鼠标点击坐标
            var x = element.pageX;
            var y = element.pageY;
           var x_index = parseInt(Math.random() * 180);
           var y_index = parseInt(Math.random() * 180);
            //给span元素添加css样式
            newContent.css({
                "z-index": 999, //设置或获取定位对象的堆叠次序(z-index):999
                "top": y-20, //上(top):y-20
                "left": x+10, //左:x
                "position": "absolute", //定位:绝对定位
                
            });
          //给span元素添加动画
            newContent.animate({
                    "top": y - y_index, //上:y-180 
                    "left":x-x_index,
                    "opacity": 0 //透明度(opacity):0 
                }, 2000, //1500,调节动画速度 
                function () { //功能函数 
                	newContent.remove(); //$i的删除
                }
            );
            //alert(count);
            newContent_2.css({
                "z-index": 999, //设置或获取定位对象的堆叠次序(z-index):999
                "top": y-40, //上(top):y-20
                "left": x+20, //左:x
                "position": "absolute", //定位:绝对定位
                "font-weight": "bold", //字体粗细:粗体
                "color": "#" + color_1[color_1_1] + color_2[color_2_1] + color_3[color_3_1], //颜色:绿色
            });
	       newContent_2.animate({
	           "top": y - x_index, //上:y-180 
	           "left":x-y_index,
	           "opacity": 0//透明度(opacity):0 
	       }, 2000, //1500,调节动画速度 
	       function () { //功能函数 
	       	newContent_2.remove(); //$i的删除
	       }
	   );
	       
	       newContent_3.css({
               "z-index": 999, //设置或获取定位对象的堆叠次序(z-index):999
               "top": y-10, //上(top):y-20
               "left": x, //左:x
               "position": "absolute", //定位:绝对定位
               "color":"red"
           });
         //给span元素添加动画
           newContent_3.animate({
                   "top": y-50, //上:y-180 
                   "left":x,
                   "opacity": 0 //透明度(opacity):0 
               }, 2000, //1500,调节动画速度 
               function () { //功能函数 
               	newContent_3.remove(); //$i的删除
               }
           );
            
           
        })
    })
