import smtplib
import email.message

def enviar_email():  
    corpo_email = """
    <p>Prezado Usuário,<p>
    <p> Estamos enviando este alerta para informar que você atingiu o limite de gastos definido para este mês em sua conta na plataforma.</p>
    <p>Manter o controle financeiro é essencial para alcançar estabilidade e evitar complicações futuras. Gastos fora do planejamento podem impactar diretamente seus objetivos e qualidade de vida. Estamos aqui para ajudá-lo a manter o equilíbrio e tomar decisões conscientes sobre suas finanças.</p>
    <p>Atenciosamente,  
Equipe Smart Finance.</p>
    """

    msg = email.message.Message()
    msg['Subject'] = "Alerta de Gastos!"
    msg['From'] = 'smart.finance.contato@gmail.com'
    msg['To'] = 'jaquelineingridy19@gmail.com'
    password = 'llehnslcbgtjfsxf' 
    msg.add_header('Content-Type', 'text/html')
    msg.set_payload(corpo_email )
    
    s = smtplib.SMTP('smtp.gmail.com: 587')
    s.starttls()
    
    s.login(msg['From'], password)
    s.sendmail(msg['From'], [msg['To']], msg.as_string().encode('utf-8'))
    print('Email enviado')

enviar_email()