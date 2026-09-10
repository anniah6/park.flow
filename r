// ==========================================
// PARKFLOW - JAVASCRIPT
// ==========================================

// Obtener registros guardados
let registros = JSON.parse(localStorage.getItem("parkflowRegistros")) || [];


// ==========================================
// CAMBIAR DE PANTALLA
// ==========================================

function mostrarPantalla(id) {

    document.querySelectorAll(".pantalla").forEach(pantalla => {
        pantalla.classList.remove("activa");
    });

    const pantallaSeleccionada = document.getElementById(id);

    if (pantallaSeleccionada) {
        pantallaSeleccionada.classList.add("activa");
    }

    if (id === "resultados") {
        actualizarResultados();
    }

    if (id === "historial") {
        actualizarHistorial();
    }
}


// ==========================================
// AYUDA PARA LA PLACA
// ==========================================

function cambiarAyudaPlaca() {

    const tipo = document.getElementById("tipo");
    const placa = document.getElementById("placa");
    const ayuda = document.getElementById("ayudaPlaca");

    if (tipo.value === "moto") {

        placa.placeholder = "12A";
        placa.maxLength = 3;

        ayuda.textContent =
            "Moto: 2 números y 1 letra. Ejemplo: 12A";

    } else {

        placa.placeholder = "ABC123";
        placa.maxLength = 6;

        ayuda.textContent =
            "Carro: 3 letras y 3 números. Ejemplo: ABC123";
    }

    placa.value = "";
}


// ==========================================
// VALIDAR PLACA
// ==========================================

function validarPlaca(placa, tipo) {

    placa = placa.toUpperCase().trim();

    if (tipo === "carro") {

        return /^[A-Z]{3}[0-9]{3}$/.test(placa);

    } else {

        return /^[0-9]{2}[A-Z]$/.test(placa);
    }
}


// ==========================================
// GUARDAR REGISTRO
// ==========================================

document.getElementById("formulario").addEventListener("submit", function(event) {

    event.preventDefault();

    const fecha = document.getElementById("fecha").value;
    const hora = document.getElementById("hora").value;
    const tipo = document.getElementById("tipo").value;
    const placa = document.getElementById("placa").value
        .toUpperCase()
        .trim();

    const mensaje = document.getElementById("mensaje");


    // Validar placa
    if (!validarPlaca(placa, tipo)) {

        mensaje.textContent = tipo === "moto"
            ? "❌ La moto debe tener 2 números y 1 letra. Ejemplo: 12A"
            : "❌ El carro debe tener 3 letras y 3 números. Ejemplo: ABC123";

        mensaje.className = "error";

        return;
    }


    // Evitar registros duplicados
    const registroDuplicado = registros.some(registro =>
        registro.placa === placa &&
        registro.fecha === fecha &&
        registro.hora === hora
    );

    if (registroDuplicado) {

        mensaje.textContent =
            "⚠️ Este vehículo ya está registrado para esa fecha y hora.";

        mensaje.className = "error";

        return;
    }


    // Crear registro
    const nuevoRegistro = {
        id: Date.now(),
        fecha: fecha,
        hora: hora,
        tipo: tipo,
        placa: placa
    };


    registros.push(nuevoRegistro);


    // Guardar en localStorage
    localStorage.setItem(
        "parkflowRegistros",
        JSON.stringify(registros)
    );


    // Mensaje de éxito
    mensaje.textContent =
        "✅ Registro guardado correctamente.";

    mensaje.className = "exito";


    // Limpiar formulario
    document.getElementById("formulario").reset();

    cambiarAyudaPlaca();

    // Colocar fecha actual nuevamente
    establecerFechaActual();

    actualizarResultados();
    actualizarHistorial();
});


// ==========================================
// RESULTADOS
// ==========================================

function actualizarResultados() {

    const total = document.getElementById("total");
    const mayorFlujo = document.getElementById("mayorFlujo");
    const congestion = document.getElementById("congestion");
    const grafico = document.getElementById("grafico");
    const mensajeCongestion =
        document.getElementById("mensajeCongestion");


    // Total de vehículos
    total.textContent = registros.length;


    // Si no existen registros
    if (registros.length === 0) {

        mayorFlujo.textContent = "--";
        congestion.textContent = "--";

        grafico.innerHTML =
            "No hay registros para mostrar.";

        mensajeCongestion.innerHTML =
            "No hay suficientes registros para realizar el análisis.";

        return;
    }


    // ======================================
    // CONTAR VEHÍCULOS POR HORA
    // ======================================

    const horas = {};

    registros.forEach(registro => {

        const hora = registro.hora.substring(0, 2);

        if (!horas[hora]) {
            horas[hora] = 0;
        }

        horas[hora]++;
    });


    // ======================================
    // BUSCAR HORA DE MAYOR FLUJO
    // ======================================

    let horaMayor = null;
    let cantidadMayor = 0;

    Object.keys(horas).forEach(hora => {

        if (horas[hora] > cantidadMayor) {

            cantidadMayor = horas[hora];
            horaMayor = hora;
        }
    });


    const siguienteHora =
        String((parseInt(horaMayor) + 1) % 24)
            .padStart(2, "0");


    mayorFlujo.textContent =
        `${horaMayor}:00 - ${siguienteHora}:00`;

    congestion.textContent =
        `${horaMayor}:00`;


    // ======================================
    // CREAR GRÁFICO
    // ======================================

    grafico.innerHTML = "";

    const maximo = Math.max(...Object.values(horas));


    Object.keys(horas)
        .sort()
        .forEach(hora => {

            const cantidad = horas[hora];

            const porcentaje =
                (cantidad / maximo) * 100;

            const siguiente =
                String((parseInt(hora) + 1) % 24)
                    .padStart(2, "0");


            grafico.innerHTML += `
                <div class="barra">

                    <strong>
                        ${hora}:00 - ${siguiente}:00
                        (${cantidad} vehículos)
                    </strong>

                    <div class="barra-fondo">

                        <div
                            class="barra-relleno"
                            style="width:${porcentaje}%">
                        </div>

                    </div>

                </div>
            `;
        });


    // ======================================
    // MENSAJE DE CONGESTIÓN
    // ======================================

    mensajeCongestion.innerHTML = `
        <strong>
            ⏰ ${horaMayor}:00 - ${siguienteHora}:00
        </strong>

        es el periodo con mayor flujo vehicular.

        <br><br>

        Se recomienda reforzar el control
        de ingreso durante este intervalo.

        <br><br>

        <strong>
            🚗 ${cantidadMayor} vehículo(s)
        </strong>
        registrado(s) en este periodo.
    `;
}


