<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css" />
        <link href="${pageContext.request.contextPath}/static/assets/css/codemirror.css" rel="stylesheet">
		<!--[if IE 7]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>
		<!--[if lt IE 9]>
		<script src="${pageContext.request.contextPath}/static/assets/js/html5shiv.js"></script>
		<script src="${pageContext.request.contextPath}/static/assets/js/respond.min.js"></script>
		<![endif]-->
        		<!--[if !IE]> -->
		<script src="${pageContext.request.contextPath}/static/assets/js/jquery.min.js"></script>        
		<!-- <![endif]-->
           	<script src="${pageContext.request.contextPath}/static/assets/dist/echarts.js"></script>
        <script src="${pageContext.request.contextPath}/static/assets/js/bootstrap.min.js"></script>
        
      
       <title>无标题文档</title>
       </head>
		
<body>
<div class="page-content clearfix">
 <div class="alert alert-block alert-success">
 <h2><font face="楷体" >欢迎使用"当当书城"后台管理系统1.0</font></h2> 
  
 </div>
  <div class="alert alert-block alert-success">
 
  <i class="icon-ok green"></i><strong class="green">以下为管理系统快捷通道，祝您生活愉快！</strong>
 </div>
 <div class="state-overview clearfix">
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                      <a href="#" title="当当书城用户活跃数"/>
                          <div class="symbol terques">
                             <i class="icon-user"></i>
                          </div>
                          <div class="value">
                              
                              <p>用户数量</p>
                              <p>${customerCount}人</p>
                          </div>
                       
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">                   
                        <a href="${pageContext.request.contextPath}/adminBook/toBookList" title="当当书城图书分类"/>
                          <div class="symbol red">
                              <i class="icon-tags"></i>
                          </div>
                          <div class="value">
                              <p>图书分类</p>
                              <p>${bookTypeCount}种</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                       <a href="${pageContext.request.contextPath}/index.jsp" target="_index" title="即将前往书城前台页面"/>
                          <div class="symbol yellow">
                              <i class="icon-shopping-cart"></i>
                          </div>
                          <div class="value">
                              <p>去商城转转</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                      <!-- 去销量页面 -->
                          <div class="symbol blue">
                              <i class="icon-bar-chart"></i>
                          </div>
                          <div class="value">
                              <h1></h1>
                              <p>图书销量</p>
                          </div>
                      </section>
                  </div>
              </div>
             <!--实时交易记录-->
             
             <!-- 
             <div class="clearfix">
             <div class="t_Record">
               <div id="main" style="height:300px; overflow:hidden; width:100%; overflow:auto" ></div>     
              </div>
         </div>
  -->
<script type="text/javascript">
     $(document).ready(function(){
		 
		  $(".t_Record").width($(window).width()-320);
		  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		 $(".t_Record").width($(window).width()-320);
		});
 });
	 
	 
        require.config({
            paths: {
                echarts: '../static/assets/dist'
            }
        });
        require(
            [
                'echarts',
				'echarts/theme/macarons',
                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/bar'
            ],
            function (ec,theme) {
                var myChart = ec.init(document.getElementById('main'),theme);
               option = {
    title : {
        text: '月购买订单交易记录',
        subtext: '实时获取用户订单购买记录'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['   所有订单','待付款','已付款','代发货']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'所有订单',
            type:'bar',
            data:[120, 49, 70, 232, 256, 767, 1356, 1622, 326, 200,164, 133],
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            }           
        },
        {
            name:'待付款',
            type:'bar',
            data:[26, 59, 30, 84, 27, 77, 176, 1182, 487, 188, 60, 23],
            markPoint : {
                data : [
                    {name : '年最高', value : 1182, xAxis: 7, yAxis: 1182, symbolSize:18},
                    {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
                ]
            },
           
			
        }
		, {
            name:'已付款',
            type:'bar',
            data:[26, 59, 60, 264, 287, 77, 176, 122, 247, 148, 60, 23],
            markPoint : {
                data : [
                    {name : '年最高', value : 172, xAxis: 7, yAxis: 172, symbolSize:18},
                    {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
                ]
            },
           
		}
		, {
            name:'代发货',
            type:'bar',
            data:[26, 59, 80, 24, 87, 70, 175, 1072, 48, 18, 69, 63],
            markPoint : {
                data : [
                    {name : '年最高', value : 1072, xAxis: 7, yAxis: 1072, symbolSize:18},
                    {name : '年最低', value : 22, xAxis: 11, yAxis: 3}
                ]
            },
           
		}
    ]
};
                    
                myChart.setOption(option);
            }
        );
    </script> 
     </div>
</body>
</html>
