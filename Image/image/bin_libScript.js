function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

function clearlist(listname){
      for (var i = listname.options.length - 1 ; i >= 0 ; i--) { listname.options[i] = null; } 
	  return "";
}
function loadlist(listname){

	/*  for (var i = 0 ; i < 10; i++){
	  	  tmp = i+1;	
	      var option = new Option("a","b");
		  listname.options[i] = option;
	  }*/
	  alert('hello');
	  return "";
}	  
function trim(s) {
  while (s.substring(0,1) == ' ') {
    s = s.substring(1,s.length);
  }
  while (s.substring(s.length-1,s.length) == ' ') {
    s = s.substring(0,s.length-1);
  }
  return s;
}
function chk_sm(){
	if(document.frmlich.id_tuan.value==''){
		alert('Phai chon tuan');document.frmlich.sotuan.focus();return false;
	}
	tm2=trim(document.frmlich.t2.value);
	tm3=trim(document.frmlich.t3.value);
	tm4=trim(document.frmlich.t4.value);
	tm5=trim(document.frmlich.t5.value);	
	tm6=trim(document.frmlich.t6.value);	
	tm7=trim(document.frmlich.t7.value);	
	cnm=trim(document.frmlich.cn.value);		
	if((tm2=='')&&(tm3=='')&&(tm4=='')&&(tm5=='')&&(tm6=='')&&(tm7=='')&&(cnm=='')){
		alert('Phai nhap noi dung');document.frmlich.t2.focus();return false;
	}
	return true;
}

