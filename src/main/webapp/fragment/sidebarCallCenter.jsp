<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 23/10/2024
  Time: 02:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="h-[calc(100vh-2rem)] fixed left-4 top-4 bg-femisalud-900 rounded-full p-6 flex flex-col justify-start  gap-6" id="navbar">
    <img class="cursor-pointer w-12 h-12" id="logo" src="${pageContext.request.contextPath}/assets/img/F_logo.png" alt="Logo">
    <ul class="h-full flex flex-col gap-3">

        <li class="flex justify-start items-center gap-3">
            <a href="message" class="button-sidebar rounded-full bg-femisalud-100 p-4">
                <svg class="size-6" width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path class="icon-button" d="M22.5 3.75C23.8261 3.75 25.0978 4.27678 26.0355 5.21447C26.9732 6.15215 27.5 7.42392 27.5 8.75V18.75C27.5 20.0761 26.9732 21.3479 26.0355 22.2855C25.0978 23.2232 23.8261 23.75 22.5 23.75H16.595L10.6425 27.3213C10.4632 27.4288 10.2599 27.4897 10.051 27.4984C9.84208 27.507 9.63436 27.4631 9.44682 27.3707C9.25928 27.2783 9.09792 27.1404 8.97749 26.9695C8.85706 26.7986 8.78143 26.6002 8.7575 26.3925L8.75 26.25V23.75H7.5C6.2172 23.75 4.98346 23.257 4.05398 22.3728C3.12451 21.4887 2.57039 20.2812 2.50625 19L2.5 18.75V8.75C2.5 7.42392 3.02678 6.15215 3.96447 5.21447C4.90215 4.27678 6.17392 3.75 7.5 3.75H22.5ZM17.5 15H10C9.66848 15 9.35054 15.1317 9.11612 15.3661C8.8817 15.6005 8.75 15.9185 8.75 16.25C8.75 16.5815 8.8817 16.8995 9.11612 17.1339C9.35054 17.3683 9.66848 17.5 10 17.5H17.5C17.8315 17.5 18.1495 17.3683 18.3839 17.1339C18.6183 16.8995 18.75 16.5815 18.75 16.25C18.75 15.9185 18.6183 15.6005 18.3839 15.3661C18.1495 15.1317 17.8315 15 17.5 15ZM20 10H10C9.66848 10 9.35054 10.1317 9.11612 10.3661C8.8817 10.6005 8.75 10.9185 8.75 11.25C8.75 11.5815 8.8817 11.8995 9.11612 12.1339C9.35054 12.3683 9.66848 12.5 10 12.5H20C20.3315 12.5 20.6495 12.3683 20.8839 12.1339C21.1183 11.8995 21.25 11.5815 21.25 11.25C21.25 10.9185 21.1183 10.6005 20.8839 10.3661C20.6495 10.1317 20.3315 10 20 10Z" fill="#115691"/>
                </svg>
            </a>
            <span class="text-center label_buttom hidden text-white font-bold">Mensaje</span>
        </li>
    </ul>
    <button type="button" class="flex justify-start items-center gap-3">
        <a href="login" class="button-sidebar rounded-full bg-femisalud-100 p-4">
            <svg class="size-6" width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path class="icon-button" d="M29.8799 14.4375C29.7197 14.2969 29.7197 14.1562 29.5595 14.0156L24.7545 9.79688C24.1139 9.23438 23.1529 9.23438 22.5122 9.79688C21.8715 10.3594 21.8715 11.2031 22.5122 11.7656L24.5944 13.5937H17.2267C16.2657 13.5937 15.625 14.1562 15.625 15C15.625 15.8437 16.2657 16.4062 17.2267 16.4062H24.5944L22.5122 18.2344C21.8715 18.7969 21.8715 19.6406 22.5122 20.2031C22.8325 20.4844 23.313 20.625 23.6334 20.625C23.9537 20.625 24.4342 20.4844 24.7545 20.2031L29.5595 15.9844C29.7197 15.8437 29.8799 15.7031 29.8799 15.5625C30.04 15.1406 30.04 14.8594 29.8799 14.4375Z" fill="#115691"/>
                <path class="icon-button" d="M20.5871 25.1667C18.7754 26.1667 16.7991 26.6667 14.8227 26.6667C8.39954 26.6667 3.29394 21.5 3.29394 15C3.29394 8.5 8.39954 3.33333 14.8227 3.33333C16.7991 3.33333 18.7754 3.83333 20.5871 4.83333C21.4106 5.33333 22.3988 5 22.8929 4.16667C23.3869 3.33333 23.0576 2.33333 22.2341 1.83333C19.9283 0.666667 17.4579 0 14.8227 0C6.58787 0 0 6.66667 0 15C0 23.3333 6.58787 30 14.8227 30C17.4579 30 19.9283 29.3333 22.2341 28C23.0576 27.5 23.2222 26.5 22.8929 25.6667C22.3988 25 21.4106 24.6667 20.5871 25.1667Z" fill="#115691"/>
            </svg>
        </a>
        <span class="text-center label_buttom hidden text-white font-bold">Cerrar Sesión</span>
    </button>
</nav>
