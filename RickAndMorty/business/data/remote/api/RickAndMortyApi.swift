//
//  RickAndMortyApi.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import Alamofire

class RickAndMortyApi: ApiRestManager {
    static let BASE_URL = "https://rickandmortyapi.com/api/"
    
    /// Obtiene listas de personajes de historietas con filtros opcionales
    ///  - Parameter page: Int: numero de página
    ///  - Parameter name: String?: su utiliza para filtrar los resultados por nombre
    ///  - Parameter status: StatusEnum?: su utiliza para filtrar los resultados por status
    ///  - Parameter species: String?: su utiliza para filtrar los resultados por  especies
    ///  - Parameter type: String?: su utiliza para filtrar los resultados por type
    ///  - Parameter gender: String?: su utiliza para filtrar los resultados por gender
    ///  - Returns: `DataRequest` o nil
    func getCharacters(page: Int,
                       name: String?,
                       status: StatusEnum?,
                       species: String?,
                       type: String?,
                       gender: GenderEnum?) -> DataRequest? {
        
        var serviceURL: String = "character"
        serviceURL = serviceURL + "?page=\(page)"
        
        let parameterDict: [String: String] = [
            "name" : name ?? "",
            "status" : status?.rawValue ?? "",
            "species" : species ?? "",
            "type" : type ?? "",
            "gender" : gender?.rawValue ?? ""
        ]
        
        for (key, value) in parameterDict {
            if value != "" {
                serviceURL.append("&"+key+"="+value)
            }
        }
        
        return self.get(service: serviceURL)
    }
    

    /// Obtiene listas de personajes de historietas con filtros opcionales
    ///  - Parameter id: Int: numero identificador del personaje
    ///  - Returns: `DataRequest` o nil
    func getCharacter(id: Int) -> DataRequest? {
        
        var serviceURL: String = "character"
        serviceURL = serviceURL + "/\(id)"
        
        return self.get(service: serviceURL)
    }
}


