<%@ page contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
	* {
		box-sizing: border-box;
	}

	#myInput {
		background: no-repeat 10px 10px;
		width: 35%;
		font-size: 16px;
		padding: 12px 20px 12px 40px;
		border: 1px solid #ddd;
		margin-bottom: 12px;
	}

	#myTable {
		border-collapse: collapse;
		width: 35%;
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

<title>Test</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
	<h3>Add user!!!</h3>

	<form:form method="post" action="/user" commandName="user">
		<div class="table-responsive">
			<table class="table table-bordered" style="width: 300px">
				<tr>
					<td>Name :</td>
					<td><form:input type="text" path="name" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input class="btn btn-primary btn-sm" type="submit" value="Add" /></td>
				</tr>
			</table>
		</div>
	</form:form>
	<br>
	<br>
	<h3>List of Users</h3>
	<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name" style="width: 35%">
	<table id="myTable">
		<tr class="header">
			<th style="width:5%;">Id</th>
			<th style="width:30%;">Name</th>
		</tr>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td width="60" align="center">${user.id}</td>
				<td width="60" align="center">${user.name}</td>
			</tr>
		</c:forEach>
	</table>

	<script>
        function myFunction() {
            var input, filter, table, tr, td, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
	</script>
</body>
</html>