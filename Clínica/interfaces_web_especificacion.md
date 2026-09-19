# Especificación de Interfaces Web - Diseño Responsivo y Moderno

Este documento define la estructura, directrices de diseño UI/UX y la especificación técnica de las interfaces web responsivas para la aplicación basada en los requerimientos del cliente.

---

## 1. Guía de Diseño y Estilos (Design System)

### 1.1. Paleta de Colores
* **Color Primario (Primary):** `#2563EB` (Azul moderno / Royal Blue) - Usado para CTAs principales, enlaces y elementos activos.
* **Color Secundario (Secondary):** `#0F172A` (Slate Oscuro) - Usado para títulos, barra de navegación y elementos de alto contraste.
* **Color de Acento (Accent):** `#10B981` (Verde Esmeralda) - Usado para estados de éxito, indicadores positivos y acciones secundarias clave.
* **Fondo General (Background):** `#F8FAFC` (Gris muy claro / Off-white) - Proporciona un lienzo limpio y reduce la fatiga visual.
* **Superficies / Tarjetas (Surface):** `#FFFFFF` (Blanco puro) - Contenedores de información y tarjetas de contenido.
* **Texto Principal:** `#334155` (Gris Pizarra Oscuro) - Excelente legibilidad en fondos claros.
* **Texto Secundario:** `#64748B` (Gris Pizarra Medio) - Metadatos y descripciones secundarias.

### 1.2. Tipografía
* **Tipografía Principal:** Inter, system-ui, -apple-system, sans-serif.
* **Jerarquía de Textos:**
  * **H1 (Título de Página):** `32px` / Bold / `1.2` line-height
  * **H2 (Subtítulos de Sección):** `24px` / SemiBold / `1.3` line-height
  * **H3 (Títulos de Tarjetas/Módulos):** `18px` / Medium / `1.4` line-height
  * **Cuerpo (Body Text):** `15px` / Regular / `1.5` line-height
  * **Pequeño / Metadatos:** `13px` / Regular / `1.4` line-height

### 1.3. Componentes UI Reutilizables
* **Botones:**
  * *Primario:* Fondo `#2563EB`, texto blanco, esquinas redondeadas (`border-radius: 8px`), padding `10px 20px`, sombra sutil en hover (`box-shadow: 0 4px 6px -1px rgba(37, 99, 235, 0.2)`).
  * *Secundario / Outline:* Borde de `1px solid #CBD5E1`, fondo transparente, texto `#334155`.
* **Tarjetas (Cards):** Fondo blanco, esquinas redondeadas (`12px`), sombra ligera (`box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1)`), padding interno de `24px`.
* **Campos de Formulario:** Altura de `42px`, borde de `1px solid #CBD5E1`, border-radius de `6px`, padding interno horizontal de `12px`. Estado focus con borde `#2563EB` y anillo de enfoque sutil.

---

## 2. Arquitectura de Interfaces (Pantallas Clave)

### 2.1. Vista de Panel de Control / Dashboard (Principal)
* **Propósito:** Ofrecer una vista general del estado del sistema, métricas clave y accesos directos a las funciones principales.
* **Estructura Responsiva (Mobile-First):**
  * **Móvil (< 768px):** Menú tipo *hamburger*, diseño de tarjetas en una sola columna (`grid-template-columns: 1fr`).
  * **Tablet (768px - 1024px):** Menú lateral colapsable, tarjetas en rejilla de 2 columnas.
  * **Escritorio (> 1024px):** Barra lateral fija (*Sidebar* de 260px), área de contenido principal con diseño de 3 o 4 columnas para métricas y gráficos.
* **Componentes de la Interfaz:**
  * **Sección Superior (Header):** Saludo personalizado, buscador global y avatar de usuario con menú desplegable de perfil.
  * **Tarjetas de Resumen (KPIs):** 4 tarjetas métricas con iconos minimalistas, valor numérico destacado y porcentaje de variación (ej. "+12% este mes").
  * **Sección de Actividad Reciente / Gráficos:** Contenedor dual con un gráfico de tendencias (ancho completo en móvil, 2/3 en escritorio) y un feed de últimas acciones del sistema (1/3 en escritorio).

### 2.2. Vista de Gestión de Datos / Listado
* **Propósito:** Permitir al usuario visualizar, filtrar, buscar y gestionar los registros principales del sistema.
* **Estructura de la Interfaz:**
  * **Barra de Acciones Superior:** Campo de búsqueda con icono de lupa, filtros desplegables avanzados (por categoría, fecha o estado) y botón de acción principal ("Nuevo Registro").
  * **Tabla Adaptativa / Tarjetas en Móvil:**
    * *En Escritorio:* Tabla tradicional con cabeceras ordenables, filas con efecto hover sutil y columna final de acciones (Editar / Eliminar con iconos limpios).
    * *En Móvil:* Transformación automática de filas de tabla en tarjetas individuales apiladas verticalmente para evitar desplazamiento horizontal forzado.
  * **Paginación / Carga Infinita:** Controles de navegación de página limpios ubicados en la esquina inferior derecha.

### 2.3. Vista de Formulario / Detalle (Creación o Edición)
* **Propósito:** Capturar o modificar información estructurada del sistema de manera intuitiva.
* **Estructura de la Interfaz:**
  * **Cabecera de Módulo:** Título claro indicando la acción ("Crear Nuevo Elemento" o "Editar Registro #ID") con botón de retorno ("Volver").
  * **Contenedor del Formulario:** Diseño en dos columnas en pantallas grandes para optimizar el espacio vertical, agrupando los campos por secciones lógicas mediante subtítulos limpios y líneas divisorias tenues.
  * **Barra de Acciones Inferior (Sticky Footer en Móvil):** Botones de "Cancelar" (secundario) y "Guardar Cambios" (primario, destacado a la derecha).

---

## 3. Especificación de Adaptabilidad Responsiva (Breakpoints CSS)

Para garantizar una experiencia fluida en cualquier dispositivo, se implementará el siguiente sistema de media queries basados en CSS Grid y Flexbox:

```css
/* Base Styles (Mobile First) */
.container {
  width: 100%;
  padding: 16px;
  display: flex;
  flex-direction: column;
}

/* Tablet Devices (Min-width: 768px) */
@media (min-width: 768px) {
  .container {
    padding: 24px;
  }
  .grid-layout {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
  }
}

/* Desktop Devices (Min-width: 1024px) */
@media (min-width: 1024px) {
  .container {
    padding: 32px;
    max-width: 1280px;
    margin: 0 auto;
  }
  .grid-layout {
    grid-template-columns: repeat(4, 1fr);
  }
}
```

---

## 4. Criterios de Aceptación de la Interfaz
1. **Accesibilidad (a11y):** Contraste de color validado según las normativas WCAG AA para textos y fondos.
2. **Rendimiento Visual:** Tiempos de carga percibidos rápidos mediante esqueletos de carga (*skeletons*) en lugar de pantallas en blanco.
3. **Fluidez:** Transiciones suaves (hover effects, apertura de modales y menús desplegables) con duraciones de `200ms` a `300ms`.
