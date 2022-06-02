function loginUser() {
	
	if(sessionStorage.getItem("name") == undefined) {
		alert("로그인을 해주세요.");
		window.location.href = "/eleSystem/login";
	} else {
		$("#loginUserName").text(sessionStorage.getItem("name")+"님 로그인");
	}
}

function sideMenu() {
	$("#eleDocSend").off('click').on('click', function(){
		location.href="/eleSystem/eleDocSend";
	});
	
	$("#eleDocRespond").off('click').on('click', function(){
		location.href="/eleSystem/eleDocRespond";
	});
	
	$("#eleDocStatus").off('click').on('click', function(){
		location.href="/eleSystem/eleDocStatus";
	});
	
	$("#eleExcelUpload").off('click').on('click', function(){
		location.href="/eleSystem/eleExcelUpload";
	});
	
	$("#eleDocTemplate").off('click').on('click', function(){
		location.href="/eleSystem/eleDocTemplate";
	});
	
	$("#eleDocReceptionFail").off('click').on('click', function(){
		location.href="/eleSystem/eleDocReceptionFail";
	});
	
	$("#registBtn").off('click').on('click', function() {
		sessionStorage.setItem("btnKinds", "registBtn");
		location.href="/eleSystem/eleDocTemplateReg";
	});
	
	$("#updateBtn").off('click').on('click', function() {
		if($("input[name='updateDataCheck']:checked").val()==undefined) {
			alert("수정할 목록을 선택해주세요.");
		} else {
			sessionStorage.setItem("btnKinds", "updateBtn");
			sessionStorage.setItem("updateList", JSON.stringify(stList[$("input[name='updateDataCheck']:checked").val()]));
			location.href="/eleSystem/eleDocTemplateReg";
		}
	});
	
	//템플릿 삭제
	$("#deleteBtn").off('click').on('click', function() {
		if($("input[name='updateDataCheck']:checked").val()==undefined) {
			alert("삭제할 목록을 선택해주세요.");
		} else {
			var answer = confirm("정말로 데이터를 삭제하시겠습니까?");
			if (answer == true){
				page.templateDelAjax();
			}
		}
	});
	
	//발송데이터 삭제
	$("#sendDataDeleteBtn").off('click').on('click', function() {
		if($("input[name='updateSendDataCheck']:checked").val()==undefined) {
			alert("삭제할 목록을 선택해주세요.");
		} else {
			var answer = confirm("정말로 데이터를 삭제하시겠습니까?");
			if (answer == true){
				page.templateDelAjax();
			}
		}
	});
	
	$("#templateCancelBtn").off('click').on('click', function() {
		sessionStorage.removeItem("btnKinds");
		sessionStorage.removeItem("updateList");
		location.href="/eleSystem/eleDocTemplate";
	});
	
	$("#logOut").off("click").on("click", function() {
		sessionStorage.removeItem("name");
		window.location.href = "/eleSystem/login";
	});
	
	$("#checkAll").off('click').on('click', function(){
		if($("#checkAll").prop("checked")) { $("input[name='updateSendDataCheck']").prop("checked", true); }
		else { $("input[name='updateSendDataCheck']").prop("checked", false); }
	});
	
}














