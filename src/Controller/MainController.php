<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MainController extends Controller
{
    /** @Route("/template", name="template")*/
    public function template( )
    {
        return $this->render('base.html.twig');
    }

    /** @Route("/", name="home")*/
    public function inicial( )
    {
        return $this->render('view/home.html.twig');
    }

    /** @Route("/login", name="login")*/
    public function login( )
    {
        return $this->render('view/login.html.twig');
    }

    /** @Route("/mapa", name="mapa")*/
    public function mapa( )
    {
        return $this->render('view/mapa.html.twig');
    }

}