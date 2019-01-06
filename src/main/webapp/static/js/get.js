function loadImg(){
    //获取文件
    var file = $("#imgForm").find("input")[0].files[0];
 
    //创建读取文件的对象
    var reader = new FileReader();
 
    //创建文件读取相关的变量
    var imgFile;
 
    //为文件读取成功设置事件
    reader.onload=function(e) {
        alert('文件读取完成');
        imgFile = e.target.result;
        console.log(imgFile);
        $("#imgContent").attr('src', imgFile);
    };
 
    //正式读取文件
    reader.readAsDataURL(file);
}