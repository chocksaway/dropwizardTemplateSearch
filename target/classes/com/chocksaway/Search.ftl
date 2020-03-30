<!-- Code taken from https://www.w3schools.com/howto/howto_js_filter_table.asp //-->
<#-- @ftlvariable name="" type="com.chocksaway.SearchView" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <title> Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            box-sizing: border-box;
        }

        #myInput {
            //background-image: url('/css/searchicon.png');
            background-position: 10px 10px;
            background-repeat: no-repeat;
            width: 100%;
            font-size: 16px;
            padding: 12px 20px 12px 40px;
            border: 1px solid #ddd;
            margin-bottom: 12px;
        }

        #myTable {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd;
            font-size: 18px;
        }

        #myTable th, #myTable td {
            text-align: left;
            padding: 12px;
        }

        #myTable tr {
            border-bottom: 1px solid #ddd;
        }

        #myTable tr.header, #myTable tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<h2>Hello, ${search.getContent()}!</h2>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">

<table id="myTable">
    <tr class="header">
        <th style="width:60%;">TV Program</th>
        <th style="width:40%;">Country</th>
    </tr>
    <tr>
        <td>Tradional Swiss um pah band </td>
        <td>Switzerland</td>
    </tr>
    <tr>
        <td>Rainbow - Zippy has a cold</td>
        <td>UK</td>
    </tr>
    <tr>
        <td>The Flumps - the flumpet is broken</td>
        <td>UK</td>
    </tr>
    <tr>
        <td>Magic Roundabout</td>
        <td>UK</td>
    </tr>
    <tr>
        <td>In The Night Garden - has someone got a light?</td>
        <td>UK</td>
    </tr>
    <tr>
        <td>Cheese and Baguette Weekly</td>
        <td>France</td>
    </tr>
    <tr>
        <td>Zig and Zag</td>
        <td>Ireland</td>
    </tr>
    <tr>
        <td>Open University</td>
        <td>UK / BBC2 - in the middle of the nights</td>
    </tr>
</table>

<script>
    function myFunction() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>


<#function filter data name value>
    <#local result = []>
    <#list data as each>
        <#if each[name] == value>
            <#local result = result + [each]>
        </#if>
    </#list>
    <#return result>
</#function>

<#-- some test data -->
<#assign data = [ {"propertyName":"my value",    "foo":100},
{"propertyName":"other value", "foo":101},
{"propertyName":"my value",    "foo":102}] >

<#assign filteredData = filter(data, "propertyName", "my value") >

<#list filteredData as item>
    ${item.foo}
</#list>


</body>
</html>