// ==========================================
// HISTORIAL
// ==========================================

function actualizarHistorial() {

    const lista =
        document.getElementById("listaRegistros");


    if (registros.length === 0) {

        lista.innerHTML =
            "No hay registros todavía.";

        return;
    }


    lista.innerHTML = "";


    // Mostrar primero los registros más recientes
    registros
        .slice()
        .reverse()
        .forEach(registro => {

            lista.innerHTML += `

                <div class="registro">

                    <strong>
                        ${registro.placa}
                    </strong>

                    <span class="chip">
                        ${
                            registro.tipo === "moto"
                            ? "🏍️ Moto"
                            : "🚗 Carro"
                        }
                    </span>

                    <span>
                        📅 ${registro.fecha}
                    </span>

                    <span>
                        ⏱️ ${registro.hora}
                    </span>

                    <button
                        class="boton-eliminar"
                        onclick="eliminarRegistro(${registro.id})">

                        🗑️ Eliminar

                    </button>

                </div>
            `;
        });
}


// ==========================================
// ELIMINAR UN REGISTRO
// ==========================================

function eliminarRegistro(id) {

    const confirmar =
        confirm("¿Deseas eliminar este registro?");

    if (!confirmar) {
        return;
    }


    registros = registros.filter(
        registro => registro.id !== id
    );


    localStorage.setItem(
        "parkflowRegistros",
        JSON.stringify(registros)
    );


    actualizarHistorial();
    actualizarResultados();
}


// ==========================================
// ELIMINAR TODOS LOS REGISTROS
// ==========================================

function eliminarTodosLosRegistros() {

    if (registros.length === 0) {

        alert("No existen registros para eliminar.");

        return;
    }


    const confirmar = confirm(
        "¿Estás seguro de eliminar TODOS los registros?"
    );


    if (!confirmar) {
        return;
    }


    registros = [];

    localStorage.removeItem("parkflowRegistros");


    actualizarHistorial();
    actualizarResultados();


    alert("Todos los registros fueron eliminados.");
}


// ==========================================
// ESTADÍSTICAS DE CARROS Y MOTOS
// ==========================================

function obtenerEstadisticasTipo() {

    const carros =
        registros.filter(r => r.tipo === "carro").length;

    const motos =
        registros.filter(r => r.tipo === "moto").length;


    return {
        carros: carros,
        motos: motos
    };
}


// ==========================================
// BUSCAR VEHÍCULO
// ==========================================

function buscarVehiculo() {

    const entrada =
        document.getElementById("buscarPlaca");

    const resultado =
        document.getElementById("resultadoBusqueda");


    if (!entrada || !resultado) {
        return;
    }


    const placa =
        entrada.value.toUpperCase().trim();


    if (!placa) {

        resultado.innerHTML =
            "Escribe una placa para buscar.";

        return;
    }


    const encontrados =
        registros.filter(r =>
            r.placa.includes(placa)
        );


    if (encontrados.length === 0) {

        resultado.innerHTML =
            "❌ No se encontró ningún vehículo.";

        return;
    }


    resultado.innerHTML =
        encontrados.map(r => `

            <div class="registro">

                <strong>${r.placa}</strong>

                <span class="chip">
                    ${
                        r.tipo === "moto"
                        ? "🏍️ Moto"
                        : "🚗 Carro"
                    }
                </span>

                <span>
                    📅 ${r.fecha}
                </span>

                <span>
                    ⏱️ ${r.hora}
                </span>

            </div>

        `).join("");
}


// ==========================================
// ESTABLECER FECHA ACTUAL
// ==========================================

function establecerFechaActual() {

    const campoFecha =
        document.getElementById("fecha");

    if (!campoFecha) {
        return;
    }


    const hoy = new Date();

    const año = hoy.getFullYear();

    const mes = String(hoy.getMonth() + 1)
        .padStart(2, "0");

    const dia = String(hoy.getDate())
        .padStart(2, "0");


    campoFecha.value =
        `${año}-${mes}-${dia}`;
}


// ==========================================
// HORA ACTUAL
// ==========================================

function establecerHoraActual() {

    const campoHora =
        document.getElementById("hora");

    if (!campoHora) {
        return;
    }


    const ahora = new Date();

    const horas =
        String(ahora.getHours()).padStart(2, "0");

    const minutos =
        String(ahora.getMinutes()).padStart(2, "0");


    campoHora.value =
        `${horas}:${minutos}`;
}


// ==========================================
// INICIALIZACIÓN
// ==========================================

document.addEventListener("DOMContentLoaded", function() {

    establecerFechaActual();

    cambiarAyudaPlaca();

    actualizarHistorial();

    actualizarResultados();

});
