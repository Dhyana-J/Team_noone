
let button = document.querySelector('#submitBtn'); //정보수정버튼 데이터 가져오기
let infoForm = document.infoForm; //폼에대한 정보 가져오기




button.addEventListener('click',function(){
	
  let userPwd = document.querySelector('#userPwd');
  let checkPwd = document.querySelector('#checkPwd');
  
  if(userPwd.value!=checkPwd.value){ //비밀번호와 비밀번호 확인 다를 경우
	  
    alert('두 비밀번호가 일치하는지 확인해주세요');
    
  }else{// 일치할 경우 submit!
    infoForm.submit();
  }
})
