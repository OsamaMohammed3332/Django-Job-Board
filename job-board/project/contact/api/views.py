from django.conf import settings
from django.core.mail import send_mail
from rest_framework import status
from rest_framework.authentication import BasicAuthentication, SessionAuthentication
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from .serializers import InfoSerializer
from contact.models import Info


@api_view(['GET', ])
def info_api(request):
    info = Info.objects.all()
    data = InfoSerializer(info, many=True).data
    return Response({'data': data})




@api_view(['POST'])
@authentication_classes([SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated,])
def send_messsage_api(request):
    if request.method == 'POST':
        subject = request.POST['subject']
        email = request.POST['email']
        message = request.POST['message']
        data = {}
        send_mail(
            subject,
            message,
            email,
            [settings.EMAIL_HOST_USER],
        )
        data['success'] = 'Thanks for contact us. We have received your message.'

        return Response(data=data)
    
    else:
        return Response(status= status.HTTP_400_BAD_REQUEST) 