from django.conf import settings
from django.shortcuts import redirect, render
from .models import Info
from django.core.mail import send_mail

# Create your views here.

def thanks(request):
    return render(request, "contact/thanks.html")

def send_message(request):
    my_info = Info.objects.first()
    
    if request.method == "POST":
        subject = request.POST['subject']
        email = request.POST['email']
        message = request.POST['message']
        
        send_mail(
            subject,
            message,
            email,
            [settings.EMAIL_HOST_USER],
        )
        return redirect('thanks')
    return render(request, "contact/contact.html", {'my_info': my_info})