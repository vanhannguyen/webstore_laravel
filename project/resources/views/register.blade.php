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
        
        <div class="container">

            <div class="col-md-4 col-md-offset-4">
            
            <div class="panel panel-success">
                  <div class="panel-heading">
                        <h3 class="panel-title"></h3>
                  </div>
                  <div class="panel-body">
                  <form action="{{route('checkRegister')}}" method="POST" role="form">
                @csrf
                <legend>Form register</legend>
                <div class="form-group">
                    <label for="">Name</label>
                    <input type="text" class="form-control" name="name" placeholder="Input name">
                    @error('name')  <small>{{  $message  }}</small> @enderror
                </div>
                <div class="form-group">
                    <label for="">Email</label>
                    <input type="text" class="form-control" name="email" placeholder="Input email">
                    @error('email')  <small>{{  $message  }}</small> @enderror
                </div>
                <div class="form-group">
                    <label for="">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Input password">
                    @error('password')  <small>{{  $message  }}</small> @enderror
                </div>
                <div class="form-group">
                    <label for="">Confirm Password</label>
                    <input type="password" class="form-control" name="confirm_password" placeholder="Input password">
                    @error('confirm_password')  <small>{{  $message  }}</small> @enderror
                </div>
                
            
                <button type="submit" class="btn btn-sm btn-primary">Register now</button>
                <a href="{{  route('login')  }}">Đăng nhập</a>
            </form>
                  </div>
            </div>
            
            </div>
            
                        
        </div>
        

       
    </body>
</html>