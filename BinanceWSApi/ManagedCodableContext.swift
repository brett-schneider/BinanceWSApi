//
//  ManagedCodableContext.swift
//  BinanceWSApi
//
//
// https://gist.github.com/sambhav7890/3e8306099c242b31555a8f96e2275549

import Foundation

// todo
protocol DecoderUpdatable {
    mutating func update(from decoder: Decoder) throws
}

public protocol ManagedCodableProtocol: Decodable { }

public extension ManagedCodableProtocol where Self: NSManagedObject {    
    func loadData<Key>(from decoder: Decoder, keyType: Key.Type) throws where Key: CodingKey {
        let container = try decoder.container(keyedBy: Key.self)
        let attributes = self.entity.attributesByName
        let relationships = self.entity.relationshipsByName
        
        for nameKey in container.allKeys {
            guard let subStrName = "\(nameKey)".split(separator: ".").last else { continue }
            let name = String(subStrName)
            // Swift.print("decoding name \(name)")

            // BinanceKline is not an attribute but a relationship
            if let rel = relationships[name] {
                if (rel.destinationEntity?.managedObjectClassName == "BinanceKline") {
                    let value = try BinanceKline(from: container.superDecoder(forKey: nameKey))
                    self.setValue(value, forKey: name)
                    // Swift.print("BinanceKline :: value \(String(describing: value)) :: name \(name)")
                }
            }
            guard let attr = attributes[name] else { continue }
            let attrType = attr.attributeType // NSAttributeType enumeration for the property type
            switch attrType {
            case .integer16AttributeType:
                let value = try container.decodeIfPresent(Int16.self, forKey: nameKey)
                self.setValue(value, forKey: name)
                // Swift.print("integer16AttributeType :: value \(String(describing: value)) :: name \(name)")
            case .integer32AttributeType:
                let value = try container.decodeIfPresent(Int32.self, forKey: nameKey)
                self.setValue(value, forKey: name)
                // Swift.print("integer32AttributeType :: value \(String(describing: value)) :: name \(name)")
            case .integer64AttributeType:
                let value = try container.decodeIfPresent(Int64.self, forKey: nameKey)
                self.setValue(value, forKey: name)
                // Swift.print("key \(name) :: value \(String(describing: value))")
                // Swift.print("integer64AttributeType :: value \(String(describing: value)) :: name \(name)")
            case .decimalAttributeType:
                let value = try container.decodeIfPresent(Decimal.self, forKey: nameKey)
                self.setValue(value, forKey: name)
                // Swift.print("decimalAttributeType :: value \(String(describing: value)) :: name \(name)")
            case .doubleAttributeType:
                // Swift.print("trying to decode doubleAttributeType :: name \(name)")
                do {
                    // let value = try container.decodeIfPresent(Double.self, forKey: nameKey)
                    let value = try container.decodespecial(Double.self, forKey: nameKey)
                    self.setValue(value, forKey: name)
                    // Swift.print("doubleAttributeType :: value \(String(describing: value)) :: name \(name)")
                } catch { Swift.print ("error \(error)") }
            case .floatAttributeType:
                let value = try container.decodeIfPresent(Float.self, forKey: nameKey)
                self.setValue(value, forKey: name)
                // Swift.print("floatAttributeType :: value \(String(describing: value)) :: name \(name)")
            case .stringAttributeType:
                let value = try container.decodeIfPresent(String.self, forKey: nameKey)
                self.setValue(value, forKey: name)
                // Swift.print("stringAttributeType :: value \(String(describing: value)) :: name \(name)")
            case .booleanAttributeType:
                let value = try container.decodeIfPresent(Bool.self, forKey: nameKey)
                self.setValue(value, forKey: name)
                // Swift.print("boolAttributeType :: value \(String(describing: value)) :: name \(name)")
            case .dateAttributeType:
                let value = try container.decodeIfPresent(Date.self, forKey: nameKey)
                self.setValue(value, forKey: name)
                // Swift.print("dateAttributeType :: value \(String(describing: value)) :: name \(name)")
            default:
                print("Undefined NameKey : \(nameKey)")
                break
            }
        }
    }
}
