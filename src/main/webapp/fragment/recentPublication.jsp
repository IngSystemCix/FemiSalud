<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 13/10/2024
  Time: 04:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="w-full items-center">
    <h2 class="font-bold mb-6">Publicaciones recientes</h2>
    <div class="w-full grid grid-cols-2 sm:grid-cols-1 gap-y-6">
        <div class="relative">
            <div class="absolute -top-2 left-0 h-6 w-24 bg-femisalud-200 rounded-t-md"></div>
            <div class="w-96 h-56 bg-femisalud-200 rounded-md shadow-md"></div>
            <img src="${pageContext.request.contextPath}/assets/img/miniature_ultrasound.png" alt="ecografía" class="absolute bottom-20 left-4 w-[22rem] h-32 rounded-lg">
            <div class="absolute bottom-4 left-4">
                <p class="font-bold text-femisalud-600">Post 1</p>
                <p class="text-sm">22/09/2024 12:12</p>
            </div>
        </div>
    </div>
</div>