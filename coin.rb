require "nokogiri"
require "open-uri"

puts "
-> dogecoin
-> bitcoin
-> litecoin
-> ethereum
-> ethereum-classic
-> uniswap

Qual moeda você quer converter para real($BRL)?
"
nomeCoin = gets.chomp.to_s
puts "Quantos Reais eu tenho?"
valorBRL = gets.to_f 

def coin(n,v)
    puts %x(clear)
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/#{n}/"))
    table = doc.css("div.priceValue").css('span').to_s
    coins = table[7..12]
    valorReal = v
    docs = Nokogiri::HTML(open("https://br.investing.com/currencies/usd-brl"))
    real = docs.css("span.text-2xl").to_s
    recebeValor = real[57..61]
    converteValor = "#{recebeValor[0..0]}.#{recebeValor[2..4]}"
    valorDolar = valorReal / converteValor.to_f
    calc= valorDolar / coins.to_f 
    puts %x(clear)
    puts calc.ceil(8)
end

coin(nomeCoin,valorBRL)