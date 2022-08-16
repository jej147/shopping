function CheckAddProduct() {

	var pId = document.getElementById("pId");
	var name = document.getElementById("name");
	var pPrice = document.getElementById("pPrice");
	
	// 상품아아디 체크
	if (!check(/^P[0-9]{4,11}$/, pId,
			"[상품 코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요"))
		return false;
	// 상품명 체크
	if (name.value.length < 4 || name.value.length > 12) {
		alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	// 상품 가격 체크
	if (pPrice.value.length == 0 || isNaN(pPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		pPrice.select();
		pPrice.focus();
		return false;
	}

	if (pPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		pPrice.select();
		pPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, pPrice,
			"[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;

	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newProduct.submit()
}
