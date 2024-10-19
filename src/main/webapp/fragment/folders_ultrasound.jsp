<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 15/10/2024
  Time: 02:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="bg-gray-100 flex justify-center items-center min-h-screen">
    <div class="flex items-center flex flex-col gap-8 h-[600px] overflow-y-scroll">
        <h2 class="font-bold">FOLDERS</h2>
        <div class="relative w-[300px] h-[250px]">
            <!-- Fondo de la carpeta -->
            <img src="${pageContext.request.contextPath}/assets/img/vector_file.svg" alt="Fondo de carpeta" class="w-full h-full object-cover" />
            <!-- Miniatura de ecografía -->
            <div class="absolute top-[20%] left-[10%] w-[80%] h-[55%] rounded-lg overflow-hidden">
                <img src="${pageContext.request.contextPath}/assets/img/femisalud_logo.webp" alt="Miniatura de publicación" class="">
            </div>

            <!-- Texto alineado a la izquierda con margen -->
            <div class="absolute bottom-[10%] left-[10%] text-white">
                <p class="text-sm font-bold text-femisalud-900">POST 1</p>
                <p class="text-xs text-femisalud-900">22/09/2024 12:12</p>
            </div>
        </div>

        <div class="relative w-[300px] h-[250px]">
            <!-- Fondo de la carpeta -->
            <img src="${pageContext.request.contextPath}/assets/img/vector_file.svg" alt="Fondo de carpeta" class="w-full h-full object-cover" />
            <!-- Miniatura de ecografía -->
            <div class="absolute top-[20%] left-[10%] w-[80%] h-[55%] rounded-lg overflow-hidden">
                <img src="${pageContext.request.contextPath}/assets/img/femisalud_logo.webp" alt="Miniatura de publicación" class="">
            </div>

            <!-- Texto alineado a la izquierda con margen -->
            <div class="absolute bottom-[10%] left-[10%] text-white">
                <p class="text-sm font-bold text-femisalud-900">POST 2</p>
                <p class="text-xs text-femisalud-900">22/09/2024 12:12</p>
            </div>
        </div>

        <div class="relative w-[300px] h-[250px]">
            <!-- Fondo de la carpeta -->
            <img src="${pageContext.request.contextPath}/assets/img/vector_file.svg" alt="Fondo de carpeta" class="w-full h-full object-cover" />
            <!-- Miniatura de ecografía -->
            <div class="absolute top-[20%] left-[10%] w-[80%] h-[55%] rounded-lg overflow-hidden">
                <img src="${pageContext.request.contextPath}/assets/img/femisalud_logo.webp" alt="Miniatura de publicación" class="">
            </div>

            <!-- Texto alineado a la izquierda con margen -->
            <div class="absolute bottom-[10%] left-[10%] text-white">
                <p class="text-sm font-bold text-femisalud-900">POST 3</p>
                <p class="text-xs text-femisalud-900">22/09/2024 12:12</p>
            </div>
        </div>

        <div class="relative w-[300px] h-[250px]">
            <!-- Fondo de la carpeta -->
            <img src="${pageContext.request.contextPath}/assets/img/vector_file.svg" alt="Fondo de carpeta" class="w-full h-full object-cover" />
            <!-- Miniatura de ecografía -->
            <div class="absolute top-[20%] left-[10%] w-[80%] h-[55%] rounded-lg overflow-hidden">
                <img src="${pageContext.request.contextPath}/assets/img/femisalud_logo.webp" alt="Miniatura de publicación" class="">
            </div>

            <!-- Texto alineado a la izquierda con margen -->
            <div class="absolute bottom-[10%] left-[10%] text-white">
                <p class="text-sm font-bold text-femisalud-900">POST 4</p>
                <p class="text-xs text-femisalud-900">22/09/2024 12:12</p>
            </div>
        </div>
    </div>
</div>