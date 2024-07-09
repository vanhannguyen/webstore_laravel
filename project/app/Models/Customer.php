<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Auth\Authenticatable as AuthenticatableTrait;

class Customer extends Model implements Authenticatable
{
    use HasFactory, AuthenticatableTrait;
    protected $table = 'customer';
    protected $fillable = ['name','email','password'];   
    public $timestamps = false;
 
}
