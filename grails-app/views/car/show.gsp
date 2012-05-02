
<%@ page import="com.jankester.Car" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'car.label', default: 'Car')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-car" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-car" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list car">
			
				<g:if test="${carInstance?.brand}">
				<li class="fieldcontain">
					<span id="brand-label" class="property-label"><g:message code="car.brand.label" default="Brand" /></span>
					
						<span class="property-value" aria-labelledby="brand-label"><g:fieldValue bean="${carInstance}" field="brand"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.ps}">
				<li class="fieldcontain">
					<span id="ps-label" class="property-label"><g:message code="car.ps.label" default="Ps" /></span>
					
						<span class="property-value" aria-labelledby="ps-label"><g:fieldValue bean="${carInstance}" field="ps"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="car.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${carInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="car.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${carInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="car.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${carInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.buildDate}">
				<li class="fieldcontain">
					<span id="buildDate-label" class="property-label"><g:message code="car.buildDate.label" default="Build Date" /></span>
					
						<span class="property-value" aria-labelledby="buildDate-label"><g:formatDate date="${carInstance?.buildDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${carInstance?.id}" />
					<g:link class="edit" action="edit" id="${carInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
