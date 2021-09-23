using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//---------------------------------------------------------------------------------------------------------------------
// Autor: Jose Antonio Reyes A.           Descripción: Código para modificar cadenas
// Fecha: 23/ Septiembre / 2021           Hora: 00:08 hrs
//---------------------------------------------------------------------------------------------------------------------
namespace Interfaces.Logica
{
    public class DividirCadenas
    {
        //--------Método que permite dividir cadenas y agregarle saltos de linea------------
        public string Dividir (string cadena)
        {
            string nuevacad = ""; // Creamos nueva variable que guardara la cadena que se creará
            string c = cadena;
            char delimitador = ' '; //Para dividir la cadena es necesario un delimitador, en este caso espacio en blanco
            string[] palabras = c.Split(delimitador); // Llamamos al método split y le mandamos como parámetro el delimitador
            for (int i = 0; i < palabras.Length; i++)//Ciclo que recorrerá el arreglo 
            {
                nuevacad += palabras[i] + " ";//Por cada vuelta del for se concatenará cada palabra
                if (i == 2)// Cuando el for llegue a 2 se agregará un salto de línea
                {
                    nuevacad += "\n";
                    continue;// Se continuará el arreglo para no terminarlo si la cadena es menor
                }
                else if (i > 5)//En caso de que supere los 5 elementos
                {
                    //Agregar otro salto de línea y terminar la unión de la cadena
                    nuevacad += "\n" + string.Join(" ", palabras.Skip(7));
                    break;
                    //El método Join permite unir la cadena, usando el método Skip y mandando
                    //como parámetro el número o índice del elemento donde se quiere continuar la unión
                }
            }
            return nuevacad;//Retornar la cadena modificada
        }
    }
}
