<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 15/10/2024
  Time: 02:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="w-[20%] bg-gray-100 flex justify-start items-center p-6">
    <div class="flex items-center flex flex-col gap-8 h-[600px] overflow-y-scroll">
        <h2 class="font-bold">FOLDERS</h2>
        <div class="relative">
            <div class="absolute -top-2 left-0 h-6 w-32 bg-femisalud-300 rounded-t-md"></div>
            <div class="w-32 h-48 bg-femisalud-300 rounded-md shadow-md"></div>
            <div class="absolute top-[20%] left-[10%] w-[80%] h-[55%] rounded-lg overflow-hidden">
                <img src="${pageContext.request.contextPath}/assets/img/femisalud_logo.webp" alt="Miniatura de publicación" class="">
            </div>
            <div class="absolute bottom-[10%] left-[10%] text-white">
                <p class="text-sm font-bold text-femisalud-900">POST 1</p>
                <p class="text-xs text-femisalud-900">22/09/2024 12:12</p>
            </div>
        </div>
    </div>
</div>