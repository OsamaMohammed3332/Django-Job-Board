from django.urls import path
from . import views


urlpatterns = [
    # Api with Function Based Views
    path('', views.job_list_api, name='job_list_api'),
    path('create', views.job_create_api, name='job_create_api'),
    path('<str:slug>/', views.job_detail_api, name='job_detail_api'),
    path('<str:slug>/apply', views.apply_job_api, name='apply_job_api'),
    path('<str:slug>/delete', views.delete_job, name='delete_job'),

    # Api with Generic Views
    path('v2/jobs', views.job_list_with_pagination.as_view(), name='job_detail_api'),
    path('v2/jobs/filter', views.filter.as_view(), name='filter_api'),
    path('v2/jobs/<str:slug>', views.job_detail.as_view(), name='job_detail_api'),
]