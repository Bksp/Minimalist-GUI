#version 150

in vec4 vertexColor;
in vec3 vertexPos;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor;

    // --- LOGICA DE COLORES PERSONALIZADOS ---
    // Base Hex Original: #A64EDF (Violeta)
    
    // 1. DETECCION DEL FONDO
    // El fondo vanilla tiene alpha ~0.94. Lo cambiamos a Violeta Oscuro Transparente.
    // Valores calculados: R=0.13, G=0.06, B=0.17, Alpha=0.85 (Transparencia)
    if (color.a >= 0.9 && color.a < 1.0) {
        color = vec4(0.13, 0.06, 0.175, 0.85); 
    } 
    
    // 2. DETECCION DEL BORDE
    // El borde vanilla es sólido (1.0) o gradiente (0.5). Lo cambiamos a Violeta Claro Brillante.
    // Valores calculados: R=0.78, G=0.37, B=1.0 (Mas claro que el original)
    else if (color.a == 1.0 || (color.a == 0.5 && color.b > 0.5)) {
        color = vec4(0.78, 0.37, 1.0, 1.0);
    }

    fragColor = color * ColorModulator;
}