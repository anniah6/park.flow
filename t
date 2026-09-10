```css
/* ==========================================
   PARKFLOW - INTERFAZ VISUAL
   ========================================== */

:root {
    --azul-oscuro: #08263d;
    --azul: #176b9e;
    --azul-claro: #3c9bd0;
    --azul-suave: #eaf5fb;

    --blanco: #ffffff;
    --fondo: #f3f7fb;

    --texto: #102a3c;
    --texto-suave: #60788a;

    --verde: #1c9b67;
    --rojo: #d94b4b;

    --sombra:
        0 10px 30px rgba(8, 38, 61, 0.08);

    --radio: 22px;
}


/* ==========================================
   CONFIGURACIÓN GENERAL
   ========================================== */

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: "Inter", Arial, sans-serif;
    background:
        radial-gradient(
            circle at top right,
            rgba(60, 155, 208, 0.12),
            transparent 30%
        ),
        var(--fondo);

    color: var(--texto);
    min-height: 100vh;
    padding-bottom: 100px;
}


/* ==========================================
   HEADER
   ========================================== */

header {
    position: relative;
    overflow: hidden;

    padding: 35px 20px 42px;

    background:
        linear-gradient(
            135deg,
            #06243a,
            #124c6d 60%,
            #1975a7
        );

    color: white;

    text-align: center;

    border-radius: 0 0 35px 35px;

    box-shadow:
        0 10px 35px rgba(4, 35, 55, 0.25);
}

header::before {
    content: "";

    position: absolute;

    width: 280px;
    height: 280px;

    right: -100px;
    top: -150px;

    border-radius: 50%;

    background: rgba(255,255,255,0.08);
}

header::after {
    content: "";

    position: absolute;

    width: 180px;
    height: 180px;

    left: -80px;
    bottom: -120px;

    border-radius: 50%;

    background: rgba(255,255,255,0.06);
}

header h1 {
    position: relative;
    z-index: 2;

    font-size: 38px;
    font-weight: 700;

    letter-spacing: -1px;

    margin-bottom: 8px;
}

header p {
    position: relative;
    z-index: 2;

    font-size: 15px;

    color: rgba(255,255,255,0.85);
}


/* ==========================================
   CONTENIDO
   ========================================== */

main {
    width: min(960px, 100%);

    margin: 30px auto;

    padding: 0 18px;
}


/* ==========================================
   PANTALLAS
   ========================================== */

.pantalla {
    display: none;

    animation:
        aparecer 0.35s ease;
}

.pantalla.activa {
    display: block;
}

@keyframes aparecer {

    from {
        opacity: 0;
        transform: translateY(15px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}


/* ==========================================
   TARJETAS
   ========================================== */

.card {
    background: rgba(255,255,255,0.96);

    border: 1px solid rgba(255,255,255,0.8);

    border-radius: var(--radio);

    padding: 28px;

    margin-bottom: 22px;

    box-shadow: var(--sombra);

    transition:
        transform 0.25s ease,
        box-shadow 0.25s ease;
}

.card:hover {
    transform: translateY(-2px);

    box-shadow:
        0 15px 40px rgba(8, 38, 61, 0.11);
}


/* ==========================================
   TÍTULOS
   ========================================== */

h2 {
    display: flex;
    align-items: center;
    gap: 10px;

    color: var(--azul-oscuro);

    font-size: 25px;

    margin-bottom: 15px;
}

h3 {
    color: #16445f;

    font-size: 19px;

    margin-bottom: 16px;
}

p {
    color: var(--texto-suave);
}


/* ==========================================
   BOTONES
   ========================================== */

.botones {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;

    margin-top: 24px;
}

button {
    border: none;

    padding: 13px 22px;

    border-radius: 50px;

    background:
        linear-gradient(
            135deg,
            var(--azul),
            var(--azul-claro)
        );

    color: white;

    font-family: inherit;

    font-size: 14px;
    font-weight: 600;

    cursor: pointer;

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease,
        filter 0.2s ease;

    box-shadow:
        0 5px 14px rgba(23, 107, 158, 0.2);
}

button:hover {
    transform: translateY(-2px);

    filter: brightness(1.05);

    box-shadow:
        0 8px 20px rgba(23, 107, 158, 0.3);
}

button:active {
    transform: scale(0.97);
}

.boton-secundario {
    background:
        linear-gradient(
            135deg,
            #526779,
            #364b5c
        );
}

.boton-eliminar {
    margin-left: auto;

    padding: 8px 14px;

    font-size: 12px;

    background: #fff0f0;

    color: var(--rojo);

    border: 1px solid #ffd4d4;

    box-shadow: none;
}

.boton-eliminar:hover {
    background: var(--rojo);
    color: white;
}


/* ==========================================
   FORMULARIOS
   ========================================== */

form {
    display: grid;

    gap: 10px;
}

label {
    color: #25475c;

    font-size: 13px;

    font-weight: 600;

    margin-top: 8px;
}

input,
select {
    width: 100%;

    border: 1.5px solid #dbe7ef;

    border-radius: 15px;

    padding: 13px 15px;

    background: #fafdff;

    color: var(--texto);

    font-family: inherit;

    font-size: 14px;

    outline: none;

    transition:
        border 0.2s,
        box-shadow 0.2s,
        background 0.2s;
}

input:hover,
select:hover {
    border-color: #b9d3e3;
}

input:focus,
select:focus {
    border-color: var(--azul);

    background: white;

    box-shadow:
        0 0 0 4px rgba(23,107,158,0.1);
}


/* ==========================================
   MENSAJES
   ========================================== */

.ayuda {
    display: inline-block;

    width: fit-content;

    padding: 8px 13px;

    margin-top: 3px;

    border-radius: 30px;

    background: var(--azul-suave);

    color: #38708f;

    font-size: 12px;
}

.error {
    padding: 12px 16px;

    border-radius: 13px;

    background: #fff0f0;

    color: var(--rojo);

    border-left: 4px solid var(--rojo);

    font-size: 13px;
}

.exito {
    padding: 12px 16px;

    border-radius: 13px;

    background: #eafaf3;

    color: var(--verde);

    border-left: 4px solid var(--verde);

    font-size: 13px;
}


/* ==========================================
   ESTADÍSTICAS
   ========================================== */

.estadisticas {
    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 15px;
}

.estadistica {
    position: relative;

    overflow: hidden;

    padding: 22px 15px;

    border-radius: 20px;

    background:
        linear-gradient(
            145deg,
            #f5faff,
            #eaf4fb
        );

    border: 1px solid #deedf7;

    text-align: center;

    color: var(--texto-suave);

    font-size: 13px;
}

.estadistica::before {
    content: "";

    position: absolute;

    width: 60px;
    height: 60px;

    right: -20px;
    top: -20px;

    border-radius: 50%;

    background: rgba(60,155,208,0.08);
}

.estadistica strong {
    display: block;

    margin-top: 8px;

    color: var(--azul-oscuro);

    font-size: 30px;
}


/* ==========================================
   GRÁFICOS
   ========================================== */

.barra {
    margin: 18px 0;
}

.barra strong {
    display: block;

    margin-bottom: 7px;

    color: #36576c;

    font-size: 13px;
}

.barra-fondo {
    width: 100%;

    height: 16px;

    overflow: hidden;

    border-radius: 20px;

    background: #e6eff5;
}

.barra-relleno {
    height: 100%;

    border-radius: 20px;

    background:
        linear-gradient(
            90deg,
            #176b9e,
            #4ca9d8
        );

    box-shadow:
        0 2px 7px rgba(23,107,158,0.25);

    transition: width 0.8s ease;
}


/* ==========================================
   HISTORIAL
   ========================================== */

.registro {
    display: flex;

    align-items: center;

    gap: 10px;

    flex-wrap: wrap;

    padding: 15px 0;

    border-bottom:
        1px solid #e8eff4;
}

.registro:last-child {
    border-bottom: none;
}

.registro strong {
    padding: 7px 13px;

    border-radius: 30px;

    background: #eaf3f9;

    color: var(--azul-oscuro);

    font-size: 15px;

    letter-spacing: 0.5px;
}

.chip {
    padding: 5px 11px;

    border-radius: 30px;

    background: #f0f5f9;

    color: #426277;

    font-size: 12px;
}


/* ==========================================
   ALERTAS
   ========================================== */

.alerta {
    border-radius: 18px !important;

    border-left: 5px solid var(--azul) !important;

    background:
        linear-gradient(
            135deg,
            #eef8fd,
            #f7fbfe
        ) !important;

    color: #36586d;

    box-shadow:
        0 5px 15px rgba(23,107,158,0.06);
}


/* ==========================================
   NAVEGACIÓN INFERIOR
   ========================================== */

nav {
    position: fixed;

    z-index: 100;

    left: 50%;
    bottom: 18px;

    transform: translateX(-50%);

    width: min(900px, calc(100% - 30px));

    display: flex;

    gap: 8px;

    padding: 10px;

    border-radius: 25px;

    background:
        rgba(255,255,255,0.88);

    backdrop-filter: blur(18px);

    -webkit-backdrop-filter: blur(18px);

    border: 1px solid rgba(255,255,255,0.9);

    box-shadow:
        0 12px 35px rgba(8,38,61,0.16);
}

nav button {
    flex: 1;

    max-width: none;

    padding: 11px 8px;

    background: transparent;

    color: #36576b;

    box-shadow: none;

    border-radius: 17px;

    font-size: 13px;
}

nav button:hover {
    background:
        linear-gradient(
            135deg,
            #176b9e,
            #318bb9
        );

    color: white;

    box-shadow:
        0 5px 15px rgba(23,107,158,0.25);
}


/* ==========================================
   RESPONSIVE
   ========================================== */

@media (max-width: 700px) {

    header {
        padding: 28px 15px 35px;

        border-radius: 0 0 25px 25px;
    }

    header h1 {
        font-size: 30px;
    }

    main {
        padding: 0 12px;
    }

    .card {
        padding: 21px 17px;

        border-radius: 20px;
    }

    .estadisticas {
        grid-template-columns: 1fr;
    }

    .botones {
        flex-direction: column;
    }

    .botones button {
        width: 100%;
    }

    nav {
        bottom: 10px;

        width: calc(100% - 20px);

        border-radius: 20px;
    }

    nav button {
        font-size: 11px;

        padding: 10px 4px;
    }

    .registro {
        align-items: flex-start;
    }

    .boton-eliminar {
        width: 100%;
        margin-left: 0;
    }
}


/* ==========================================
   ANIMACIÓN DE BOTONES
   ========================================== */

@keyframes pulso {

    0% {
        box-shadow:
            0 0 0 0 rgba(23,107,158,0.3);
    }

    70% {
        box-shadow:
            0 0 0 8px rgba(23,107,158,0);
    }

    100% {
        box-shadow:
            0 0 0 0 rgba(23,107,158,0);
    }
}


/* ==========================================
   SCROLLBAR
   ========================================== */

::-webkit-scrollbar {
    width: 8px;
}

::-webkit-scrollbar-track {
    background: #edf3f7;
}

::-webkit-scrollbar-thumb {
    background: #a8c5d6;

    border-radius: 20px;
}

::-webkit-scrollbar-thumb:hover {
    background: #6e9db6;
}
```

Luego, en tu HTML, **después de la línea de la fuente de Google**, agrega:

```html
<link rel="stylesheet" href="estilos.css">
```

Tu `<head>` quedaría aproximadamente así:

```html
<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>ParkFlow · control vehicular</title>

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
        rel="stylesheet"
    >

    <link rel="stylesheet" href="estilos.css">

</head>
```

**Importante:** tu HTML ya contiene un bloque `<style>` bastante grande con los estilos originales. Para que el nuevo diseño no se mezcle de manera inesperada, lo ideal es **quitar ese `<style>...</style>` original** y dejar que `estilos.css` controle toda la apariencia.

Así te quedarían los tres archivos:

```text
📁 PARKFLOW
│
├── 📄 Park Flow (1).html
├── 📄 estilos.css
└── 📄 script.js
```

Con esa separación tienes **HTML = estructura**, **CSS = diseño** y **JavaScript = funcionamiento**, que es una estructura mucho más limpia para presentar el proyecto.
