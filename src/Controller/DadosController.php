<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DadosController extends Controller
{

    /** @Route("/entrega", name="entrega")*/
    public function entrega( )
    {

        $entrega = array();
        $debug = array();

        $file = fopen("../Dados/dados.csv", 'r' );

        $cabecalho = $data = fgetcsv($file, 100000, ",");
        while ( ($data = fgetcsv($file, 100000, ",")) !== FALSE){
            
            //Se tem data de envio é válido
            if( $data[1] != "" ){

                //ID
                $entrega[$data[0]]["ID"] = $data[0];

                //Tipo de Entrega
                switch ($data[6]) {
                    case 'A) Produto':
                        $entrega[$data[0]]["TipoEntrega"] = 1;
                        break;

                    case 'B) Serviço':
                        if ($data[163] != "Sim"){
                            $entrega[$data[0]]["TipoEntrega"] = 2;
                        }
                        else{
                            $entrega[$data[0]]["TipoEntrega"] = 3;
                        }
                        break;

                    case 'C) Aperfeiçoamento':
                        $entrega[$data[0]]["TipoEntrega"] = 4;
                        break;

                    default:
                        $debug[$data[0]]["TipoEntrega"] = "Problema!";
                        break;
                }

                //Nome
                $entrega[$data[0]]["Nome"] = $data[18] . $data[152] . $data[166];


                //Serviços e Aperfeiçoamentos tem um campo de texto de descrição
                if ($entrega[$data[0]]["TipoEntrega"] != "A) Produto"){
                    $entrega[$data[0]]["Descricao"] = "$data[153]" . "$data[167]";
                    
                    if ($data[165] != ""){
                        $entrega[$data[0]]["Descricao"] .= ". Sera gerado impacto nos seguintes produtos e servicos: $data[165]";
                    }
                }

                //Produtos, tem que escrever a descrição de forma procedural
                else {
                    switch ($data[7]){

                        case "Curso":
                            if ( $data[10] == "Outros"){
                                $entrega[$data[0]]["Descricao"] = "$data[7] na modalidade $data[9] com o formato de '$data[11]'";
                            }
                            else{
                                $entrega[$data[0]]["Descricao"] = "$data[7] na modalidade $data[9] com o formato de $data[10]";
                            }
                        break;

                        case "Evento":
                            if ( $data[12] == "Outros"){
                                $entrega[$data[0]]["Descricao"] = "$data[7] do tipo '$data[13]'";
                            }
                            else{
                                $entrega[$data[0]]["Descricao"] = "$data[7] do tipo $data[12]";
                            }
                        break;

                        case "Oficina":
                            $entrega[$data[0]]["Descricao"] = $data[7];
                        break;

                        case "Conteúdo":
                            if ( $data[14] == "Outros"){
                                $entrega[$data[0]]["Descricao"] = "$data[7] no formato '$data[15]'";
                            }
                            else {
                                $entrega[$data[0]]["Descricao"] = "$data[7] no formato $data[14]";
                            }
                        break;

                        case "Bolsa":
                            if ( $data[16] == "Outros"){
                                $entrega[$data[0]]["Descricao"] = "$data[7] do tipo '$data[17]'";
                            }
                            else {
                                $entrega[$data[0]]["Descricao"] = "$data[7] do tipo $data[16]";
                            }
                        break;

                        case "Outros":
                            $entrega[$data[0]]["Descricao"] = $data[8];
                        break;

                        default:
                            $entrega[$data[0]]["Descricao"] = $data[7] . $data[8] . $data[9] . $data[10] . $data[11] . $data[12] . $data[13] . $data[14] . $data[15] . $data[16] . $data[17];
                            dump($data[7]);
                    }
                }

                //Instituicoes
                $entrega[$data[0]]["Instituicoes"] = $data[109] . $data[156] . $data[168];

                //Impacto aperfeicoamento
                $entrega[$data[0]]["ImpactoAperfeicoamento"] = $data[163];

                //Quantidade de entregas ao longo do ano
                switch ($data[116]) {
                    case "Quantificável":
                        $entrega[$data[0]]["Quantidade"] = (int)$data[118];
                        break;

                    case "Outros":
                        if ( is_numeric($data[117])){
                            $entrega[$data[0]]["Quantidade"] = (int) $data[117];
                        }
                        else{
                            $entrega[$data[0]]["Quantidade"] = $data[117];
                        }
                        break;

                    case "":
                        $entrega[$data[0]]["Quantidade"] = 1;
                        break;

                    case "A definir":
                        $entrega[$data[0]]["Quantidade"] = NULL;
                        break;

                    default:
                        $entrega[$data[0]]["Quantidade"] = $data[116] . $data[117] . $data[118];
                }

                //Unidade Lider
                $temp = preg_replace("/^[-> ]*/", "", $data[176]);
                switch ($temp) {
                    case 'Coordenação-Geral de Educação a Distância':
                        $entrega[$data[0]]["unidadeLider"] = 11;
                        break;

                    case 'Coordenação-Geral de Educação Executiva':
                        $entrega[$data[0]]["unidadeLider"] = 12;
                        break;

                    case 'Diretoria de Educação Continuada':
                        $entrega[$data[0]]["unidadeLider"] = 22;
                        break;

                    case 'Coordenação-Geral de Capacitação de Altos Executivos':
                        $entrega[$data[0]]["unidadeLider"] = 9;
                        break;

                    case 'Coordenação-Geral de Especialização':
                        $entrega[$data[0]]["unidadeLider"] = 13;
                        break;

                    case 'Coordenação-Geral de Formação':
                        $entrega[$data[0]]["unidadeLider"] = 14;
                        break;

                    case 'Diretoria de Formação Profissional e Especialização':
                        $entrega[$data[0]]["unidadeLider"] = 23;
                        break;

                    case 'Coordenação-Geral de Gestão de Pessoas e Adm':
                        $entrega[$data[0]]["unidadeLider"] = 15;
                        break;

                    case 'Coordenação-Geral de Orçamento, Finanças e Contabilidade':
                        $entrega[$data[0]]["unidadeLider"] = 18;
                        break;

                    case 'Coordenação-Geral de Tecnologia da Informação':
                        $entrega[$data[0]]["unidadeLider"] = 21;
                        break;

                    case 'Diretoria de Gestão Interna':
                        $entrega[$data[0]]["unidadeLider"] = 24;
                        break;

                    case 'Coordenação-Geral de Articulação Institucional':
                        $entrega[$data[0]]["unidadeLider"] = 8;
                        break;

                    case 'Coordenação-Geral de Gestão do Conhecimento':
                        $entrega[$data[0]]["unidadeLider"] = 16;
                        break;

                    case 'Coordenação-Geral de Inovação':
                        $entrega[$data[0]]["unidadeLider"] = 17;
                        break;

                    case 'Diretoria de Inovação e Gestão do Conhecimento':
                        $entrega[$data[0]]["unidadeLider"] = 25;
                        break;

                    case 'Coordenação-Geral de Ciência de Dados':
                        $entrega[$data[0]]["unidadeLider"] = 10;
                        break;

                    case 'Coordenação-Geral de Pesquisa':
                        $entrega[$data[0]]["unidadeLider"] = 19;
                        break;

                    case 'Coordenação-Geral de Pós Graduação Stricto Sensu':
                        $entrega[$data[0]]["unidadeLider"] = 20;
                        break;

                    case 'Diretoria de Pesquisa e Pós':
                        $entrega[$data[0]]["unidadeLider"] = 26;
                        break;

                    case 'Assessoria de Comunicação':
                        $entrega[$data[0]]["unidadeLider"] = 1;
                        break;

                    case 'Assessoria Internacional':
                        $entrega[$data[0]]["unidadeLider"] = 2;
                        break;

                    case 'Auditoria Interna':
                        $entrega[$data[0]]["unidadeLider"] = 3;
                        break;

                    case 'Comissão De Ética':
                        $entrega[$data[0]]["unidadeLider"] = 4;
                        break;

                    case 'Comissão Gestora do Plano de Gestão de Logística Sustentável':
                        $entrega[$data[0]]["unidadeLider"] = 5;
                        break;

                    case 'Comitê de Gênero':
                        $entrega[$data[0]]["unidadeLider"] = 6;
                        break;

                    case 'Comitê de Inclusão':
                        $entrega[$data[0]]["unidadeLider"] = 7;
                        break;

                    case 'Gabinete':
                        $entrega[$data[0]]["unidadeLider"] = 27;
                        break;

                    case 'Procuradoria Federal':
                        $entrega[$data[0]]["unidadeLider"] = 28;
                        break;
                    
                    default:
                        $debug[$data[0]]["unidadeLider"] = "Problema";
                        break;
                }

                //Observacoes
                $entrega[$data[0]]["Observacoes"] = $data[205];
            }
        }

        fclose($file);
        
        dump($debug);


        return $this->render('view/dados.html.twig',
            [
                "entrega" => $entrega,
            ]
        );
    }

    /** @Route("/dados/temas", name="temas")*/
    public function temas( )
    {

        $debug = array();

        $file = fopen("../Dados/dados.csv", 'r' );

        $cabecalho = $data = fgetcsv($file, 100000, ",");
        while ( ($data = fgetcsv($file, 100000, ",")) !== FALSE){
            
            if ($data[108] != '' ) {
                $debug[] = $data[108];
            }

        }
        fclose($file);
        
        return $this->render('view/temas.html.twig',
            [
                "debug" => $debug,
            ]
        );
    }


}