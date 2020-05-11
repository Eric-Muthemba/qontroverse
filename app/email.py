from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail



def send_email(subject, sender, recipients, text_body, html_body,
               attachments=None, sync=False):
    print(str(sender))
    message = Mail(
        from_email=str(sender),
        to_emails=str(recipients[0]),
        subject=subject,
        html_content=str(html_body))

    try:
        sg = SendGridAPIClient('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')
        response = sg.send(message)
        print(response.status_code)
        print(response.body)
        print(response.headers)
    except Exception as e:
        print(e.message)
