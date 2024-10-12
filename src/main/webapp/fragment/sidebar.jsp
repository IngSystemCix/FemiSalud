<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 12/10/2024
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="h-[calc(100vh-2rem)] absolute left-4 top-4 bg-femisalud-400 rounded-full p-6 flex flex-col justify-start  gap-6" id="navbar">
    <img class="cursor-pointer size-4" id="logo" src="${pageContext.request.contextPath}/assets/img/F_logo.png" alt="Logo">
    <ul class="h-full flex flex-col gap-3">
        <li class="flex justify-start items-center gap-3">
            <a href="" class="rounded-full bg-femisalud-900 p-4">
                <img class="size-6"  src="${pageContext.request.contextPath}/assets/img/home_icon.svg" alt="inicio">
            </a>
            <span class="text-center label_buttom hidden">Inicio</span>
        </li>
        <li class="flex justify-start items-center gap-3">
            <a href="" class="rounded-full bg-femisalud-100 p-4">
                <img class="size-7" src="${pageContext.request.contextPath}/assets/img/feet_icon.svg" alt="bebé">
            </a>
            <span class="text-center label_buttom hidden">Bebé</span>
        </li>
        <li class="flex justify-start items-center gap-3">
            <a href="" class="rounded-full bg-femisalud-100 p-4">
                <img class="size-6" src="${pageContext.request.contextPath}/assets/img/heart_icon.svg" alt="ecografía">
            </a>
            <span class="text-center label_buttom hidden">Ecografías</span>
        </li>
        <li class="flex justify-start items-center gap-3">
            <a href="" class="rounded-full bg-femisalud-100 p-4">
                <img class="size-6" src="${pageContext.request.contextPath}/assets/img/message_icon.svg" alt="mensaje">
            </a>
            <span class="text-center label_buttom hidden">Mensaje</span>
        </li>
        <li class="flex justify-start items-center gap-3">
            <a href="" class="rounded-full bg-femisalud-100 p-4">
                <img class="size-6" src="${pageContext.request.contextPath}/assets/img/user_icon.svg" alt="perfil">
            </a>
            <span class="text-center label_buttom hidden">Perfil</span>
        </li>
    </ul>
    <button type="button" class="flex justify-start items-center gap-3">
        <a href="" class="rounded-full bg-femisalud-100 p-4">
            <img class="size-6" src="${pageContext.request.contextPath}/assets/img/logout_icon.svg" alt="cerrar sesión">
        </a>
        <span class="text-center label_buttom hidden">Cerrar Sesión</span>
    </button>
</nav>