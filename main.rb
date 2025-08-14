require 'httparty'

API_KEY = 'API-KEY'

def converter_moeda(de, para, valor)
  url = "https://v6.exchangerate-api.com/v6/#{API_KEY}/pair/#{de}/#{para}/#{valor}"
  resposta = HTTParty.get(url)

  if resposta.code == 200 && resposta['result'] == 'success'
    convertido = resposta['conversion_result']
    taxa = resposta['conversion_rate']
    puts "#{valor} #{de} = #{'%.2f' % convertido} #{para} (Taxa: #{'%.4f' % taxa})"
  else
    puts "Erro na conversão: #{resposta['error-type'] || 'Erro desconhecido'}"
  end
end

puts "Converter de qual moeda?"
de = gets.chomp
puts "Para qual?"
para = gets.chomp
puts "Qual valor?"
quantia = gets.chomp.to_i

converter_moeda(de, para, quantia)

