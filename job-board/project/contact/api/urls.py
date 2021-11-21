from django.urls import path
from . import views


urlpatterns = [
    path('', views.info_api, name='info_api'),
    path('send_message', views.send_messsage_api, name='send_messsage_api'),
]