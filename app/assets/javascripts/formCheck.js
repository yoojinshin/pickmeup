
//회원가입 시, 폼 체크
function joinCheck(obj){
    if(!obj.email.value || obj.email.value.trim().length == 0){
        alert("이메일이 입력되지 않았습니다");
        obj.email.value = ""
        obj.email.focus();
        return false;
    }
    if(!obj.password.value || obj.password.trim().length == 0){
        alert("비밀번호가 입력되지 않았습니다");
        obj.password.value = ""
        obj.password.focus();
        return false;
    }
    if(!obj.userName.value || obj.userName.trim().length == 0){
        alert("사용자 이름이 입력되지 않았습니다");
        obj.userName.value = ""
        obj.userName.focus();
        return false;
    }
    if(!obj.phoneNum.value || obj.phoneNum.trim().length == 0){
        alert("전화번호가 입력되지 않았습니다");
        obj.phoneNum.value = ""
        obj.phoneNum.focus();
        return false;
    }
    if(!obj.birth.value || obj.birth.trim().length == 0){
        alert("태어난 년도가 입력되지 않았습니다");
        obj.birth.value = ""
        obj.birth.focus();
        return false;
    }
    if(!obj.gender.value || obj.password.trim().length == 0){
        alert("성별이 입력되지 않았습니다");
        obj.gender.value = ""
        obj.gender.focus();
        return false;
    }
    return true;
}



