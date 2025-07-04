<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reinicio de Contraseña</title>
</head>
<body>
    <h1>Hola {{ $data['nombres'] }} 👋</h1>
    <p>Se te ha generado una nueva contraseña</p>
    <p>Nueva clave: {{ $data['password'] }}</p>
    <small>Te recomendamos que cambies tu contraseña a una personal.</small>
</body>
</html>