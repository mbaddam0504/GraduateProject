/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function ImageOrVideo(){
    var imageOrVideo = document.getElementsByName("fileType");
    //alert("value"+imageOrVideo);
    if(imageOrVideo[0].checked){
        //alert("image selected");
        document.getElementById("uploadImage").setAttribute("accept", "image/*");
    }else if(imageOrVideo[1].checked){
        document.getElementById("uploadImage").setAttribute("accept", "video/*");
       // alert("video selected");
//    }else{
//        confirm("select image or video");
//        document.getElementById("uploadImage").blur();
//        document.getElementById("inputradio").focus();
//        
//       // document.getElementById("uploadImage").disabled=true;
//        
//       // document.getElementById("uploadImage").disabled=false;
//        
//    }
    }
}
