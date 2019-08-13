import Foundation

struct WordModel: Codable {
    var word: String
    var type: String
    var translation: String = ""
    var examples: [String]?
    var createdDate: Date
    
    enum CodingKeys: String, CodingKey {
        case word
        case type
        case translation
        case examples
        case createdDate
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(word, forKey: .word)
        try container.encode(type, forKey: .type)
        try container.encode(translation, forKey: .translation)
        try container.encode(examples, forKey: .examples)
        try container.encode(createdDate, forKey: .createdDate)
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        word = try values.decode(String.self, forKey: .word)
        type = try values.decode(String.self, forKey: .type)
        translation = try values.decode(String.self, forKey: .translation)
        examples = try values.decode([String].self, forKey: .examples)
        createdDate = try values.decode(Date.self, forKey: .createdDate)
    }
    
    init(word: String, type: String, translation: String, examples: [String]?, createdDate: Date) {
        self.word = word
        self.type = type
        self.translation = translation
        self.examples = examples
        self.createdDate = createdDate
    }
}
