

//프로필 클릭시 나타나는 메뉴리스트 전용
let profile = document.querySelector('#profile');
let welcome = document.querySelector('#welcome'); //환영합니다 화살표 바꿔주기위한 변수
let profileMenu = document.querySelector('.profileMenu');

console.log(welcome.innerText.indexOf('⬆'));

//프로필 클릭 시 프로필메뉴를 보이자.
if(profile!=null){
	profile.addEventListener('click',function(){
		
		//str.indexOf('') : 문자열 찾으면 문자열 인덱스 반환, 못찾으면 -1 반환 
		if(welcome.innerText.indexOf('⬆')>-1){
			welcome.innerText=welcome.innerText.replace('⬆','⬇');
			profileMenu.style.display='none';
		}else{
			welcome.innerText=welcome.innerText.replace('⬇','⬆');
			profileMenu.style.display='flex';
		}
	})
		
}