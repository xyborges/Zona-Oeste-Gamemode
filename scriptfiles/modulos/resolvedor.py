# Função para substituir texto em um arquivo

def substituir_texto_em_arquivo(nome_arquivo, texto_antigo, texto_novo):
    try:
        # Abre o arquivo para leitura
        with open(nome_arquivo, 'r') as arquivo:
            conteudo = arquivo.read()

        if texto_antigo in conteudo:
            conteudo_modificado = conteudo.replace(texto_antigo, texto_novo)

            with open(nome_arquivo, 'w') as arquivo:
                arquivo.write(conteudo_modificado)

            print(f'Texto antigo "{texto_antigo}" substituído por "{texto_novo}" no arquivo "{nome_arquivo}".')

            return 1
        else:
            return 0
    except FileNotFoundError:
        print(f'Arquivo "{nome_arquivo}" não encontrado.')
    except Exception as e:
        print(f'Ocorreu um erro: {str(e)}')

# Exemplo de uso
nome_do_arquivo = 'meresolva.txt'

y = 0
for x in range(0, 67):
    if substituir_texto_em_arquivo(nome_do_arquivo, f'[{x}]', f'[{y}]') == 1:
      y = y + 1