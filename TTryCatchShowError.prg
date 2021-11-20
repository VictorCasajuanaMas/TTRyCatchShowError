/* CLASS: TTryCatchShowError

        Clase para visualizar el error del objeto generado por un TryCatch

*/
#Include 'hbclass.ch'
#include 'hbcompat.ch'

CREATE CLASS TTryCatchShowerror

    PROTECTED:
        DATA oError AS OBJECT INIT Nil
        
        METHOD Set()
                
    EXPORTED:
        METHOD New( ... ) CONSTRUCTOR
        METHOD Show( cString )
        METHOD ToString()

ENDCLASS

METHOD New( ... ) CLASS TTryCatchShowerror

    ::Set( ... )

Return ( Self )

METHOD Set( oError ) CLASS TTryCatchShowerror

    ::oError := oError

Return ( Nil )

// Group: EXPORTED METHODS

/* METHDO: Show( cString )
    Muestra el error en pantalla a�adiendo el string cString al principio.

    Par�metros:
        cString - Cadena que se a�adir� como primer l�nea
*/
METHOD Show( cString ) CLASS TTryCatchShowerror

    ? cString + ::ToString()

Return ( Nil )

// Group: PROTECTED METHODS

/* METHDO: TosTring( )
    Devuelve una cadena con la informaci�n del objeto Error generado por un trycatch

    Devuelve:
        string
*/

METHOD ToString() CLASS TTryCatchShowerror

    Local cError := ''
    Local oError := Nil

    cError += ::oError:Description + hb_eol()

    try 
        
        
        If ::oError:Args:NotEmpty()
            
            cError += 'Argumentos:' + ::oError:Args:Str() + hb_eol()
            
        Endif
        
        If ::oError:filename:NotEmpty()
            
            cError += 'Fichero:' + ::oError:Filename:Str() +hb_eol()
            
        Endif
        
        If ::oError:Operation:NotEmpty()
            
            cError += 'Operaci�n: '+ ::oError:Operation:Str() + hb_eol()
            
        Endif
        
    catch oError

        cError += 'Hubo un problema revisando los argumentos del error'
            
    end
Return ( cError )