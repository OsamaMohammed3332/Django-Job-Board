from django.urls import path
from . import views



urlpatterns = [
    path('', views.job_list, name='jobs'),
    path('add', views.add_job, name='add_job'),
    path('<str:slug>', views.job_detail, name='job_detail'),

]