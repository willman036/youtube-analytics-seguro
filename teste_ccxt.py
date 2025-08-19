import ccxt

# Conecta na Binance, mas usando o domínio alternativo
exchange = ccxt.binance({
    'urls': {
        'api': {
            'public': 'https://api.binance.us/api/v3',  # tenta o domínio da Binance US
        }
    }
})

print("Versão do CCXT instalada:", ccxt.__version__)
ticker = exchange.fetch_ticker('BTC/USDT')
print(ticker)
