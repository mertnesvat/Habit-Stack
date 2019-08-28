import Foundation

enum WordType: Int, Codable {
    case unknown = -1
    case feminineNoun = 0
    case masculineNoun = 1
    case adjective = 2
    case verb = 3
    case pronoun = 4
}

struct WordModel: Codable {
    var word: String
    var type: WordType?
    var translation: String = ""
//    var examples: [String]
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
//        try container.encode(examples, forKey: .examples)
        try container.encode(createdDate, forKey: .createdDate)
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        word = try values.decode(String.self, forKey: CodingKeys.word)
        type = try values.decode(WordType?.self, forKey: CodingKeys.type)
        translation = try values.decode(String.self, forKey: CodingKeys.translation)
//        examples = try values.decode([String].self, forKey: CodingKeys.examples)
        createdDate = try values.decode(Date.self, forKey: CodingKeys.createdDate)
    }
    
    init(word: String, type: WordType?, translation: String, createdDate: Date) {
        self.word = word
        self.type = type
        self.translation = translation
//        self.examples = examples
        self.createdDate = createdDate
    }
}
