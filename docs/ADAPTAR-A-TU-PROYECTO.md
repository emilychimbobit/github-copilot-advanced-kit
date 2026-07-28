# Adaptar el kit a tu proyecto

## 1. Ajusta rutas

Modifica `applyTo` en `.github/instructions`:

- backend;
- frontend;
- tests;
- workflows;
- infraestructura;
- documentación.

## 2. Ajusta comandos

Actualiza `AGENTS.md` con los comandos reales y verificables del proyecto:

- restore/install;
- format/lint;
- build;
- unit tests;
- integration tests;
- security scans.

## 3. Ajusta arquitectura

En `.github/copilot-instructions.md` elimina reglas que contradigan la arquitectura real. No obligues Clean Architecture, CQRS o un patrón específico si el repositorio no lo usa.

## 4. Ajusta agentes

- Mantén Architect y Security Reviewer en solo lectura.
- Limita MCP por agente.
- Elimina agentes que no aporten valor.
- Revisa handoffs y nombres de archivo.
- No fijes un modelo si el tenant no garantiza su disponibilidad.

## 5. Ajusta skills

Haz descripciones específicas: Copilot decide cuándo cargar un skill principalmente por su `description`.

Agrega scripts solo si:

- son necesarios;
- están versionados;
- son auditables;
- no requieren secretos;
- tienen comportamiento seguro.

## 6. Ajusta MCP

Conserva únicamente servidores aprobados. Usa inputs o variables para credenciales. No dupliques el mismo servidor en workspace y configuración personal.

## 7. Gobierno

Define:

- propietarios de instrucciones, prompts, agentes y MCP;
- revisión periódica;
- proceso de cambios;
- métricas de calidad;
- política de aprobación de herramientas;
- inventario de servidores permitidos.
