<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen">
<div class="flex w-full h-full">
    <div class="h-full w-64">
        <jsp:include page="fragment/sidebar.jsp"/>
    </div>
    <main class="bg-gray-100 h-full w-full flex justify-center items-center h-screen">
        <div class="bg-white shadow-lg rounded-lg p-8 w-full max-w-2xl h-[70%]">
            <h2 class="text-xl font-bold mb-4 text-blue-700 text-start">Perfil</h2>
            <p class="text-sm text-gray-600 mb-8 text-start">
                Si deseas cambiar algún dato de tu registro por motivos de robo u otra causa, a continuación puedes editar tu perfil.
            </p>

            <form action="${pageContext.request.contextPath}/update_profile" method="post" class="bg-blue-100 p-6 rounded-3xl">
                <h3 class="text-lg font-bold text-blue-700 mb-6 text-center">Mis datos</h3>

                <div class="flex justify-between items-center mb-4">
                    <label class="block font-semibold">Nombre completo:</label>
                    <p class="text-gray-800">${data_patient[0]}</p>
                </div>

                <div class="flex justify-between items-center mb-4">
                    <label class="block font-semibold">DNI:</label>
                    <p class="text-gray-800">${data_patient[3]}</p>
                </div>

                <div class="flex justify-between items-center mb-4">
                    <label for="telefono" class="block font-semibold">Teléfono:</label>
                    <input type="text" id="telefono" name="telefono" placeholder="Ingrese su teléfono" class="ml-4 p-2 w-1/2 border border-gray-300 rounded" value="${data_patient[1]}" disabled>
                </div>

                <div class="flex justify-between items-center mb-6">
                    <label for="email" class="block font-semibold">Correo electrónico:</label>
                    <input type="email" id="email" name="email" placeholder="Ingrese su correo" class="ml-4 p-2 w-1/2 border border-gray-300 rounded" value="${data_patient[2]}" disabled>
                </div>

                <div class="flex justify-center space-x-4">
                    <button type="button" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700" onclick="toggleEdit()">Editar perfil</button>
                    <button type="submit" id="saveButton" class="bg-gray-300 text-gray-600 px-4 py-2 rounded cursor-not-allowed" disabled>Guardar datos</button>
                </div>
            </form>
        </div>
    </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/editProfile.js"></script>
</body>
</html>
