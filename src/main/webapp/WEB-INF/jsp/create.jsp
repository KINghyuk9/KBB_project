<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">--%>
<%--<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">--%>
<%--<head>--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
<%--    <title>jqGrid Demos</title>--%>
<%--    <link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/redmond/jquery-ui-1.8.1.custom.css" />--%>
<%--    <link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/ui.jqgrid.css" />--%>
<%--    <link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/ui.multiselect.css" />--%>

<%--    <script src="http://trirand.com/blog/jqgrid/js/jquery.js" type="text/javascript"></script>--%>
<%--    <script src="http://trirand.com/blog/jqgrid/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>--%>
<%--    <script src="http://trirand.com/blog/jqgrid/js/jquery.layout.js" type="text/javascript"></script>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>jqGrid Demos</title>
    <link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/redmond/jquery-ui-1.8.1.custom.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/ui.jqgrid.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/ui.multiselect.css" />

    <script src="http://trirand.com/blog/jqgrid/js/jquery.js" type="text/javascript"></script>
    <script src="http://trirand.com/blog/jqgrid/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
    <script src="http://trirand.com/blog/jqgrid/js/jquery.layout.js" type="text/javascript"></script>
    <script src="http://trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js" type="text/javascript"></script>
    <script src="http://trirand.com/blog/jqgrid/js/ui.multiselect.js" type="text/javascript"></script>
    <script src="http://trirand.com/blog/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="http://trirand.com/blog/jqgrid/js/jquery.tablednd.js" type="text/javascript"></script>
    <script src="http://trirand.com/blog/jqgrid/js/jquery.contextmenu.js" type="text/javascript"></script>

    <script type="text/javascript">

        jQuery(document).ready(function() {
            var template_int = { formatter: 'int', align: 'center', sorttype: 'int' };
            var template_float = { formatter: 'float', align: 'right', sorttype: 'float' };
            var template_date = { align: 'center', sorttype: 'date' };

            var col_names = [ 'Inv No','Date', 'Client', 'Amount','Tax','Total','Notes', 'Completed' ];
            var col_model =  [
                { name:'id',index:'id', width:80, template: template_int },
                { name:'invdate',index:'invdate', width:90, template: template_date },
                { name:'name',index:'name', width:100},
                { name:'amount',index:'amount', width:80, template: template_float },
                { name:'tax',index:'tax', width:80, template: template_float },
                { name:'total',index:'total', width:80, template: template_float },
                { name:'note',index:'note', width:150, sortable:false },
                { name: 'completed', index: 'completed', width: 80, align: 'center', formatter: 'checkbox',
                    edittype: 'checkbox', editoptions: {value: 'Yes:No', defaultValue: 'Yes'} }
            ];

            jQuery("#list").jqGrid({
                datatype : "local",
                height : 250,
                width : 'auto',
                //date : [{id:"1",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"}],   //데이터 등록 시 사용.
                colNames : col_names,
                colModel : col_model,
                pager : '#pager',
                gridview : true,
                rownumbers : true,
                rowNum : 10,
                rowList : [5, 10, 15],
                caption : 'Test Dashboard',
                gridComplete : function() {
                    //한 row가 뿌려질때마다 수행 됨.
                }
            });
            var mydata = [
                {id:"1",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00", completed: true},
                {id:"2",invdate:"2007-10-02",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00", completed: false},
                {id:"3",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00", completed: false},
                {id:"4",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00", completed: false},
                {id:"5",invdate:"2007-10-05",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00", completed: false},
                {id:"6",invdate:"2007-09-06",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00", completed: false},
                {id:"7",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00", completed: false},
                {id:"8",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00", completed: false},
                {id:"9",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00", completed: false},
                {id:"10",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00", completed: false},
                {id:"11",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00", completed: false},
                {id:"12",invdate:"2007-10-02",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00", completed: false},
                {id:"13",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00", completed: false},
                {id:"14",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00", completed: false},
                {id:"15",invdate:"2007-10-05",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00", completed: false},
                {id:"16",invdate:"2007-09-06",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00", completed: false},
                {id:"17",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00", completed: false},
                {id:"18",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00", completed: false},
                {id:"19",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00", completed: false}
            ];

            for(var i=0; i<mydata.length; i++) {
                jQuery("#list").jqGrid('addRowData', i+1, mydata[i]);
            }
            jQuery("#list").jqGrid.rowNum = 10;
            gridComplete();
        });

        var gridComplete = function () {
            var maxDate;
            var rowIDs = jQuery("#list").jqGrid('getDataIDs');
            for (var i = 0; i < rowIDs.length ; i++)  {
                var rowID = rowIDs[i];
                var row = jQuery('#list').jqGrid ('getRowData', rowID);
                if( i==0 ) {
                    maxDate = row.invdate;
                }else {
                    if(maxDate < row.invdate) {
                        maxDate = row.invdate;
                    }
                }
            }
            $("#maxDateField").val(maxDate);
        }
    </script>
</head>
<body>
<table id="list"></table>
<div id="pager"></div>
<br>
Max Date : <input id="maxDateField" value="" width="150px">
</body>
</html>