# 🧪 Guia de Teste da Conexão MySQL

## ✅ Como Verificar a Conexão

### 1️⃣ **Teste Automático** (RECOMENDADO)

```bash
cd API-NODE
node teste-conexao.js
```

Este script verifica:
- ✅ Conexão ao MySQL
- ✅ Versão do MySQL
- ✅ Existência da base de dados
- ✅ Estrutura de todas as tabelas
- ✅ Pool de conexões

---

### 2️⃣ **Popular com Dados de Teste**

```bash
cd API-NODE
node popular-dados-teste.js
```

Cria automaticamente:
- 5 usuários (estudantes, empresas, admin)
- 2 empresas
- 2 estudantes
- 3 vagas
- 4 candidaturas

---

## 🧪 Testar os Endpoints da API

### Pré-requisito: Iniciar o servidor Node.js

```bash
cd API-NODE
npm start
```

Deve ver:
```
✅ Ligado ao MySQL com sucesso!
🚀 Servidor Node.js iniciado!
📍 http://localhost:3000
```

---

### 🔐 **1. TESTAR LOGIN**

#### Via cURL:
```bash
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"joao@exemplo.com","senha":"senha123"}'
```

#### Via JavaScript/Fetch:
```javascript
fetch('http://localhost:3000/api/auth/login', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
        email: 'joao@exemplo.com',
        senha: 'senha123'
    })
})
.then(res => res.json())
.then(data => console.log('Sucesso:', data))
.catch(err => console.error('Erro:', err));
```

#### Resposta Esperada:
```json
{
  "mensagem": "Login realizado com sucesso",
  "usuario": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@exemplo.com",
    "tipo": "estudante"
  }
}
```

---

### 💼 **2. TESTAR LISTAGEM DE VAGAS**

#### Via cURL:
```bash
curl http://localhost:3000/api/vagas
```

#### Via JavaScript/Fetch:
```javascript
fetch('http://localhost:3000/api/vagas')
    .then(res => res.json())
    .then(data => console.log('Vagas:', data))
    .catch(err => console.error('Erro:', err));
```

#### Resposta Esperada:
```json
{
  "total": 3,
  "vagas": [
    {
      "id_vaga": 1,
      "titulo": "Desenvolvedor Junior",
      "descricao": "Procuramos desenvolvedor junior...",
      "localidade": "Lisboa",
      "tipo_contrato": "Estágio",
      "salario": "800.00",
      "nome_empresa": "TechCorp"
    },
    ...
  ]
}
```

---

### 📊 **3. TESTAR OBTER VAGA ESPECÍFICA**

#### Via cURL:
```bash
curl http://localhost:3000/api/vagas/1
```

#### Resposta:
```json
{
  "id_vaga": 1,
  "titulo": "Desenvolvedor Junior",
  "descricao": "Procuramos desenvolvedor junior com conhecimentos em JavaScript e Node.js",
  "localidade": "Lisboa",
  "tipo_contrato": "Estágio",
  "salario": "800.00",
  "competencias_requeridas": "JavaScript, Node.js, MySQL",
  "data_publicacao": "2026-05-29",
  "data_deadline": null,
  "status_vaga": "ativa",
  "id_empresa": 1,
  "nome_empresa": "TechCorp",
  "email_empresa": "admin@techcorp.com",
  "telefone_empresa": "222333444"
}
```

---

### 👥 **4. TESTAR LISTAGEM DE CANDIDATURAS**

#### Via cURL:
```bash
curl http://localhost:3000/api/candidaturas
```

---

### 🏢 **5. TESTAR LISTAGEM DE EMPRESAS**

#### Via cURL:
```bash
curl http://localhost:3000/api/empresas
```

---

## 📋 Credenciais de Teste

| Tipo | Email | Senha | Tipo de Conta |
|------|-------|-------|---------------|
| Estudante | joao@exemplo.com | senha123 | estudante |
| Estudante | maria@exemplo.com | senha123 | estudante |
| Empresa | admin@techcorp.com | senha123 | empresa |
| Empresa | admin@innovatelabs.com | senha123 | empresa |
| Admin | admin@portal.com | admin123 | admin |

---

## 🔍 **Como Verificar no MySQL Workbench**

1. Abra MySQL Workbench
2. Navegue para a base de dados **PortalDeVagas**
3. Expanda **Tables**
4. Verifique cada tabela:
   - Click direito em **usuarios** → Select Rows
   - Deve ver os 5 usuários criados
   - Faça o mesmo para outras tabelas

---

## ⚙️ Verificar Variáveis de Ambiente

Ficheiro: `API-NODE/.env`

```env
DB_SERVER=localhost
DB_PORT=3306
DB_DATABASE=PortalDeVagas
DB_USERNAME=root
DB_PASSWORD=
PORT=3000
NODE_ENV=development
```

---

## 🐛 Troubleshooting

### Erro: "Cannot connect to MySQL"
```
Solução:
1. Verifique se MySQL está rodando (XAMPP Control Panel)
2. Verifique porta 3306 está livre
3. Verifique credenciais em .env
```

### Erro: "Database not found"
```
Solução:
Execute na pasta raiz:
mysql -u root < mysql_schema.sql
```

### Erro: "Table not found"
```
Solução:
Execute novamente:
mysql -u root < mysql_schema.sql
```

---

## ✅ Checklist Final

- [ ] Node.js instalado
- [ ] npm instalado
- [ ] MySQL rodando
- [ ] Base de dados `PortalDeVagas` criada
- [ ] Dependências instaladas (`npm install`)
- [ ] Teste de conexão passou (`node teste-conexao.js`)
- [ ] Dados de teste criados (`node popular-dados-teste.js`)
- [ ] Servidor Node.js rodando (`npm start`)
- [ ] API respondendo (`http://localhost:3000`)
- [ ] Login testado com sucesso

---

## 🎉 Status Atual

✅ **Projeto 100% Funcional**
- Node.js Backend ativo
- MySQL conectado
- Dados de teste prontos
- API pronta para uso
