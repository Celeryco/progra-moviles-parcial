var matriz:[[Int]] = [[0,0,0,0,0,0,0,0,0],
                      [0,0,2,2,0,0,0,0,0],
                      [0,2,1,1,2,0,0,0,0],
                      [0,2,1,1,2,0,0,0,0],
                      [0,0,2,2,0,0,0,0,0],
                      [0,0,0,0,0,0,0,0,0],
                      [0,0,0,0,0,2,0,0,0],
                      [0,0,0,0,2,1,2,0,0],
                      [0,0,0,0,0,2,0,0,0]]

var arreglito : [[Int:Int]] = []



//llamo la funcion pro primera vez es 0,0
func agrupas(x:Int,y:Int,color:Int, arreglo:[[Int:Int]]){
    var arr = arreglo
    if (matriz[x][y] == 1){
        
        arr.append([x : y])
        
        if(x-1 < 0){
            agrupas(x: x - 1, y: y, color: color, arreglo: arr)
        }
        
        agrupas(x: x + 1, y: y, color: color, arreglo: arr)
        
        if(y-1 < 0){
            agrupas(x: x, y: y - 1, color: color, arreglo: arr)
        }
        
        agrupas(x: x, y: y + 1, color: color, arreglo: arr)
        
        
    }else{
        var tupla = next(xx:x, yy:y)
        
        if (tupla.0 < 9 && tupla.1 < 9){
            // print(tupla.0, tupla.1)
            agrupas(x: tupla.0, y: tupla.1, color: color, arreglo: arr)
        }
    }
    print(arr)
}

func next(xx:Int, yy:Int)->(Int,Int){
    var columna:Int = yy
    var fila: Int = xx
    
    if (columna  + 1 < 9){
        return (fila, columna + 1)
    }else{
        // if(fila + 1 < 9){
        fila += 1
        columna = 0
        
        return (fila, columna)
        // }else{
        //     return (fila, columna)
        // }
    }
}

agrupas(x: 0, y:0 , color:2, arreglo:arreglito)






