<%--
  Created by IntelliJ IDEA.
  User: JONATHAN
  Date: 22/10/2024
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
<head>
    <jsp:include page="fragment/head.jsp"/>
    <title>FemiSalud</title>
</head>
<body class="flex w-full h-screen">
<!-- Ajusta el contenedor principal para que sidebar y main se distribuyan correctamente -->
<div class="flex w-full h-full">
    <!-- Sidebar con ancho fijo -->
    <div class=" h-full w-64">
        <jsp:include page="fragment/sidebarCallCenter.jsp"/>
    </div>

    <!-- Contenedor principal ajustado para ocupar el resto del espacio disponible -->
    <main class="bg-gray-100 h-full w-full flex">
        <!-- Columna izquierda: Lista de chats de usuarios -->
        <div class="w-1/4 bg-white p-4 shadow-lg overflow-y-auto">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Chats</h2>
            <ul class="space-y-4">
                <div class="flex space-x-4 flex justify-center items-center">
                    <!-- Caja de "Todos" -->
                    <button class="bg-green-700 text-white font-semibold py-2 px-4 rounded-full">
                        Todos
                    </button>
                    <!-- Caja de "No leídos" -->
                    <button class="bg-red-400 text-gray-300 font-semibold py-2 px-4 rounded-full">
                        No leídos
                    </button>
                </div>
                <!-- Chat 1 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 1" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Ana Fernández</p>
                        <p class="text-gray-600 text-sm truncate">¿Nos vemos mañana para revisar el...?</p>
                    </div>
                    <p class="text-gray-500 text-xs">12:30 PM</p>
                </li>

                <!-- Chat 2 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 2" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Carlos López</p>
                        <p class="text-gray-600 text-sm truncate">El informe está listo, te lo envío por...</p>
                    </div>
                    <p class="text-gray-500 text-xs">11:45 AM</p>
                </li>

                <!-- Chat 3 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 3" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">María Pérez</p>
                        <p class="text-gray-600 text-sm truncate">Genial, entonces quedamos para el...</p>
                    </div>
                    <p class="text-gray-500 text-xs">9:15 AM</p>
                </li>

                <!-- Chat 4 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 4" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Juan Martínez</p>
                        <p class="text-gray-600 text-sm truncate">¿Puedes revisar el archivo que te...?</p>
                    </div>
                    <p class="text-gray-500 text-xs">8:00 AM</p>
                </li>
                <!-- Chat 1 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 1" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Ana Fernández</p>
                        <p class="text-gray-600 text-sm truncate">¿Nos vemos mañana para revisar el...?</p>
                    </div>
                    <p class="text-gray-500 text-xs">12:30 PM</p>
                </li>

                <!-- Chat 2 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 2" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Carlos López</p>
                        <p class="text-gray-600 text-sm truncate">El informe está listo, te lo envío por...</p>
                    </div>
                    <p class="text-gray-500 text-xs">11:45 AM</p>
                </li>

                <!-- Chat 3 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 3" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">María Pérez</p>
                        <p class="text-gray-600 text-sm truncate">Genial, entonces quedamos para el...</p>
                    </div>
                    <p class="text-gray-500 text-xs">9:15 AM</p>
                </li>

                <!-- Chat 4 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 4" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Juan Martínez</p>
                        <p class="text-gray-600 text-sm truncate">¿Puedes revisar el archivo que te...?</p>
                    </div>
                    <p class="text-gray-500 text-xs">8:00 AM</p>
                </li>
                <!-- Chat 1 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 1" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Ana Fernández</p>
                        <p class="text-gray-600 text-sm truncate">¿Nos vemos mañana para revisar el...?</p>
                    </div>
                    <p class="text-gray-500 text-xs">12:30 PM</p>
                </li>

                <!-- Chat 2 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 2" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Carlos López</p>
                        <p class="text-gray-600 text-sm truncate">El informe está listo, te lo envío por...</p>
                    </div>
                    <p class="text-gray-500 text-xs">11:45 AM</p>
                </li>

                <!-- Chat 3 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 3" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">María Pérez</p>
                        <p class="text-gray-600 text-sm truncate">Genial, entonces quedamos para el...</p>
                    </div>
                    <p class="text-gray-500 text-xs">9:15 AM</p>
                </li>

                <!-- Chat 4 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 4" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Juan Martínez</p>
                        <p class="text-gray-600 text-sm truncate">¿Puedes revisar el archivo que te...?</p>
                    </div>
                    <p class="text-gray-500 text-xs">8:00 AM</p>
                </li>
                <!-- Chat 1 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 1" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Ana Fernández</p>
                        <p class="text-gray-600 text-sm truncate">¿Nos vemos mañana para revisar el...?</p>
                    </div>
                    <p class="text-gray-500 text-xs">12:30 PM</p>
                </li>

                <!-- Chat 2 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 2" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Carlos López</p>
                        <p class="text-gray-600 text-sm truncate">El informe está listo, te lo envío por...</p>
                    </div>
                    <p class="text-gray-500 text-xs">11:45 AM</p>
                </li>

                <!-- Chat 3 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 3" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">María Pérez</p>
                        <p class="text-gray-600 text-sm truncate">Genial, entonces quedamos para el...</p>
                    </div>
                    <p class="text-gray-500 text-xs">9:15 AM</p>
                </li>

                <!-- Chat 4 -->
                <li class="flex items-center space-x-3 p-2 cursor-pointer hover:bg-gray-100 rounded-lg">
                    <div class="w-12 h-11 rounded-full overflow-hidden bg-gray-200">
                        <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen de usuario 4" class="w-full h-full object-cover">
                    </div>
                    <div class="flex-1">
                        <p class="text-gray-800 font-bold">Juan Martínez</p>
                        <p class="text-gray-600 text-sm truncate">¿Puedes revisar el archivo que te...?</p>
                    </div>
                    <p class="text-gray-500 text-xs">8:00 AM</p>
                </li>
            </ul>
        </div>

        <!-- Contenedor principal -->
        <div class="flex-1 flex flex-col">
            <!-- Título de la pantalla -->
            <div class="flex justify-between items-center p-4 bg-white shadow-md">
                <h1 class="text-xl font-bold text-gray-800">MENSAJES</h1>
                <svg width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M37.4998 6.25C39.71 6.25 41.8296 7.12797 43.3924 8.69078C44.9552 10.2536 45.8332 12.3732 45.8332 14.5833V31.25C45.8332 33.4601 44.9552 35.5798 43.3924 37.1426C41.8296 38.7054 39.71 39.5833 37.4998 39.5833H27.6582L17.7373 45.5354C17.4386 45.7147 17.0996 45.8162 16.7514 45.8306C16.4033 45.845 16.0571 45.7719 15.7445 45.6179C15.432 45.4639 15.163 45.2339 14.9623 44.9491C14.7616 44.6643 14.6355 44.3337 14.5957 43.9875L14.5832 43.75V39.5833H12.4998C10.3618 39.5833 8.30561 38.7616 6.75648 37.2881C5.20735 35.8146 4.28382 33.802 4.17692 31.6667L4.1665 31.25V14.5833C4.1665 12.3732 5.04448 10.2536 6.60728 8.69078C8.17008 7.12797 10.2897 6.25 12.4998 6.25H37.4998ZM29.1665 25H16.6665C16.114 25 15.5841 25.2195 15.1934 25.6102C14.8027 26.0009 14.5832 26.5308 14.5832 27.0833C14.5832 27.6359 14.8027 28.1658 15.1934 28.5565C15.5841 28.9472 16.114 29.1667 16.6665 29.1667H29.1665C29.719 29.1667 30.2489 28.9472 30.6396 28.5565C31.0303 28.1658 31.2498 27.6359 31.2498 27.0833C31.2498 26.5308 31.0303 26.0009 30.6396 25.6102C30.2489 25.2195 29.719 25 29.1665 25ZM33.3332 16.6667H16.6665C16.114 16.6667 15.5841 16.8862 15.1934 17.2769C14.8027 17.6676 14.5832 18.1975 14.5832 18.75C14.5832 19.3025 14.8027 19.8324 15.1934 20.2231C15.5841 20.6138 16.114 20.8333 16.6665 20.8333H33.3332C33.8857 20.8333 34.4156 20.6138 34.8063 20.2231C35.197 19.8324 35.4165 19.3025 35.4165 18.75C35.4165 18.1975 35.197 17.6676 34.8063 17.2769C34.4156 16.8862 33.8857 16.6667 33.3332 16.6667Z" fill="#115691"/>
                </svg>
            </div>

            <!-- Contenedor principal de mensajes -->
            <div class="flex-1 p-4 overflow-y-auto space-y-4">
                <h2 class="text-center text-gray-500 font-semibold">Hoy</h2>

                <!-- Mensaje del usuario -->
                <div class="flex justify-start">
                    <div class="bg-purple-100 p-4 rounded-lg max-w-md flex items-start space-x-3">
                        <div class="w-16 h-16 rounded-full overflow-hidden bg-purple-200 flex-shrink-0">
                            <img src="https://s3-alpha-sig.figma.com/img/df6f/7dcc/cbd89a280a03d4cbd7e1a1bb62300be5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=SSECtyJ8TddpT3RFa~0hPcl77nXSa6Y8xsI-3TfwD~fNXAh0esxBO02-UMAfkXYgSygR7CKjwVjkXVNNFKRjuP4Sn9HBZppxLedaM935q4YwnmKXVftgy~YnSUA1rzbo~aUjxgmkoCg41KWxOc~K~ZRVKJFwNHPsyiMkTKqFJNhUhMJfNYJHFOxo6R-MfK2~sODGrRGOxOrzeQ4gUs4CCRlkgr-q5guFQkzfUc8fsPJQl1ypNUv7P6tXVSpozRYjVxiAkguECPoPnfBabbTsfzkaNsg5GeJJ7StyPjsRvLqgzegIRGpDgfWRVkOO03OAvZGoGC9Me1gxHln5fz71aA__" alt="Imagen 1" class="w-full h-full object-cover">
                        </div>
                        <div>
                            <p class="text-gray-800 font-bold">Buenos días, ¿qué pruebas debo hacerme durante el embarazo?
                            </p>
                            <p class="text-xs text-gray-500">23/09/2024 21:00</p>
                            <span class="ml-auto bg-green-500 text-white text-xs px-2 py-1 font-bold rounded-full">Leído</span>
                        </div>
                    </div>
                </div>

                <!-- Mensaje de Femisalud -->
                <div class="flex justify-end">
                    <div class="bg-blue-100 p-4 rounded-lg max-w-lg flex items-start space-x-3">
                        <!-- Contenedor para la imagen circular -->
                        <div class="w-16 h-16 rounded-full overflow-hidden bg-blue-400 flex-shrink-0">
                            <img src="https://s3-alpha-sig.figma.com/img/9b8f/8a28/68191cfadcf3ac744993fc6555829f54?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AVn1bMwjiC9YtahL2eotnj4E5~3Bii9~PXrBenEO49~YewepWBUulEM3AaSIbH0u0mmy6WJjB3BFR0Lb3vwzIqcvghIu~Du~mFxihPZyvdBTXB~ItcrNsylhwtyO2MPUswoGVNKsLeqta2sxUQHaUbsiwBPxE-E2DaPgyptfjO90rwTMqECwVtZnQg34o9fRngd1WI8UvpV-Mhz2YxpgoYfOnzSn7xlg0pmJriz7-AqWSpUk6OqyFr6On9DIz6bWwV8k8Wdebppz7sTPHhcql7o9p-yxeTox-P7Ja4yiTC6vlYfpgOX8-QAJN-YdprQEELSt1nXxPbCHactngL64-g__" alt="Imagen 2" class="py-6 object-cover">
                        </div>
                        <!-- Contenedor del mensaje -->
                        <div class="max-w-full">
                            <p class="text-gray-800 font-bold break-words">Buenos días. Si tu embarazo evoluciona con normalidad y es de bajo riesgo lo normal es que te realicen tres análisis, distribuidas una en cada trimestre. La primera se realiza sobre las 10 semanas de embarazo y está compuesta por: una analítica básica de sangre, un análisis de orina y  la determinación del grupo sanguíneo, así como Rh y el test de Coombs indirecto.</p>
                            <p class="text-xs text-gray-500">23/09/2024 21:00</p>
                            <span class="ml-auto bg-green-500 text-white text-xs px-2 py-1 font-bold rounded-full">Leído</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Barra de entrada de texto y botón de envío -->
            <div class="flex items-center p-4 bg-blue-800 shadow-lg border-4 border-solid rounded-t-lg border-blue-800">
                <input type="text" placeholder="Escribe un mensaje" class="flex-1 border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-purple-400" />
                <button class="ml-2 bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-purple-600 focus:outline-none focus:ring-2 focus:ring-purple-400">
                    Enviar Mensaje
                </button>
            </div>
        </div>
    </main>
</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/sidebar.js" defer></script>
</html>
