
<!DOCTYPE html>
<html lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Title Page</title>

        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.3/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

       <nav class="navbar navbar-inverse">
            <div class="container">
            <a class="navbar-brand" href="#">Title</a>
        <ul class="nav navbar-nav">
            <li class="active">
                <a href="{{ route('admin.index') }}">Home</a>
            </li>
            <li>
                <a href="{{ route('admin.createCategory') }}">category</a>
            </li>
            <li>
                <a href="{{ route('admin.createProduct') }}">product</a>
            </li>
        </ul>
            </div>

       </nav>


       <div class="container">
            @yield ('main')
       </div>


    </body>
</html>
