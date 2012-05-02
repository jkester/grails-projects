
<%@ page import="com.jankester.Car" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-car" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="brand" title="${message(code: 'car.brand.label', default: 'Brand')}" />
					
						<g:sortableColumn property="ps" title="${message(code: 'car.ps.label', default: 'Ps')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'car.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'car.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'car.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="buildDate" title="${message(code: 'car.buildDate.label', default: 'Build Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carInstanceList}" status="i" var="carInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carInstance.id}">${fieldValue(bean: carInstance, field: "brand")}</g:link></td>
					
						<td>${fieldValue(bean: carInstance, field: "ps")}</td>
					
						<td>${fieldValue(bean: carInstance, field: "name")}</td>
					
						<td><g:formatDate date="${carInstance.lastUpdated}" /></td>
					
						<td><g:formatDate date="${carInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${carInstance.buildDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
