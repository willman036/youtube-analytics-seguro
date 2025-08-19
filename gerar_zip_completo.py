import zipfile
import os

# Nome da pasta do projeto
project_folder = "youtube-analytics-seguro"

# Criar a pasta se não existir
if not os.path.exists(project_folder):
    os.makedirs(project_folder)

# ---------------- Conteúdo do app_secure.py ----------------
app_secure = """import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
import hashlib
import re
import time
import logging
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import Flow
from googleapiclient.discovery import build
from google.auth.transport.requests import Request

# Configurações
st.set_page_config(page_title="YouTube Analytics Seguro", layout="wide")
st.title("🔒 YouTube Analytics Seguro")

# Logging
logging.basicConfig(level=logging.INFO, filename="app.log", format='%(asctime)s - %(message)s')

# Login Seguro
def hash_pass(password):
    return hashlib.sha256(password.encode()).hexdigest()

USERS = {"william": hash_pass("senha123")}  # substitua por sua senha

if "attempts" not in st.session_state:
    st.session_state["attempts"] = 0
if "authenticated" not in st.session_state:
    st.session_state["authenticated"] = False

if not st.session_state["authenticated"]:
    username = st.text_input("Usuário")
    password_input = st.text_input("Senha", type="password")
    if st.button("Login"):
        st.session_state["attempts"] += 1
        if st.session_state["attempts"] > 5:
            st.error("Muitas tentativas. Tente novamente mais tarde.")
            st.stop()
        if username in USERS and hash_pass(password_input) == USERS[username]:
            st.success("Login bem-sucedido!")
            st.session_state["authenticated"] = True
            logging.info(f"Usuário {username} autenticado com sucesso")
        else:
            st.error("Usuário ou senha incorretos")
            logging.warning(f"Tentativa falha de login: {username}")
            st.stop()

# OAuth YouTube
CLIENT_ID = st.secrets["google"]["client_id"]
CLIENT_SECRET = st.secrets["google"]["client_secret"]
REDIRECT_URI = st.secrets["google"]["redirect_uri"]
SCOPES = ["https://www.googleapis.com/auth/youtube.readonly"]

if "credentials" not in st.session_state:
    flow = Flow.from_client_config(
        {"web":{"client_id":CLIENT_ID,"client_secret":CLIENT_SECRET,
                "redirect_uris":[REDIRECT_URI],
                "auth_uri":"https://accounts.google.com/o/oauth2/auth",
                "token_uri":"https://oauth2.googleapis.com/token"}},
        scopes=SCOPES,
    )
    auth_url, _ = flow.authorization_url(prompt="consent")
    st.warning("Conecte sua conta YouTube")
    st.markdown(f"[👉 Conectar ao Google]({auth_url})")
    st.stop()
else:
    creds = st.session_state["credentials"]
    if creds.expired and creds.refresh_token:
        creds.refresh(Request())
    youtube = build("youtube", "v3", credentials=creds)

# Funções Seguras
def sanitize_text(text):
    return re.sub(r'[^a-zA-Z0-9\\s]', '', text)

def get_youtube_data(youtube):
    channel = youtube.channels().list(part="snippet,statistics", mine=True).execute()
    canal_info = channel["items"][0]
    inscritos = int(canal_info["statistics"]["subscriberCount"])
    videos = youtube.search().list(part="snippet", channelId=canal_info["id"], type="video",
                                   order="date", maxResults=10).execute()
    dados = []
    for item in videos.get("items", []):
        video_id = item["id"]["videoId"]
        stats = youtube.videos().list(part="statistics,snippet", id=video_id).execute()
        s = stats["items"][0]
        snippet = s["snippet"]
        statistics = s["statistics"]
        titulo = sanitize_text(snippet["title"])
        descricao = sanitize_text(snippet["description"])
        sugestao_titulo = "OK" if len(titulo) <= 60 else "Reduzir título para < 60 caracteres"
        sugestao_descricao = "OK" if len(descricao) >= 200 else "Aumentar descrição para >= 200 caracteres"
        dados.append({
            "Título": titulo,
            "Data Publicação": snippet["publishedAt"],
            "Views": int(statistics.get("viewCount",0)),
            "Likes": int(statistics.get("likeCount",0)),
            "Comentários": int(statistics.get("commentCount",0)),
            "Sugestão Título": sugestao_titulo,
            "Sugestão Descrição": sugestao_descricao
        })
    df = pd.DataFrame(dados)
    df["Data Publicação"] = pd.to_datetime(df["Data Publicação"])
    df = df.sort_values("Data Publicação")
    return canal_info, df, inscritos

# Dados e gráficos
canal_info, df, inscritos = get_youtube_data(youtube)
st.subheader("📺 Informações do Canal")
st.write(f"**Canal:** {canal_info['snippet']['title']}")
st.write(f"👥 Inscritos: {inscritos}")
st.subheader("📊 Estatísticas e Sugestões dos Últimos Vídeos")
st.dataframe(df)
st.plotly_chart(px.bar(df, x="Título", y="Views", title="📊 Views por vídeo"))
st.plotly_chart(px.bar(df, x="Título", y="Likes", color="Likes", title="👍 Likes por vídeo"))
st.plotly_chart(px.bar(df, x="Título", y="Comentários", color="Comentários", title="💬 Comentários por vídeo"))

# Download Excel Seguro
if st.session_state["authenticated"]:
    filename = f"youtube_{hashlib.md5(str(time.time()).encode()).hexdigest()}.xlsx"
    df.to_excel(filename, index=False)
    with open(filename, "rb") as f:
        st.download_button("⬇️ Baixar Excel (.xlsx)", f, file_name=filename)
else:
    st.warning("Faça login para baixar o arquivo")
"""

# ---------------- Conteúdo requirements.txt ----------------
requirements = """streamlit
pandas
plotly
google-auth
google-auth-oauthlib
google-api-python-client
openpyxl
"""

# ---------------- Criar ZIP ----------------
zip_filename = "youtube_analytics_completo.zip"

with zipfile.ZipFile(zip_filename, "w", zipfile.ZIP_DEFLATED) as zipf:
    zipf.writestr(os.path.join(project_folder, "app_secure.py"), app_secure)
    zipf.writestr(os.path.join(project_folder, "requirements.txt"), requirements)

print(f"Arquivo '{zip_filename}' criado com sucesso!")
