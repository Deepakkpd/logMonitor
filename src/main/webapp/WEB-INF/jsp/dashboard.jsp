<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
<title>Deepak's Playground</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
	function logUrlSubmit() {
		$('#indexForm').attr('action',
				'${pageContext.request.contextPath}/processLog');
		$('#indexForm').submit();
	}
	
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	});
</script>
</head>
<body>
	<form:form modelAttribute="indexForm" name="indexForm" id="indexForm"
		action="/dashboard">
		<div class="container-fluid">

			<nav class="navbar navbar-dark bg-dark">
				<div class="container-fluid">
					<a class="navbar-brand" href="#"><h4>Log Monitor App</h4></a>
					<ul class="nav navbar-nav mr-auto">
						<li><b style="font-size:19px;color:white">&nbsp;&nbsp;&nbsp;&nbsp;Number of Exceptions :&nbsp;</b>
						<c:if test="${not empty indexForm.exceptionList}">
						<span class="badge badge-light">
						<i class="fa fa-thumbs-down" style="font-size:20px;color:red"> ${indexForm.exceptionCount}</i>
						</span>
						</c:if>
						<c:if test="${empty indexForm.exceptionList}">
						<span class="badge badge-success">
						<i class="fa fa-thumbs-up" style="font-size:20px"> 0</i></span>
						</c:if>
								 </li>
					</ul>
					<ul class="nav navbar-nav mr-auto">
						<li>
							<form class="form-inline my-2 my-lg-0">
								<form:input class="form-control mr-lg-5" type="search"
									path="logUrl" placeholder="Give the log file path with the file name here..."
									aria-label="Search" style="width:180%;" 
									data-toggle="tooltip" data-placement="bottom" title="eg: E:\Public\Logs\TestLogs.log"/>
							</form>
						</li>
					</ul>
					<ul class="nav navbar-nav mr-auto">
						<li>
							<button type="submit" class="btn btn-success"
								onclick="logUrlSubmit();"><b>GO</b></button>
						</li>
					</ul>

				</div>
			</nav>

<c:if test="${indexForm.invalidPath}">
<br>
<div class="alert alert-danger" style="width:18%; align:center;" id="myAlert">
    <strong> Warning: </strong> Invalid log file path.
  </div>
  </c:if>
<p>
			<h4>List of Exception :</h4>
			<c:if test="${not empty indexForm.exceptionList}">
			<button type="button" class="btn btn-danger" data-toggle="collapse"
				data-target="#demo">Click to see &nbsp;
				<i class="fa fa-thumbs-down" style="font-size:20px"></i>
				</button>
				</c:if>
			<c:if test="${empty indexForm.exceptionList}">
			<button type="button" class="btn btn-success" data-toggle="collapse"
				data-target="#demo">Click to see &nbsp;
				<i class="fa fa-thumbs-up" style="font-size:20px"></i>
				</button>
				</c:if>
			<div id="demo" class="collapse">
				<c:if test="${not empty indexForm.exceptionList}">
					<div class="container">
						<c:forEach var="listValue" items="${indexForm.exceptionList} ">
							<li class="list-group-item list-group-item-warning">${listValue}</li>
						</c:forEach>
						
					</div>
				</c:if>
				<c:if test="${empty indexForm.exceptionList}">
				<div class="container">
				<li class="list-group-item list-group-item-success">No Exceptions</li>
					</div>
				</c:if>
			</div>
<p>
			<div class="form-group">
				<h4>Exception Logs :</h4>
				<textarea class="form-control" rows="40" id="exception"
					readonly="readonly" style="color: red; background-color: #e0ffff;">${indexForm.exceptionLog}</textarea>
			</div>

		</div>
	</form:form>
</body>

</html>