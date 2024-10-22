<%--
  Created by IntelliJ IDEA.
  User: RAMOS MARRUFO
  Date: 21/10/2024
  Time: 07:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen bg-femisalud-300">
<div class="relative h-full w-64">
    <jsp:include page="fragment/sidebar.jsp"/>
</div>
<div class="flex flex-col justify-center items-center w-full min-h-screen p-6 overflow-hidden bg-blue-50 font-sans">
    <div class="flex flex-col md:flex-row">
        <!-- Sidebar de Filtros -->
        <div class="w-full md:w-1/3 p-6 bg-white">
            <h1 class="text-2xl font-bold mb-4">Bebé</h1>
            <p class="text-gray-600 mb-6">Filtra y escoge el nombre ideal para tu bebé.</p>

            <div>
                <h2 class="font-bold mb-2">Filtrar por</h2>

                <!-- Seleccionar -->
                <div class="mb-4">
                    <h3 class="font-semibold">Seleccionar</h3>
                    <button class="bg-blue-500 text-white py-2 px-4 rounded mt-2 mr-2">Todos los nombres</button>
                    <button class="border border-gray-300 text-blue-500 py-2 px-4 rounded">Favoritos</button>
                </div>

                <!-- Género -->
                <div class="mb-4">
                    <h3 class="font-semibold">Género</h3>
                    <button class="bg-blue-500 text-white py-2 px-4 rounded mt-2 mr-2">Niña</button>
                    <button class="border border-gray-300 text-blue-500 py-2 px-4 rounded">Niño</button>
                </div>

                <!-- Tema -->
                <div class="mb-4">
                    <h3 class="font-semibold">Tema</h3>
                    <div class="grid grid-cols-3 gap-2">
                        <button class="border border-gray-300 p-2 text-center rounded">
                            <img src="https://cdn-icons-png.flaticon.com/512/2985/2985525.png" alt="Tierno" class="mx-auto w-16 h-16">
                            Tierno</button>
                        <button class="border border-gray-300 p-2 text-center rounded">
                            <img src="https://cdn-icons-png.freepik.com/512/3769/3769041.png" alt="Bíblico" class="mx-auto w-16 h-16">
                            Bíblico</button>
                        <button class="border border-gray-300 p-2 text-center rounded">
                            <img src="https://cdn-icons-png.flaticon.com/512/3748/3748440.png" alt="Realeza" class="mx-auto w-16 h-16">
                            Realeza</button>
                        <button class="border border-gray-300 p-2 text-center rounded">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIXZX20QThygIjT8jVW2D8HLySC14idNKJCA&s" alt="Literatura" class="mx-auto w-16 h-16">
                            Literatura</button>
                        <button class="border border-gray-300 p-2 text-center rounded">
                            <img src="https://cdn-icons-png.flaticon.com/512/881/881317.png" alt="Colores" class="mx-auto w-16 h-16">
                            Colores</button>
                        <button class="border border-gray-300 p-2 text-center rounded">
                            <img src="https://cdn-icons-png.freepik.com/512/1581/1581696.png" alt="Flores" class="mx-auto w-16 h-16">
                            Flores</button>
                        <button class="border border-gray-300 p-2 text-center rounded">
                            <img src="https://cdn-icons-png.flaticon.com/512/6170/6170362.png" alt="Mitología" class="mx-auto w-16 h-16">
                            Mitología</button>
                        <button class="border border-gray-300 p-2 text-center rounded">
                            <img src="https://cdn-icons-png.flaticon.com/512/1188/1188032.png" alt="Naturaleza" class="mx-auto w-16 h-16">
                            Naturaleza</button>
                    </div>
                </div>

                <!-- Empieza/Termina -->
                <div class="mb-4">
                    <h3 class="font-semibold">Empieza con la letra</h3>
                    <select class="w-full border border-gray-300 rounded p-2 mt-2">
                        <option>M</option>
                        <option>N</option>
                    </select>
                </div>

                <div class="mb-4">
                    <h3 class="font-semibold">Termina con la letra</h3>
                    <select class="w-full border border-gray-300 rounded p-2 mt-2">
                        <option>A</option>
                        <option>B</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Resultados -->
        <div class="w-full md:w-2/3 p-6">
            <div>
                <div class="flex justify-center mt-8">
                    <div class="w-4/5 md:w-2/3 lg:w-1/2">
                        <h2 class="text-2xl font-bold text-center text-blue-700 mb-4">Resultados</h2>
                        <table class="min-w-full bg-white rounded-lg shadow-lg overflow-hidden">
                            <thead class="bg-blue-700 text-white">
                            <tr>
                                <th class="py-2 px-4">Fav.</th>
                                <th class="py-2 px-4">Gén.</th>
                                <th class="py-2 px-4">Nombre del bebé</th>
                                <th class="py-2 px-4">Cantidad</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- Fila 1 -->
                            <tr class="bg-white">
                                <td class="py-2 px-4 text-center">
                                    <img src="https://www.svgrepo.com/show/13695/star.svg" alt="Favorito" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-center">
                                    <img src="https://s3-alpha-sig.figma.com/img/3f66/260b/ca43127805429fbb7f4ab50f574a54db?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HXB8sgYeVJGMUI3JLpJCowROcZsP8mmR860RQs3ngbEPtI4-arHC154Cj2-Dk5cDfKTP8JbhKdtb~aRZ8RK1R8UlXYZtyBbyV9JAWW35VV6vP5t2nvTdIIEYh2nxNvuTHPf5hCQFpfTuQ5hhSXeXqYvGH7WRxP4BA0R3odG-Ai7e92L-7yK1VCgTjE1O7hOrglRfGsb6nYJV5rYBKK22nUgnMbWAzGs8E2J4I0wMKQ8hht5v8JaFiW1GWmt4lM~fbk2kBiFwGg-n3g9pmjba2TS1krnqGbmAnJdSWD-GApCUpybPZ91cdIt33Ke1R1NGzJ57VA1b~Z2fV47Wq5Q7fw__" alt="Femenino" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-blue-700 font-semibold">María</td>
                                <td class="py-2 px-4 text-center">67</td>
                            </tr>
                            <!-- Fila 2 -->
                            <tr class="bg-blue-100">
                                <td class="py-2 px-4 text-center">
                                    <img src="https://www.svgrepo.com/show/13695/star.svg" alt="Favorito" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-center">
                                    <img src="https://s3-alpha-sig.figma.com/img/3f66/260b/ca43127805429fbb7f4ab50f574a54db?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HXB8sgYeVJGMUI3JLpJCowROcZsP8mmR860RQs3ngbEPtI4-arHC154Cj2-Dk5cDfKTP8JbhKdtb~aRZ8RK1R8UlXYZtyBbyV9JAWW35VV6vP5t2nvTdIIEYh2nxNvuTHPf5hCQFpfTuQ5hhSXeXqYvGH7WRxP4BA0R3odG-Ai7e92L-7yK1VCgTjE1O7hOrglRfGsb6nYJV5rYBKK22nUgnMbWAzGs8E2J4I0wMKQ8hht5v8JaFiW1GWmt4lM~fbk2kBiFwGg-n3g9pmjba2TS1krnqGbmAnJdSWD-GApCUpybPZ91cdIt33Ke1R1NGzJ57VA1b~Z2fV47Wq5Q7fw__" alt="Femenino" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-blue-700 font-semibold">Martha</td>
                                <td class="py-2 px-4 text-center">45</td>
                            </tr>
                            <!-- Fila 3 -->
                            <tr class="bg-white">
                                <td class="py-2 px-4 text-center">
                                    <img src="https://www.svgrepo.com/show/13695/star.svg" alt="Favorito" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-center">
                                    <img src="https://s3-alpha-sig.figma.com/img/3f66/260b/ca43127805429fbb7f4ab50f574a54db?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HXB8sgYeVJGMUI3JLpJCowROcZsP8mmR860RQs3ngbEPtI4-arHC154Cj2-Dk5cDfKTP8JbhKdtb~aRZ8RK1R8UlXYZtyBbyV9JAWW35VV6vP5t2nvTdIIEYh2nxNvuTHPf5hCQFpfTuQ5hhSXeXqYvGH7WRxP4BA0R3odG-Ai7e92L-7yK1VCgTjE1O7hOrglRfGsb6nYJV5rYBKK22nUgnMbWAzGs8E2J4I0wMKQ8hht5v8JaFiW1GWmt4lM~fbk2kBiFwGg-n3g9pmjba2TS1krnqGbmAnJdSWD-GApCUpybPZ91cdIt33Ke1R1NGzJ57VA1b~Z2fV47Wq5Q7fw__" alt="Femenino" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-blue-700 font-semibold">Marcia</td>
                                <td class="py-2 px-4 text-center">38</td>
                            </tr>
                            <!-- Fila 4 -->
                            <tr class="bg-blue-100">
                                <td class="py-2 px-4 text-center">
                                    <img src="https://www.svgrepo.com/show/13695/star.svg" alt="Favorito" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-center">
                                    <img src="https://s3-alpha-sig.figma.com/img/3f66/260b/ca43127805429fbb7f4ab50f574a54db?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HXB8sgYeVJGMUI3JLpJCowROcZsP8mmR860RQs3ngbEPtI4-arHC154Cj2-Dk5cDfKTP8JbhKdtb~aRZ8RK1R8UlXYZtyBbyV9JAWW35VV6vP5t2nvTdIIEYh2nxNvuTHPf5hCQFpfTuQ5hhSXeXqYvGH7WRxP4BA0R3odG-Ai7e92L-7yK1VCgTjE1O7hOrglRfGsb6nYJV5rYBKK22nUgnMbWAzGs8E2J4I0wMKQ8hht5v8JaFiW1GWmt4lM~fbk2kBiFwGg-n3g9pmjba2TS1krnqGbmAnJdSWD-GApCUpybPZ91cdIt33Ke1R1NGzJ57VA1b~Z2fV47Wq5Q7fw__" alt="Femenino" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-blue-700 font-semibold text-start">Martina</td>
                                <td class="py-2 px-4 text-center">36</td>
                            </tr>
                            <!-- Fila 5 -->
                            <tr class="bg-white">
                                <td class="py-2 px-4 text-center">
                                    <img src="https://www.svgrepo.com/show/13695/star.svg" alt="Favorito" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-center">
                                    <img src="https://s3-alpha-sig.figma.com/img/3f66/260b/ca43127805429fbb7f4ab50f574a54db?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HXB8sgYeVJGMUI3JLpJCowROcZsP8mmR860RQs3ngbEPtI4-arHC154Cj2-Dk5cDfKTP8JbhKdtb~aRZ8RK1R8UlXYZtyBbyV9JAWW35VV6vP5t2nvTdIIEYh2nxNvuTHPf5hCQFpfTuQ5hhSXeXqYvGH7WRxP4BA0R3odG-Ai7e92L-7yK1VCgTjE1O7hOrglRfGsb6nYJV5rYBKK22nUgnMbWAzGs8E2J4I0wMKQ8hht5v8JaFiW1GWmt4lM~fbk2kBiFwGg-n3g9pmjba2TS1krnqGbmAnJdSWD-GApCUpybPZ91cdIt33Ke1R1NGzJ57VA1b~Z2fV47Wq5Q7fw__" alt="Femenino" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-blue-700 font-semibold">Mariela</td>
                                <td class="py-2 px-4 text-center">29</td>
                            </tr>
                            <!-- Fila 6 -->
                            <tr class="bg-blue-100">
                                <td class="py-2 px-4 text-center">
                                    <img src="https://www.svgrepo.com/show/13695/star.svg" alt="Favorito" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-center">
                                    <img src="https://s3-alpha-sig.figma.com/img/3f66/260b/ca43127805429fbb7f4ab50f574a54db?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HXB8sgYeVJGMUI3JLpJCowROcZsP8mmR860RQs3ngbEPtI4-arHC154Cj2-Dk5cDfKTP8JbhKdtb~aRZ8RK1R8UlXYZtyBbyV9JAWW35VV6vP5t2nvTdIIEYh2nxNvuTHPf5hCQFpfTuQ5hhSXeXqYvGH7WRxP4BA0R3odG-Ai7e92L-7yK1VCgTjE1O7hOrglRfGsb6nYJV5rYBKK22nUgnMbWAzGs8E2J4I0wMKQ8hht5v8JaFiW1GWmt4lM~fbk2kBiFwGg-n3g9pmjba2TS1krnqGbmAnJdSWD-GApCUpybPZ91cdIt33Ke1R1NGzJ57VA1b~Z2fV47Wq5Q7fw__" alt="Femenino" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-blue-700 font-semibold">Matilda</td>
                                <td class="py-2 px-4 text-center">18</td>
                            </tr>
                            <!-- Fila 7 -->
                            <tr class="bg-white">
                                <td class="py-2 px-4 text-center">
                                    <img src="https://www.svgrepo.com/show/13695/star.svg" alt="Favorito" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-center">
                                    <img src="https://s3-alpha-sig.figma.com/img/3f66/260b/ca43127805429fbb7f4ab50f574a54db?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HXB8sgYeVJGMUI3JLpJCowROcZsP8mmR860RQs3ngbEPtI4-arHC154Cj2-Dk5cDfKTP8JbhKdtb~aRZ8RK1R8UlXYZtyBbyV9JAWW35VV6vP5t2nvTdIIEYh2nxNvuTHPf5hCQFpfTuQ5hhSXeXqYvGH7WRxP4BA0R3odG-Ai7e92L-7yK1VCgTjE1O7hOrglRfGsb6nYJV5rYBKK22nUgnMbWAzGs8E2J4I0wMKQ8hht5v8JaFiW1GWmt4lM~fbk2kBiFwGg-n3g9pmjba2TS1krnqGbmAnJdSWD-GApCUpybPZ91cdIt33Ke1R1NGzJ57VA1b~Z2fV47Wq5Q7fw__" alt="Femenino" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-blue-700 font-semibold">Macarena</td>
                                <td class="py-2 px-4 text-center">16</td>
                            </tr>
                            <!-- Fila 8 -->
                            <tr class="bg-blue-100">
                                <td class="py-2 px-4 text-center">
                                    <img src="https://www.svgrepo.com/show/13695/star.svg" alt="Favorito" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-center">
                                    <img src="https://s3-alpha-sig.figma.com/img/3f66/260b/ca43127805429fbb7f4ab50f574a54db?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HXB8sgYeVJGMUI3JLpJCowROcZsP8mmR860RQs3ngbEPtI4-arHC154Cj2-Dk5cDfKTP8JbhKdtb~aRZ8RK1R8UlXYZtyBbyV9JAWW35VV6vP5t2nvTdIIEYh2nxNvuTHPf5hCQFpfTuQ5hhSXeXqYvGH7WRxP4BA0R3odG-Ai7e92L-7yK1VCgTjE1O7hOrglRfGsb6nYJV5rYBKK22nUgnMbWAzGs8E2J4I0wMKQ8hht5v8JaFiW1GWmt4lM~fbk2kBiFwGg-n3g9pmjba2TS1krnqGbmAnJdSWD-GApCUpybPZ91cdIt33Ke1R1NGzJ57VA1b~Z2fV47Wq5Q7fw__" alt="Femenino" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-blue-700 font-semibold">Magdalena</td>
                                <td class="py-2 px-4 text-center">13</td>
                            </tr>
                            <!-- Fila 9 -->
                            <tr class="bg-white">
                                <td class="py-2 px-4 text-center">
                                    <img src="https://www.svgrepo.com/show/13695/star.svg" alt="Favorito" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-center">
                                    <img src="https://s3-alpha-sig.figma.com/img/3f66/260b/ca43127805429fbb7f4ab50f574a54db?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HXB8sgYeVJGMUI3JLpJCowROcZsP8mmR860RQs3ngbEPtI4-arHC154Cj2-Dk5cDfKTP8JbhKdtb~aRZ8RK1R8UlXYZtyBbyV9JAWW35VV6vP5t2nvTdIIEYh2nxNvuTHPf5hCQFpfTuQ5hhSXeXqYvGH7WRxP4BA0R3odG-Ai7e92L-7yK1VCgTjE1O7hOrglRfGsb6nYJV5rYBKK22nUgnMbWAzGs8E2J4I0wMKQ8hht5v8JaFiW1GWmt4lM~fbk2kBiFwGg-n3g9pmjba2TS1krnqGbmAnJdSWD-GApCUpybPZ91cdIt33Ke1R1NGzJ57VA1b~Z2fV47Wq5Q7fw__" alt="Femenino" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-blue-700 font-semibold">Mariana</td>
                                <td class="py-2 px-4 text-center">11</td>
                            </tr>
                            <!-- Fila 10 -->
                            <tr class="bg-blue-100">
                                <td class="py-2 px-4 text-center">
                                    <img src="https://www.svgrepo.com/show/13695/star.svg" alt="Favorito" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-center">
                                    <img src="https://s3-alpha-sig.figma.com/img/3f66/260b/ca43127805429fbb7f4ab50f574a54db?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HXB8sgYeVJGMUI3JLpJCowROcZsP8mmR860RQs3ngbEPtI4-arHC154Cj2-Dk5cDfKTP8JbhKdtb~aRZ8RK1R8UlXYZtyBbyV9JAWW35VV6vP5t2nvTdIIEYh2nxNvuTHPf5hCQFpfTuQ5hhSXeXqYvGH7WRxP4BA0R3odG-Ai7e92L-7yK1VCgTjE1O7hOrglRfGsb6nYJV5rYBKK22nUgnMbWAzGs8E2J4I0wMKQ8hht5v8JaFiW1GWmt4lM~fbk2kBiFwGg-n3g9pmjba2TS1krnqGbmAnJdSWD-GApCUpybPZ91cdIt33Ke1R1NGzJ57VA1b~Z2fV47Wq5Q7fw__" alt="Femenino" class="w-6 mx-auto">
                                </td>
                                <td class="py-2 px-4 text-blue-700 font-semibold">Mía</td>
                                <td class="py-2 px-4 text-center">9</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Botón para revelar el sexo del bebé -->
            <div class="mt-8 p-4 bg-blue-50 border border-gray-300 rounded">
                <p class="text-gray-600 mb-4">¿Te gustaría saber el sexo de tu bebé?</p>
                <button class="bg-blue-500 text-white py-2 px-6 rounded">Revelar sexo del bebé</button>
                <div class="mt-4">
                    <label class="mr-4">¿Estás segura de ver la revelación de sexo?</label>
                    <button class="border border-gray-300 py-2 px-4 rounded">No</button>
                    <button class="bg-blue-500 text-white py-2 px-4 rounded">Sí</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
</body>
</html>