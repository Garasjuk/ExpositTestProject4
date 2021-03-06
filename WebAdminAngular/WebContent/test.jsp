<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Users</title>
<link href='./css/style.css' rel="stylesheet" type="text/css"></link>
<link href='./css/bootstrap.css' rel="stylesheet" type="text/css"></link>
<link href='./css/css/font-awesome.css' rel="stylesheet" type="text/css"></link>
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

<script data-require="angular.js@*" data-semver="1.3.9" src="https://code.angularjs.org/1.3.9/angular.js"></script>
<script data-require="angular.js@*" data-semver="1.3.9" src="https://code.angularjs.org/1.3.9/angular-messages.js"></script>

<script data-require="angular-animate@*" data-semver="1.2.13" src="http://code.angularjs.org/1.2.13/angular-animate.js"></script>
<script type="text/javascript" src="./js/angular-messages.js"></script>
<script type="text/javascript" src="./js/appg.js"></script>
<script type="text/javascript" src="./js/appu.js"></script>
<script type="text/javascript" src="./js/ui-bootstrap-tpls-0.12.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript">
function check_telephone(){
	
	reg = /[\0-9\-\+\(\)]/;
	if(!document.editUserForm.newUser_name.value.match(reg)){
	//	alert("BGraf");
		return false;
	}
}

 
function validatorUserName(input) { 
	input.value = input.value.replace(/[^\d,a-z,A-Z,\.,\,,\-]/g, '');
} 

function validatorFirstName(input) { 
	input.value = input.value.replace(/[^а-я,А-Я,\s,\-]/g, '');
} 

function validatorLastName(input) { 
	input.value = input.value.replace(/[^а-я,А-Я]/g, '');
} 


</script>

</head>
<body ng-app="groupsAngular">
	<header>
	  	<jsp:include page="/tiles/header.jsp"/>
	</header>
