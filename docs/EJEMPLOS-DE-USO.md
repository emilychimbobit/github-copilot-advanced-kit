# Ejemplos de uso

## Arquitectura

```text
Selecciona Architect.
Analiza cómo se implementa la autorización por tenant. Entrega mapa de flujo, puntos de riesgo y plan para centralizar la política sin editar código.
```

## Feature .NET

```text
/plan-feature requerimiento="POST /customers con idempotency key, validación, autorización por tenant y auditoría"
```

Después del handoff:

```text
Implementa solo la primera fase aprobada. Ejecuta los tests backend relevantes y reporta evidencia.
```

## React

```text
Usa /react-component para crear CustomerForm con estados loading/error/success, validación accesible y pruebas de teclado.
```

## Seguridad

```text
/review-pr alcance="PR 42"
```

```text
/threat-model flujo="carga de archivos desde frontend hasta almacenamiento"
```

## CI/CD

```text
/debug-ci workflow="validate-copilot-customizations" run="URL del run"
```

## GitHub MCP

```text
Selecciona GitHub Operator.
Lista issues con label copilot-ready. No escribas nada.
```

```text
Prepara el comentario para el issue 15 con el plan aprobado. Muéstrame el texto y espera confirmación antes de publicarlo.
```

## Orquestación

```text
/issue-to-pr issue="https://github.com/OWNER/REPO/issues/123"
```

El orquestador debe detenerse para la aprobación humana del plan.
