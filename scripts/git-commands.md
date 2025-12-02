# 📝 Comandos Git Útiles para la Práctica

Esta guía contiene todos los comandos Git que necesitarás para completar la práctica.

---

## 🌿 Crear y Gestionar Ramas

### Crear las ramas requeridas

```bash
# Asegúrate de estar en main y actualizado
git checkout main
git pull origin main

# Crear rama feature_a
git checkout -b feature_a
git push -u origin feature_a

# Crear rama feature_b
git checkout -b feature_b
git push -u origin feature_b

# Volver a main
git checkout main
```

### Ver todas las ramas

```bash
# Ramas locales
git branch

# Ramas remotas
git branch -r

# Todas las ramas
git branch -a
```

### Cambiar entre ramas

```bash
git checkout main
git checkout feature_a
git checkout feature_b
```

---

## 📤 Hacer Cambios y Push

### Flujo básico de trabajo

```bash
# 1. Ver el estado actual
git status

# 2. Agregar archivos al staging
git add .                    # Agregar todos los archivos
git add README.md            # Agregar archivo específico
git add *.js                 # Agregar por patrón

# 3. Hacer commit
git commit -m "Descripción del cambio"

# 4. Subir cambios
git push origin main         # Push a main
git push origin feature_a    # Push a feature_a
git push origin feature_b    # Push a feature_b
```

### Ejemplo completo para probar notificaciones

```bash
# En rama main
git checkout main
echo "Prueba de notificación $(date)" >> test.txt
git add test.txt
git commit -m "Test: Notificación en rama main"
git push origin main

# En rama feature_a
git checkout feature_a
echo "Prueba de notificación $(date)" >> test.txt
git add test.txt
git commit -m "Test: Notificación en rama feature_a"
git push origin feature_a

# En rama feature_b
git checkout feature_b
echo "Prueba de notificación $(date)" >> test.txt
git add test.txt
git commit -m "Test: Notificación en rama feature_b"
git push origin feature_b
```

---

## 🔄 Sincronizar con el Repositorio Remoto

### Actualizar tu repositorio local

```bash
# Descargar cambios sin fusionar
git fetch origin

# Descargar y fusionar cambios
git pull origin main
git pull origin feature_a
git pull origin feature_b
```

### Ver diferencias

```bash
# Ver cambios no staged
git diff

# Ver cambios staged
git diff --staged

# Ver diferencias entre ramas
git diff main feature_a
```

---

## 📜 Ver Historial

### Ver commits

```bash
# Historial completo
git log

# Historial resumido
git log --oneline

# Últimos 5 commits
git log -5

# Historial con gráfico
git log --graph --oneline --all

# Ver commits de una rama específica
git log feature_a
```

### Ver información de un commit específico

```bash
git show <commit-hash>
git show HEAD           # Último commit
git show HEAD~1         # Penúltimo commit
```

---

## 🔧 Configuración Inicial

### Configurar identidad

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "catinovit@gmail.com"
```

### Ver configuración

```bash
git config --list
git config user.name
git config user.email
```

### Configurar editor

```bash
git config --global core.editor "code --wait"  # VS Code
git config --global core.editor "nano"         # Nano
```

---

## 🆘 Solución de Problemas

### Deshacer cambios no commiteados

```bash
# Descartar cambios en un archivo
git checkout -- archivo.txt

# Descartar todos los cambios
git checkout -- .

# Quitar archivos del staging
git reset HEAD archivo.txt
git reset HEAD .
```

### Deshacer el último commit (mantener cambios)

```bash
git reset --soft HEAD~1
```

### Deshacer el último commit (descartar cambios)

```bash
git reset --hard HEAD~1
```

### Resolver conflictos

```bash
# 1. Ver archivos con conflictos
git status

# 2. Editar archivos y resolver conflictos manualmente

# 3. Marcar como resueltos
git add archivo-resuelto.txt

# 4. Completar el merge
git commit -m "Resueltos conflictos"
```

---

## 🔐 Autenticación

### Usar token de acceso personal

```bash
# Clonar con token
git clone https://<TOKEN>@github.com/vittoriocatino/Practica2-3.git

# Configurar credenciales
git config --global credential.helper store
```

### Verificar conexión con GitHub

```bash
ssh -T git@github.com
```

---

## 📊 Comandos Útiles para el Video

### Mostrar información del repositorio

```bash
# Ver remotes
git remote -v

# Ver rama actual
git branch --show-current

# Ver último commit
git log -1 --pretty=format:"%h - %an, %ar : %s"

# Ver estadísticas
git log --stat -1
```

### Crear commits descriptivos para el video

```bash
git commit -m "feat: Agregar workflow de notificación por correo"
git commit -m "docs: Actualizar README con información de Jenkins"
git commit -m "test: Probar notificaciones en rama feature_a"
```

---

## 🎯 Checklist de Comandos para la Práctica

- [ ] Configurar identidad de Git
- [ ] Clonar el repositorio
- [ ] Crear rama feature_a
- [ ] Crear rama feature_b
- [ ] Hacer al menos 3 commits en main
- [ ] Hacer al menos 1 commit en feature_a
- [ ] Hacer al menos 1 commit en feature_b
- [ ] Verificar que las acciones se ejecuten
- [ ] Verificar recepción de correos

---

## 💡 Tips

1. **Commits frecuentes**: Haz commits pequeños y frecuentes
2. **Mensajes descriptivos**: Usa mensajes claros que expliquen qué cambió
3. **Pull antes de push**: Siempre haz pull antes de push para evitar conflictos
4. **Verifica antes de commit**: Usa `git status` y `git diff` antes de hacer commit
5. **Ramas limpias**: Mantén cada rama enfocada en su propósito

---

## 📚 Referencias

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com/)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)

---

**Nota**: Estos comandos están diseñados específicamente para la Práctica 2-3. Ajusta según sea necesario.
