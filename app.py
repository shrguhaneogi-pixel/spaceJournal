import streamlit as st
import ollama

st.set_page_config(
    page_title="Safe-Space Journal",
    page_icon="🛡️",
    layout="centered"
)

st.title("Safe-Space Journal")
st.markdown(
    "Welcome to your private journal space.\n\n"
    "This application is **100% offline and secure**. Your journal entries and thoughts "
    "never leave your computer, ensuring complete confidentiality for your personal reflections."
)

st.divider()

user_input = st.text_area(
    "Write or paste your journal entry below:",
    height=250,
    placeholder="How are you feeling today? Share your thoughts freely..."
)

analyze_button = st.button("Analyze privately", type="primary")

if analyze_button:
    if not user_input.strip():
        st.warning("Please enter a journal entry before requesting analysis.")
    else:
        sys_prompt = "You are an objective, supportive cognitive behavioral assistant. The user will provide a journal entry. Identify any cognitive distortions (e.g., all-or-nothing thinking, catastrophizing, emotional reasoning) and gently offer a reframed perspective. Output strictly in two sections: 'Identified Patterns' and 'Reframed Perspective'. Do not be judgmental. Be warm and clinical."
        
        with st.spinner("Processing locally..."):
            try:
                response = ollama.chat(model='gemma2:2b', messages=[{'role': 'system', 'content': sys_prompt}, {'role': 'user', 'content': user_input}])
                result_content = response['message']['content']
                st.markdown("### Analysis & Perspective")
                st.markdown(result_content)
            except Exception:
                st.error("Unable to connect to the background journal analysis engine. Please ensure Ollama is installed and running on your computer, then try again.")