<div ng-controller="groupsController">
		<div id="task-panel" class="fadein fadeout showpanel panel"  ng-show="toggle">	
			<div class="panel-heading">
				<i class="panel-title-icon fa fa-tasks"></i>
				<span class="panel-title">All Group</span>
				<div class="panel-heading-controls">
					<button ng-click="reset()" class="btn-panel">Main</button>
				</div>
			</div>
			<div class="user">
			
			<button class="btn" ng-click="editUser(user.id)">
          <span class="glyphicon glyphicon-pencil"></span>  Edit
        </button>
        
        <button class="btn  btn-lg " >  Radio  <button class="btn  btn-info" > delete </button></button>
        <button class="btn  btn-success" > 1 </button>
        <button class="btn  btn-success" > 1 </button>
        <button class="btn  btn-success" > 1 </button>
        <button class="btn  btn-danger" > delete </button>
        
        
        
			
				<div class="user" ng-repeat="user in users">
					<button class ="btn" ng-click="getUserByName()" ng-mouseenter="Show(user.id_user,user.user_name)" ><b>{{user.id_user}}  {{user.user_name}}</b> {{user.first_name}} {{user.last_name}} {{user.email}} </button>				
				</div>
					<div class="pagination-wrap" align="center">
						<ul class="pagination">
							<li ng-repeat="page in paginationList" ng-click="showPage(page.link)" ng-class="{'active': currentPageNum() == page.link}"><a ng-bind-html="page.name"></a></li>
						</ul>
					</div>
										
					<h2>Select the users</h2>
					 <select ng-model="user"  ng-options="user.user_name for user in users " >			
						<option value="">-- choose user --</option>
					</select>
					
					<div class="group" ng-repeat="group in groups">					
					<button class="btn btn-primary btn-lg" ng-mouseenter="Show(group.id_group, group.name_group)"  ng-click="getGroupByName()">{{group.id_group}}  {{group.name_group}} </button>					
				</div>
					
				
					<div class="pagination-wrap" >
						<ul class="pagination">
							<li ng-repeat="page in paginationList" ng-click="showPage(page.link)" ng-class="{'active': currentPageNum() == page.link}"><a ng-bind-html="page.name"></a></li>
						</ul>
					</div> 
			</div>	
		</div>
		<div id="task-panel" class="fadein fadeout showpanel panel"  ng-hide="editUserView">	
			<div class="panel-heading">
				<i class="panel-title-icon fa fa-tasks"></i>
				<span class="panel-title">All users</span>
				<div class="panel-heading-controls">
					<button ng-click="reset()" class="btn-panel">Main</button>
				</div>
			</div>
			<div class="user">
				<button class="btn  btn-success" ng-click="editUser(getUserByName.user_name, getUserByName.first_name, getUserByName.last_name, getUserByName.email, getUserByName.id_user); start()">Save user</button>
				<form name="editUserForm"  >
					<table border="0" align="center">
						<tr>
							<td width="100">
							</td>
							<td width="300" align="center">
								<h3>
									<span class="label label-invers">User name</span>
								</h3>
							</td>
							<td width="400">
							
    						
									<input type="text" class="form-control" style="font-size: 16pt; height: 30pt;"  ng-minlength="4" ng-maxlength="20" name="newUser_name" ng-model="getUserByName.user_name" required onkeyup="return validatorUserName(this)"/>
									<div class="alert alert-danger well-sm" ng-show="editUserForm.newUser_name.$error.required">Поле не может быть пустым!</div>
									<div class="alert alert-danger well-sm" ng-show="editUserForm.newUser_name.$error.maxlength">Поле не может быть больше 20 символов!</div>
									<div class="alert alert-danger well-sm" ng-show="editUserForm.newUser_name.$error.minlength">Поле не может быть меньше 4 символов!</div>
								
								
							</td>
						</tr>
						<tr>	
							<td>
							</td>
							<td align="center">
								<h3>
									<span class="label label-invers">First Name</span>
								</h3>
							</td>
							<td>
								<input type="text" class="form-control" name="newFirst_name" style="font-size: 16pt; height: 30pt;" ng-minlength="2" ng-maxlength="20" placeholder="First Name" ng_model="getUserByName.first_name" required onkeyup="return validatorFirstName(this)"/>
								<div class="alert alert-danger well-sm" ng-show="editUserForm.newFirst_name.$error.required">Поле не может быть пустым!</div>
								<div class="alert alert-danger well-sm" ng-show="editUserForm.newFirst_name.$error.maxlength">Поле не может быть больше 20 символов!</div>
								<div class="alert alert-danger well-sm" ng-show="editUserForm.newFirst_name.$error.minlength">Поле не может быть меньше 2 символов!</div>
							</td>
						</tr>
						<tr>	
							<td>
							</td>
							<td align="center">
								<h3>
									<span class="label label-invers">Last name</span>
								</h3>  
							</td>
							<td>
								<input type="text" class="form-control" name="newLast_name" style="font-size: 16pt; height: 30pt;" ng-minlength="2" ng-maxlength="20" ng_model="getUserByName.last_name" onkeyup="return validatorLastName(this)"/>
								<div class="alert alert-danger well-sm" ng-show="editUserForm.newLast_name.$error.required">Поле не может быть пустым!</div>
								<div class="alert alert-danger well-sm" ng-show="editUserForm.newLast_name.$error.maxlength">Поле не может быть больше 20 символов!</div>
								<div class="alert alert-danger well-sm" ng-show="editUserForm.newLast_name.$error.minlength">Поле не может быть меньше 2 символов!</div>
							</td>
						</tr>
						<tr>	
							<td>
							</td>
							<td align="center">
								<h3>	
									<span class="label label-invers">Email</span>
								</h3>      
							</td>
							<td>
								<h3>
									<input type="email" class="form-control" name="newEmail" style="font-size: 16pt; height: 30pt;" ng-minlength="3" ng-maxlength="30" ng_model="getUserByName.email" ng-pattern="/^[_a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/" required/>
									<div class="alert alert-danger well-sm" ng-show="editUserForm.newEmail.$error.required">почтовый ящик не может быть пустым!</div>
						   			<div class="alert alert-danger well-sm" ng-show="editUserForm.newEmail.$error.email">почтовый ящик не правильный формат!</div>
						   			<div class="alert alert-danger well-sm" ng-show="editUserForm.newEmail.$error.maxlength">Поле не может быть больше 30 символов!</div>
									<div class="alert alert-danger well-sm" ng-show="editUserForm.newEmail.$error.minlength">Поле не может быть меньше 3 символов!</div>
								</h3>
							</td>
						</tr>
						<tr>	
							<td>	
								Groups      
							</td>
							<td valign="top">getUserGroupByID {{getUserByName.user_name}} {{getUserByName.id_user}}
								<div class="UserGroupByID" ng-repeat="UserGroupByID in getUserGroupByID" >
									 
									<button class="btn btn-primary btn-lg  "  ng-click="deleteUserGroup(UserGroupByID.id_group,getUserByName.id_user);start()">{{UserGroupByID.id_group}} {{UserGroupByID.name_group}} </button>
									
								
								</div>
							</td>
							<td width="300" align="center">getNoUserGroupByID
								<div class="NoUserGroupByID" ng-repeat="NoUserGroupByID in getNoUserGroupByID">
									<div class="panel panel-default">
									    <button class="btn-lg" ng-click="addUserGroup(NoUserGroupByID.id_group,getUserByName.id_user);start()" ><b>{{NoUserGroupByID.id_group}} </b> {{NoUserGroupByID.name_group}} </button>
										</br>
										<button class="btn-warning" ng-click="editGroup(NoUserGroupByID.id_group)">Edit</button>
										<button class="btn-danger" ng-click="deleteGroup(NoUserGroupByID.id_group,NoUserGroupByID.id_user) ">Delete </button>
										
										
									</div>
								</div>
							</td>
						</tr>
						
					</table>
					
				</form>	
					
			</div>
		</div>
		

</div>
	<footer>
		<jsp:include page="/tiles/footer.jsp"/>
	</footer>
</body>
</html>