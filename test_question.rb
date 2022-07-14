def check_valid_braces (str)
    text = ''
    text_index = nil
   str.split('').each.with_index do |s, index|
       text += s
       if s == '{' and str[index - 1] == '{'
            text_index = index
       elsif s == '}' and str[index - 1] == '}'
                if !text_index.nil? and index > text_index and text.count('{') == text.count('}')
                    text = ''
                else
                    return false
                end
        end
    end
    unless text.empty?
        return not(text.include?('{') or text.include?('}'))
    end
    true
end

valid = ['{{}}', '{{a}}', 'a{{}}', '{{}}a', '{{}}{{}}{{}}', '{{a}}{{}}{{}}', '{{a}}{{b}}{{}}', '{{a}}{{b}}{{c}}', '0{{a}}d{{b}}e{{c}}f']
invalid = ['{', '{{', '{{{', '}', '}}', '}}}', '{}', '{{{}}}', '{{{{}}}}', '}}{{', '{{}}}', '{{{}}', '{{}', '{}}', '{a{}}']

valid.each {|v| puts check_valid_braces(v)}
puts '****'
invalid.each {|v| puts check_valid_braces(v)}
