<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2022-05-15
  Time: PM 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>test</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqgrid/5.7.0/js/jquery.jqGrid.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqgrid/5.7.0/js/i18n/grid.locale-en.min.js" integrity="sha512-Oc3yFMZtHlWgPAVqS+azgzK1R519KJEYiBhi9yr+wdm5PfAJWz960R/EkSXTe352aEZyqVK88u/+qqHaqxaWbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript">
        let searchBtn = "";

        let ColumnName = ['선수명', '나이', '등번호', '포지션', '데뷔일']
        let ColumnModel = [
            {name:'PLAYER_NAME', align:'center'},
            {name:'PLAYER_AGE', align:'center'},
            {name:'PLAYER_BACK_NUMBER', align:'center'},
            {name:'PLAYER_POSITION', align:'center'},
            {name:'PLAYER_DEBUT', align:'center'}
        ];

        $(function (){
            $("#testTable").jqGrid({
                datatype: "local",
                height: 261,
                width: 1019,
                colNames: ColumnName,
                colModel: ColumnModel,
                multiselect:true,
            });
            $("#button1").on("click", function() {
                console.log('click!')
                searchData();
            });
        });

        let data = {
            // "CREATE_USER" : $("#CREATE_USER").val(),
            // "CREATE_DT" : $("#CREATE_DT").val(),
            // "REAMARK" : $("#REMARK").val(),
            // "CD" : $("#CD").val(),
            // "TYPE_CD" : $("#TYPE_CD").val(),

        };

        function searchData(){
            $.ajax({
                url : "/player_list",
                type : "POST",
                datatype : "json",
                data : data,
                success : function (list) {
                    alert('조회 완료!')
                    console.log(list)

                    $('#testTable').clearGridData();
                    $('#testTable').jqGrid('setGridParam', {data: list});
                    $('#testTable').trigger('reloadGrid');
                    // alert(data);
                }
            });
        }




    </script>



</head>
<body>
<div id="loadingImg"></div>
<div id="mainwrap">
    <div id="headerWrap">
        <h1>
            <span class="logo"><a href="#"><img alt="로고" src="../../static/img/layout/logo.png" style="vertical-align: top;" /></a></span>
        </h1>
    </div>

</div>
<div class="search">
    <div class="button" style="float: right">
        <span><a id="button1" style="cursor : pointer"><img alt="조회" src="../../static/img/content/search_btn.png"></a> </span>
    </div>
</div>
<%--<div class="button" >--%>
<%--    <button id="button1">조회</button>--%>
<%--</div>  --%>
<div class="table">
    <table id="testTable"></table>
    <div id="pager" style="float: right"></div>
</div>



<%--    <div id="Btn" class="Btn">--%>
<%--            <input type='button' value='조회'/>--%>
<%--    </div>--%>
</body>
</html>
