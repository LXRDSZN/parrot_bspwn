
#!/usr/bin/env bash

# Verifica que la variable DEEPSEEK_API_KEY esté definida
if [ -z "$DEEPSEEK_API_KEY" ]; then
    echo "❌ ERROR: No se encontró la API Key de DeepSeek."
    echo "➡️  Agrega tu API Key en ~/.bashrc o ~/.zshrc:"
    echo 'export DEEPSEEK_API_KEY="sk-2f2bc6b096644288aee75dadcebc9552"'
    exit 1
fi

# Pedir la pregunta al usuario
echo -n "┌─[¿En qué te puedo ayudar hoy?]─[~]
└──╼ $ "
read PROMPT

# Verifica que el usuario ingresó algo
if [ -z "$PROMPT" ]; then
    echo "⚠️ No ingresaste ninguna pregunta."
    exit 1
fi

# Realiza la solicitud a la API de DeepSeek
RESPONSE=$(curl -s "https://api.deepseek.com/chat/completions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $DEEPSEEK_API_KEY" \
  -d "{
        \"model\": \"deepseek-chat\",
        \"messages\": [
          {\"role\": \"system\", \"content\": \"Eres un asistente útil.\"},
          {\"role\": \"user\", \"content\": \"$PROMPT\"}
        ],
        \"stream\": false
      }")

# Extraer solo la respuesta del modelo
MESSAGE=$(echo "$RESPONSE" | jq -r '.choices[0].message.content')

# Mostrar la respuesta en la terminal
if [ -n "$MESSAGE" ] && [ "$MESSAGE" != "null" ]; then
    echo -e "\n🧠 DeepSeek responde:\n"
    echo "$MESSAGE" | fold -s
else
    echo "❌ Error al obtener respuesta de DeepSeek."
fi

