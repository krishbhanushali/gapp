<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>Users</title></head>
<body>
<table>
<tr><th>ID</th><th>Username</th><th>Enabled</th></tr>
<c:forEach items="${users}" var="user">
<tr>
  <td>${user.userID}</td>
  <td>${user.emailID }</td>
</tr>
</c:forEach>
</table>
</body>
</html>