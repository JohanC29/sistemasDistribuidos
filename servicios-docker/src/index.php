<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php
            $varEntorno = getenv('VAR_ENTORNO');
            $varProyecto = getenv('VAR_PROYECTO');
            echo $varEntorno;
            ?></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: <?php echo $varEntorno === 'FRONTEND' ? '#3498db' : ($varEntorno === 'BACKEND' ? '#27ae60' : '#ccc'); ?>;
            color: <?php echo $varEntorno === 'FRONTEND' ? '#fff' : ($varEntorno === 'BACKEND' ? '#fff' : '#000'); ?>;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: <?php echo $varEntorno === 'FRONTEND' ? '#3498db' : ($varEntorno === 'BACKEND' ? '#27ae60' : '#ccc'); ?>;
            text-align: center;
            padding: 20px;
        }

        h1 {
            font-size: 36px;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        /* Ajustar el color del texto en función del fondo */
        p {
            color: <?php echo $varEntorno === 'FRONTEND' || $varEntorno === 'BACKEND' ? '#000' : '#666'; ?>;
        }
    </style>
</head>

<body>
    <header>
        <h1><?php
            $varEntorno = getenv('VAR_ENTORNO');
            echo "Este es el proyecto de " . $varProyecto;
            ?></h1>
    </header>
    <div class="container">
        <p> <?php
            $varEntorno = getenv('VAR_ENTORNO');
            echo "¡Bienvenido al proyecto de " . $varProyecto . "!";
            ?></p>
    </div>
</body>

</html>